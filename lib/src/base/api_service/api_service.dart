import 'dart:convert';
import 'dart:io';
import 'package:delivery_app/src/base/app_error/app_error.dart';
import 'package:http/http.dart' as http;

abstract class ApiServiceAbstraction {
  Future<Map<String, dynamic>> get({
    required String url,
    Map<String, String>? headers,
  });

  Future<Map<String, dynamic>> post({
    required String url,
    required Map<String, dynamic> body,
    Map<String, String>? headers,
  });

  Future<Map<String, dynamic>> put({
    required String url,
    required Map<String, dynamic> body,
    Map<String, String>? headers,
  });
}

abstract class _Exceptions {
  static String socketExceptionMessage = "No Internet connection 😑";
  static String httpException = "Couldn't find the path 😱";
  static String formatException = "Bad response format 👎";
}

class ApiService extends ApiServiceAbstraction {
  @override
  Future<Map<String, dynamic>> get({required String url, Map<String, String>? headers}) async {
    try {
      final uri = Uri.parse(url);
      final response = await http.get(uri, headers: headers);

      if ((response.statusCode ~/ 100) == 2) {
        var jsonResponse = jsonDecode(response.body);

        if (jsonResponse == null) {
          throw Failure.fromMessage(message: _Exceptions.formatException);
        } else {
          return jsonResponse;
        }
      } else {
        throw Failure.fromBody(body: response.body);
      }
    } on SocketException {
      throw Failure.fromMessage(message: _Exceptions.socketExceptionMessage);
    } on HttpException {
      throw Failure.fromMessage(message: _Exceptions.httpException);
    } on FormatException {
      throw Failure.fromMessage(message: _Exceptions.formatException);
    }
  }

  @override
  Future<Map<String, dynamic>> post({
    required String url,
    required Map<String, dynamic> body,
    Map<String, String>? headers,
  }) async {
    try {
      final uri = Uri.parse(url);
      final response = await http.post(uri, headers: headers, body: jsonEncode(body));

      if ((response.statusCode ~/ 100) == 2) {
        var jsonResponse = jsonDecode(response.body);

        if (jsonResponse == null) {
          throw Failure.fromMessage(message: _Exceptions.formatException);
        } else {
          return jsonResponse;
        }
      } else {
        throw Failure.fromBody(body: response.body);
      }
    } on SocketException {
      throw Failure.fromMessage(message: _Exceptions.socketExceptionMessage);
    } on HttpException {
      throw Failure.fromMessage(message: _Exceptions.httpException);
    } on FormatException {
      throw Failure.fromMessage(message: _Exceptions.formatException);
    }
  }

  @override
  Future<Map<String, dynamic>> put(
      {required String url, required Map<String, dynamic> body, Map<String, String>? headers}) async {
    final uri = Uri.parse(url);
    final response = await http.put(uri, headers: headers, body: jsonEncode(body));

    try {
      if ((response.statusCode ~/ 100) == 2) {
        var jsonResponse = jsonDecode(response.body);

        if (jsonResponse == null) {
          throw Failure.fromMessage(message: _Exceptions.formatException);
        } else {
          return jsonResponse;
        }
      } else {
        throw Failure.fromBody(body: response.body);
      }
    } on SocketException {
      throw Failure.fromMessage(message: _Exceptions.socketExceptionMessage);
    } on HttpException {
      throw Failure.fromMessage(message: _Exceptions.httpException);
    } on FormatException {
      throw Failure.fromMessage(message: _Exceptions.formatException);
    }
  }
}
