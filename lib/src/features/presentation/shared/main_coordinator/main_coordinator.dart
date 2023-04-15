// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:delivery_app/src/base/constants/local_storage_keys.dart';
import 'package:delivery_app/src/features/domain/usecases/local_storage/local_storage_usecase.dart';
import 'package:delivery_app/src/features/domain/usecases/user/validate_current_user/validate_user_usecase.dart';
import 'package:delivery_app/src/routes/routes.dart';
import 'package:delivery_app/src/utils/result_type/result_type.dart';

class MainCoordinator {
  // Dependencies
  final LocalStorageUsecaseAbstraction localStorageUsecase;
  final ValidateUserUsecaseAbstraction validateUserUsecase;

  MainCoordinator({
    LocalStorageUsecaseAbstraction? localStorageUsecase,
    ValidateUserUsecaseAbstraction? validateUserUsecase,
  })  : localStorageUsecase = localStorageUsecase ?? LocalStorageUsecase(),
        validateUserUsecase = validateUserUsecase ?? ValidateUserUsecase();

  Future<String> start() async {
    // TODO: Sincethe value is not used it could return a bool
    return _isUserLogged().then((value) {
      return value == null ? RoutesPaths.welcome : RoutesPaths.home;
    });
  }

  Future<String?> _isUserLogged() async {
    return localStorageUsecase.executeGet(key: LocalStorageKeys.idToken).then(
      (result) async {
        switch (result.status) {
          case ResultStatus.success:
            // User has no register at local storage
            final idToken = result.value;
            if (idToken == null) {
              return null;
            }

            // Check if the found idToken exists on firebase
            return validateUserUsecase.execute(idToken: idToken).then(
              (result) {
                switch (result.status) {
                  case ResultStatus.success:
                    if (result.value == true) {
                      return idToken;
                    } else {
                      return null;
                    }
                  case ResultStatus.error:
                    // TODO: This case should not happen yet
                    return null;
                }
              },
            );

          case ResultStatus.error:
            return null;
        }
      },
    );
  }
}
