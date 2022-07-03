import 'package:geolocator/geolocator.dart';

class PermissionAlowed {
  static Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Servive de localisation est descativée!');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Servive de localisation est refusée!');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Servive de localisation est refusée!, on peut plus accedée.');
    }
    return await Geolocator.getCurrentPosition();
  }
}
