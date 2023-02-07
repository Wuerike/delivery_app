import 'package:delivery_app/src/base/api_service/api_service.dart';
import 'package:delivery_app/src/base/app_error/app_error.dart';
import 'package:delivery_app/src/services/firebase_services/database_service/interfaces/interfaces.dart';

class DatabaseService extends DatabaseServiceAbstraction {
  final ApiServiceAbstraction _apiService;

  DatabaseService({required ApiServiceAbstraction apiService}) : _apiService = apiService;

  @override
  Future<Map<String, dynamic>> getData({required String path}) async {
    var endpoint = baseUrl + path;
    try {
      final result = await _apiService.get(url: endpoint);
      return result;
    } on Failure catch (f) {
      return f.error;
    }
  }

  @override
  Future<Map<String, dynamic>> postData({required Map<String, dynamic> body, required String path}) async {
    var endpoint = baseUrl + path;
    try {
      final result = await _apiService.post(body: body, url: endpoint);
      return result;
    } on Failure catch (f) {
      return f.error;
    }
  }
}
