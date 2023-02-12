import 'package:delivery_app/src/base/app_error/app_error.dart';
import 'package:delivery_app/src/utils/result_type/result_type.dart';

abstract class DatabaseServiceAbstraction {
  Future<Result<Map<String, dynamic>, Failure>> getDocument(
      {required String collection, required String fieldName, required String fieldValue});
  Future<Result<Map<String, dynamic>, Failure>> addDocument(
      {required String collection, required Map<String, dynamic> body});
}
