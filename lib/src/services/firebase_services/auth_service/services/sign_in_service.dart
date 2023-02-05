import 'package:delivery_app/src/services/firebase_services/auth_service/interfaces/interfaces.dart';

class SignInService extends SignInServiceAbstraction {
  @override
  Future<Map<String, dynamic>> signIn({required Map<String, dynamic> body}) async {
    return apiService.post(url: endpoint, body: body);
  }
}
