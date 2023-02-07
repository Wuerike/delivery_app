abstract class BaseDatabaseServiceAbstraction {
  String baseUrl = "/projects/delivery-app-f0e5b/databases/(default)/documents/";
  //TODO: Please change this admin token for yours. ;)
  String adminToken = "AIzaSyCaA1EYAlqoylaDRaaw3YU0lSuxYO7jRQk";
}

abstract class DatabaseServiceAbstraction extends BaseDatabaseServiceAbstraction {
  Future<Map<String, dynamic>> postData({required Map<String, dynamic> body, required String path});
  Future<Map<String, dynamic>> getData({required String path});
}
