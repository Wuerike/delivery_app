import 'package:delivery_app/src/services/firebase_services/auth_service/interfaces/interfaces.dart';

class UpdatePasswordService extends UpdatePasswordServiceAbstraction {
  @override
  Future<Map<String, dynamic>> updatePassword({required String email}) {
    final body = {
      "requestType": "PASSWORD_RESET",
      "email": email,
    };

    return apiService.post(url: endpoint, body: body);
  }
}
