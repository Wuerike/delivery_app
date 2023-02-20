import 'package:delivery_app/src/services/firebase_services/auth_service/interfaces/interfaces.dart';

class UpdatePasswordService extends UpdatePasswordServiceAbstraction {
  @override
  Future<Map<String, dynamic>> updatePassword({required String email}) async {
    final body = {
      "requestType": "PASSWORD_RESET",
      "email": email,
    };

    return await apiService.post(url: endpoint, body: body);
  }
}
