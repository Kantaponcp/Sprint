// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:livemap/livemap.dart';
// import 'package:latlong/latlong.dart';
//
// class LiveMapPage extends StatelessWidget {
//   LiveMapPage() () {
//   mapController = MapController();
//   liveMapController = LiveMapController(
//   mapController:   mapController,
//   autoCenter: true);
//   }
//
//   MapController mapController;
//   LiveMapController liveMapController;
//
//   @override
//   Widget build(BuildContext context) {
//     return LiveMap(
//         controller: liveMapController,
//         center: LatLng(51.0, 0.0),
//         zoom: 13.0),
//     floatingActionButton: FloatingActionButton(
//     child: Icon(Icons.edit_location),
//     onPressed: () => setState(() {
//     if (markerIcon == Icons.location_on) {
//     markerIcon = Icons.airport_shuttle;
//     } else {
//     markerIcon = Icons.location_on;
//     }
//     }),
//     );
//   }
//
//   @override
//   void dispose() {
//     liveMapController.dispose();
//     super.dispose();
//   }
// }