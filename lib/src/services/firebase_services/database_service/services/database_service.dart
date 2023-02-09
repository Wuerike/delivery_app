import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/src/base/app_error/app_error.dart';
import 'package:delivery_app/src/base/constants/error_messages.dart';
import 'package:delivery_app/src/services/firebase_services/database_service/interfaces/interfaces.dart';
import 'package:delivery_app/src/utils/result_type/result_type.dart';

class DatabaseService extends DatabaseServiceAbstraction {
  final db = FirebaseFirestore.instance;

  DatabaseService();

  @override
  Future<Result<Map<String, dynamic>, Failure>> getDocument({required String collection, required String id}) async {
    try {
      return db.collection(collection).doc(id).get().then(
        (documentSnapshot) {
          var data = documentSnapshot.data() ?? {};

          if (data.isEmpty) {
            return Result.failure(Failure.fromMessage(message: AppFailureMessages.unexpectedErrorMessage));
          }

          return Result.success(data);
        },
      );
    } on Failure catch (f) {
      return Result.failure(f);
    }
  }

  @override
  Future<Result<Map<String, dynamic>, Failure>> addDocument({
    required String collection,
    required Map<String, dynamic> body,
  }) async {
    try {
      return db.collection(collection).add(body).then(
        (documentReference) {
          return documentReference.get().then(
            (documentSnapshot) {
              var data = documentSnapshot.data() ?? {};

              if (data.isEmpty) {
                return Result.failure(Failure.fromMessage(message: AppFailureMessages.unexpectedErrorMessage));
              }

              return Result.success(data);
            },
          );
        },
      );
    } on Failure catch (f) {
      return Result.failure(f);
    }
  }
}
