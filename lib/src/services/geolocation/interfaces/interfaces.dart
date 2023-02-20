import 'package:delivery_app/src/base/app_error/app_error.dart';
import 'package:delivery_app/src/features/domain/entities/geolocation/position_entity.dart';
import 'package:delivery_app/src/utils/result_type/result_type.dart';

abstract class GeolocationServiceAbstraction {
  Future<Result<PositionEntity, Failure>> getCurrentPosition();
  Future<LocationPermissionStatus> getPermissionStatus();
}

abstract class GeolocationDistanceServiceAbstraction {
  double getDistanceBetweenInMetters(
      double startLatitude, double startLongitude, double destinationLatitude, double destinationLongitude);
  double getDistanceBetweenInKilometters(
      double startLatitude, double startLongitude, double destinationLatitude, double destinationLongitude);
}
