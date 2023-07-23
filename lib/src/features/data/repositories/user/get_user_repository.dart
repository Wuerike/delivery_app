// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:delivery_app/src/base/app_error/app_error.dart';
import 'package:delivery_app/src/features/data/interfaces/interfaces.dart';
import 'package:delivery_app/src/features/domain/entities/user/user_entity.dart';
import 'package:delivery_app/src/services/firebase_services/database_service/interfaces/interfaces.dart';
import 'package:delivery_app/src/services/firebase_services/database_service/services/database_service.dart';
import 'package:delivery_app/src/utils/result_type/result_type.dart';

class GetUserRepository extends GetUserRepositoryAbstraction {
  final DatabaseServiceAbstraction database;

  GetUserRepository({DatabaseServiceAbstraction? database}) : database = database ?? DatabaseService();

  @override
  Future<Result<UserEntity, Failure>> getUser({required String userId}) {
    return database.getDocument(collection: "users", fieldName: "userId", fieldValue: userId).then(
      (result) {
        switch (result.status) {
          case ResultStatus.success:
            var entity = UserEntity.fromMap(result.value!);
            return Result.success(entity);
          case ResultStatus.error:
            return Result.failure(result.error);
        }
      },
    );
  }
}
