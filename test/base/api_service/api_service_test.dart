import 'package:delivery_app/src/base/api_service/api_service.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mocks/request_body_mock.dart';

abstract class _Constants {
  static Map<String, String> defaultHeaders = {'Content-type': 'application/json; charset=UTF-8'};
  static String postEndpoint = "https://jsonplaceholder.typicode.com/posts";
  static String getEndpoint = "https://jsonplaceholder.typicode.com/posts/1";
  static String putEndpoint = "https://jsonplaceholder.typicode.com/posts/1";
}

void main() {
  final ApiService apiService = ApiService();

  group('Test Api Service connection', () {
    test('Test correct get connection to json placeholder', () async {
      final result = await apiService.get(url: _Constants.getEndpoint);

      expect(result, Map.from(result));
    });

    test('Test correct post connection to jsonplaceholder', () async {
      final params = PostBody(title: "foo", body: "bar", userId: 1);

      final result = await apiService.post(
        url: _Constants.postEndpoint,
        body: params.toMap(),
        headers: _Constants.defaultHeaders,
      );

      expect(result, Map.from(result));
    });

    test('Test correct put connection to jsonplaceholder', () async {
      final params = PutBody(id: 1, title: "foo", body: "bar", userId: 1);

      final result = await apiService.put(
        url: _Constants.putEndpoint,
        body: params.toMap(),
        headers: _Constants.defaultHeaders,
      );

      expect(result, Map.from(result));
    });
  });
}
