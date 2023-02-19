import 'package:delivery_app/src/base/app_error/app_error.dart';
import 'package:delivery_app/src/features/data/interfaces/interfaces.dart';
import 'package:delivery_app/src/features/domain/entities/user/user_entity.dart';
import 'package:delivery_app/src/services/firebase_services/database_service/interfaces/interfaces.dart';
import 'package:delivery_app/src/services/firebase_services/database_service/services/database_service.dart';
import 'package:delivery_app/src/utils/result_type/result_type.dart';

class SaveUserRepository extends SaveUserRepositoryAbstraction {
  // * Dependencies
  final DatabaseServiceAbstraction database;

  SaveUserRepository({DatabaseServiceAbstraction? database}) : database = database ?? DatabaseService();

  @override
  Future<Result<UserEntity, Failure>> saveUser({required UserEntity user}) async {
    return database.addDocument(collection: "users", body: user.toMap()).then(
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
