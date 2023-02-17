import 'package:delivery_app/src/base/app_error/app_error.dart';
import 'package:delivery_app/src/base/constants/error_messages.dart';
import 'package:delivery_app/src/features/data/interfaces/interfaces.dart';
import 'package:delivery_app/src/utils/result_type/result_type.dart';

abstract class LocalStorageUsecaseAbstraction {
  Future<Result<bool, Failure>> executeSave({required String key, required String value});
  Future<Result<String, Failure>> executeGet({required String key});
  Future<Result<bool, Failure>> executeRemove({required String key});
}

class LocalStorageUsecase extends LocalStorageUsecaseAbstraction {
  final LocalStorageRepositoryAbstraction _repository;

  LocalStorageUsecase({required LocalStorageRepositoryAbstraction repository}) : _repository = repository;

  @override
  Future<Result<bool, Failure>> executeSave({required String key, required String value}) {
    return _repository.save(key: key, value: value).then((result) => result);
  }

  @override
  Future<Result<String, Failure>> executeGet({required String key}) {
    return _repository.get(key: key).then((result) {
      switch (result.status) {
        case ResultStatus.success:
          // Null Check
          if (result.value == null) {
            return Result.failure(Failure.fromMessage(message: AppFailureMessages.unexpectedErrorMessage));
          }

          return Result.success(result.value);
        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });
  }

  @override
  Future<Result<bool, Failure>> executeRemove({required String key}) {
    return _repository.remove(key: key).then((result) => result);
  }
}
