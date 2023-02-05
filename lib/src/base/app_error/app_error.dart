import 'dart:convert';

class Failure {
  String? message;
  Map<String, dynamic> error = {};

  Failure.fromMessage({String? message}) {
    this.message = message;
  }

  Failure.fromBody({required String body}) {
    var jsonData = jsonDecode(body);
    error = jsonData;
  }

  @override
  String toString() => message ?? "";
}
