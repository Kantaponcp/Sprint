import 'package:location/location.dart';

// ignore: camel_case_types
class checkGpsHelper{
  Location location = new Location();
  late bool serviceEnabled;
  late PermissionStatus permissionGranted;

  Future checkGps() async {
    permissionGranted = await location.hasPermission();

    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    if (!await location.serviceEnabled()) {
      location.requestService();
    }
  }
}
