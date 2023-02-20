import 'package:delivery_app/src/services/geolocation/interfaces/interfaces.dart';
import 'package:geolocator/geolocator.dart';

class GeolocationDistanceService extends GeolocationDistanceServiceAbstraction {
  @override
  double getDistanceBetweenInMetters(
    double startLatitude,
    double startLongitude,
    double destinationLatitude,
    double destinationLongitude,
  ) {
    double distanceInMeters = Geolocator.distanceBetween(
      startLatitude,
      startLongitude,
      destinationLatitude,
      destinationLongitude,
    );

    return distanceInMeters;
  }

  @override
  double getDistanceBetweenInKilometters(
    double startLatitude,
    double startLongitude,
    double destinationLatitude,
    double destinationLongitude,
  ) {
    double distanceInMeters = Geolocator.distanceBetween(
      startLatitude,
      startLongitude,
      destinationLatitude,
      destinationLongitude,
    );

    return distanceInMeters / 1000;
  }
}
