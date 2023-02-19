import 'package:delivery_app/src/base/app_error/app_error.dart';
import 'package:delivery_app/src/base/constants/local_storage_keys.dart';
import 'package:delivery_app/src/features/domain/usecases/local_storage/local_storage_usecase.dart';
import 'package:delivery_app/src/utils/result_type/result_type.dart';

abstract class SignOutUsecaseAbstraction {
  Future<Result<bool, Failure>> execute();
}

class SignOutUsecase extends SignOutUsecaseAbstraction {
  // Dependencies
  final LocalStorageUsecaseAbstraction localStorageUsecase;

  SignOutUsecase({
    LocalStorageUsecaseAbstraction? localStorageUsecase,
  }) : localStorageUsecase = localStorageUsecase ?? LocalStorageUsecase();

  @override
  Future<Result<bool, Failure>> execute() async {
    return localStorageUsecase.executeRemove(key: LocalStorageKeys.idToken);
  }
}
