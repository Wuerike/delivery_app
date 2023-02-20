import 'package:delivery_app/src/features/domain/entities/geolocation/position_entity.dart';
import 'package:geolocator/geolocator.dart';

class PositionMapper {
  static PositionEntity mapPosition(Position position) {
    return PositionEntity(
      longitude: position.longitude,
      latitude: position.latitude,
      timestamp: position.timestamp,
      accuracy: position.accuracy,
      altitude: position.altitude,
      heading: position.heading,
      speed: position.speed,
      speedAccuracy: position.speedAccuracy,
    );
  }
}
