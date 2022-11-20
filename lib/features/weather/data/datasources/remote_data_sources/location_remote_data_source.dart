import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

abstract class LocationRemoteDataSource {
  Future<Placemark>? getDataLocation();
}

class LocationDataSourceImpl implements LocationRemoteDataSource {
  final http.Client client;

  LocationDataSourceImpl({required this.client});

  @override
  Future<Placemark>? getDataLocation() {
    return _getLocationData();
  }

  Future<Placemark> _getLocationData() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position location = await Geolocator.getCurrentPosition();
    
    List<Placemark>? positions =
        await placemarkFromCoordinates(location.latitude, location.longitude);

    return positions[0];
  }
}
