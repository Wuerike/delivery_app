import 'package:delivery_app/src/base/api_service/api_service.dart';

abstract class BaseAuthFirebaseService {
  ApiServiceAbstraction apiService = ApiService();
  static String baseUrl = "https://identitytoolkit.googleapis.com/v1/";
  static String adminToken = "AIzaSyCaA1EYAlqoylaDRaaw3YU0lSuxYO7jRQk";
  static String signUpEndpoint = "accounts:signUp?key=$adminToken";
  static String signInEndpoint = "accounts:signInWithPassword?key=$adminToken";
  static String updatePasswordEndpoint = "accounts:sendOobCode?key=$adminToken";
}

abstract class SignUpServiceAbstraction extends BaseAuthFirebaseService {
  String endpoint = BaseAuthFirebaseService.baseUrl + BaseAuthFirebaseService.signUpEndpoint;
  Future<Map<String, dynamic>> signUp({required Map<String, dynamic> body});
}

abstract class SignInServiceAbstraction extends BaseAuthFirebaseService {
  String endpoint = BaseAuthFirebaseService.baseUrl + BaseAuthFirebaseService.signInEndpoint;
  Future<Map<String, dynamic>> signIn({required Map<String, dynamic> body});
}

abstract class UpdatePasswordServiceAbstraction extends BaseAuthFirebaseService {
  String endpoint = BaseAuthFirebaseService.baseUrl + BaseAuthFirebaseService.updatePasswordEndpoint;
  Future<Map<String, dynamic>> updatePassword({required String email});
}
