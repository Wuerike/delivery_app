import 'package:delivery_app/src/base/app_error/app_error.dart';
import 'package:delivery_app/src/base/views/base_view.dart';
import 'package:delivery_app/src/features/domain/entities/geolocation/position_entity.dart';
import 'package:delivery_app/src/features/domain/usecases/Geolocation/geolocation_usecase.dart';
import 'package:delivery_app/src/features/presentation/shared/state_providers/loading_state_provider.dart';
import 'package:delivery_app/src/utils/result_type/result_type.dart';

abstract class HomeViewModelInput {
  // Exposed Methods
  Future<Result<bool, Failure>> getCurrentPosition();
  Future<LocationPermissionStatus> getPermissionStatus();
}

abstract class HomeViewModelAbstraction extends HomeViewModelInput with BaseViewModel {}

class HomeViewModel extends HomeViewModelAbstraction {
  final GeolocationUsecaseAbstraction geolocationUsecase;

  HomeViewModel({GeolocationUsecaseAbstraction? geolocationUsecase})
      : geolocationUsecase = geolocationUsecase ?? GeolocationUsecase();

  @override
  void initState({required LoadingStateProvider loadingState}) {
    loadingStatusState = loadingState;
  }

  @override
  Future<Result<bool, Failure>> getCurrentPosition() async {
    return geolocationUsecase.getCurrentPosition().then((result) {
      switch (result.status) {
        case ResultStatus.success:
          return Result.success(true);
        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });
  }

  @override
  Future<LocationPermissionStatus> getPermissionStatus() {
    return geolocationUsecase.getPermissionStatus();
  }
}
