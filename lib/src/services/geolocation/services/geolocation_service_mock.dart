import 'package:delivery_app/src/base/app_error/app_error.dart';
import 'package:delivery_app/src/features/domain/entities/geolocation/position_entity.dart';
import 'package:delivery_app/src/services/geolocation/interfaces/interfaces.dart';
import 'package:delivery_app/src/services/geolocation/mappers/position_mapper.dart';
import 'package:delivery_app/src/services/geolocation/services/geolocation_service.dart';
import 'package:delivery_app/src/utils/result_type/result_type.dart';
import 'package:geolocator/geolocator.dart';

class GeolocationServiceMock extends GeolocationServiceAbstraction {
  @override
  Future<Result<PositionEntity, Failure>> getCurrentPosition() async {
    final permisionStatus = await getPermissionStatus();
    if (permisionStatus == LocationPermissionStatus.allowed) {
      // Fake position at Jaraguá do Sul/Brasil
      var fakePosition = const Position(
        longitude: -49.089619,
        latitude: -26.493000,
        timestamp: null,
        accuracy: 0.0,
        altitude: 0.0,
        heading: 0.0,
        speed: 0.0,
        speedAccuracy: 0.0,
      );

      return Result.success(PositionMapper.mapPosition(fakePosition));
    } else {
      return Future.error(GeolocationFailureMessages.locationPermissionsDenied);
    }
  }

  @override
  Future<LocationPermissionStatus> getPermissionStatus() async {
    return LocationPermissionStatus.allowed;
  }
}
