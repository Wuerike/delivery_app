import 'package:delivery_app/src/base/app_error/app_error.dart';
import 'package:delivery_app/src/features/domain/entities/geolocation/position_entity.dart';
import 'package:delivery_app/src/services/geolocation/interfaces/interfaces.dart';
import 'package:delivery_app/src/services/geolocation/mappers/position_mapper.dart';
import 'package:delivery_app/src/utils/result_type/result_type.dart';
import 'package:geolocator/geolocator.dart';

abstract class GeolocationFailureMessages {
  // Error Messages
  static String locationServicesDisabled = "Location services are disabled.";
  static String locationPermissionsDenied = "Location permissions are denied";
  static String locationPermissionsDeniedForever =
      "Location permissions are permanently denied, we cannot request permissions.";
}

class GeolocationService extends GeolocationServiceAbstraction {
  @override
  Future<Result<PositionEntity, Failure>> getCurrentPosition() async {
    return await _determinePosition().then((position) {
      return Result.success(PositionMapper.mapPosition(position));
    }, onError: (e) {
      return Result.failure(Failure.fromMessage(message: e.toString()));
    });
  }

  /// Request permission for Geolocation in the App.
  @override
  Future<LocationPermissionStatus> getPermissionStatus() async {
    LocationPermission permission = await Geolocator.checkPermission();
    switch (permission) {
      case LocationPermission.denied:
        return LocationPermissionStatus.denied;
      case LocationPermission.deniedForever:
        return LocationPermissionStatus.deniedForever;
      case LocationPermission.whileInUse:
        return LocationPermissionStatus.allowed;
      case LocationPermission.always:
        return LocationPermissionStatus.allowed;
      case LocationPermission.unableToDetermine:
        return LocationPermissionStatus.denied;
    }
  }
}

// geolocator package methods
extension PrivateMethods on GeolocationService {
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error(GeolocationFailureMessages.locationServicesDisabled);
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error(GeolocationFailureMessages.locationPermissionsDenied);
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(GeolocationFailureMessages.locationPermissionsDeniedForever);
    }

    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }
}
