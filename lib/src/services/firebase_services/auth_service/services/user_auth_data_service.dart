import 'package:delivery_app/src/services/firebase_services/auth_service/interfaces/interfaces.dart';

class UserAuthDataService extends UserAuthDataServiceAbstraction {
  @override
  Future<Map<String, dynamic>> getData({required String idToken}) {
    final body = {
      "idToken": idToken,
    };

    return apiService.post(url: endpoint, body: body);
  }
}
