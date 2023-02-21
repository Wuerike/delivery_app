import 'package:delivery_app/src/base/app_error/app_error.dart';
import 'package:delivery_app/src/features/domain/entities/geolocation/position_entity.dart';
import 'package:delivery_app/src/services/geolocation/interfaces/interfaces.dart';
import 'package:delivery_app/src/services/geolocation/services/geolocation_distance_service.dart';
import 'package:delivery_app/src/services/geolocation/services/geolocation_service_mock.dart';
import 'package:delivery_app/src/utils/result_type/result_type.dart';

abstract class GeolocationUsecaseAbstraction {
  Future<Result<PositionEntity, Failure>> getCurrentPosition();
  Future<LocationPermissionStatus> getPermissionStatus();
  Future<double> getDestinationDistance(double destinationLatitude, double destinationLongitude);
}

class GeolocationUsecase extends GeolocationUsecaseAbstraction {
  // Dependencies
  final GeolocationServiceAbstraction _geolocationService;
  final GeolocationDistanceServiceAbstraction _geolocationDistanceService;

  GeolocationUsecase(
      {GeolocationServiceAbstraction? geolocationService,
      GeolocationDistanceServiceAbstraction? geolocationDistanceService})
      : _geolocationService =
            geolocationService ?? GeolocationServiceMock(), // TODO: Using of mock with fake data remove it later
        _geolocationDistanceService = geolocationDistanceService ?? GeolocationDistanceService();

  @override
  Future<Result<PositionEntity, Failure>> getCurrentPosition() {
    return _geolocationService.getCurrentPosition();
  }

  @override
  Future<LocationPermissionStatus> getPermissionStatus() async {
    final status = await _geolocationService.getPermissionStatus();
    return status;
  }

  @override
  Future<double> getDestinationDistance(double destinationLatitude, double destinationLongitude) async {
    final currentPosition = await _geolocationService.getCurrentPosition();
    final distance = _geolocationDistanceService.getDistanceBetweenInKilometters(
      currentPosition.value?.latitude ?? 0.0,
      currentPosition.value?.longitude ?? 0.0,
      destinationLatitude,
      destinationLongitude,
    );
    return distance;
  }
}
