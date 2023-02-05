import 'package:delivery_app/src/services/firebase_services/auth_service/interfaces/interfaces.dart';

class SignUpService extends SignUpServiceAbstraction {
  @override
  Future<Map<String, dynamic>> signUp({required Map<String, dynamic> body}) async {
    return apiService.post(url: endpoint, body: body);
  }
}
