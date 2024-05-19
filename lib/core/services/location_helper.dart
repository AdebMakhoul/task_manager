import 'package:geocoding/geocoding.dart' as geo;
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';

@injectable
class LocationHelper {
  LocationData? _locationData;

  LocationData? get location => _locationData;

  getLocation() async {
    print("najati");
    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
  }

  Future<geo.Placemark> getLocationDiscriptionFromLatLng({
    required double lat,
    required double long,
  }) async {
    var res = await geo.placemarkFromCoordinates(lat, long,
        localeIdentifier: 'en_US');

    return res[0];
  }
}
