import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:sprint/model/workout.dart';
import 'package:sprint/style/color.dart';
import 'package:location/location.dart';

class MapWidget extends StatefulWidget {
  // const ({Key? key}) : super(key: key);

  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget>{
  @override
  void initState() {
    super.initState();
    mapController = MapController();
    setState(() {

    });
  }

  late final MapController mapController;

  var interActiveFlags = InteractiveFlag.all;

  @override
  Widget build(BuildContext context) {

    LatLng currentLatLng;
    currentLatLng =
          LatLng(mapPoint.last.latitude, mapPoint.last.longitude);

    double? markerLatitude = workout.currentPoint.latitude;
    double? markerLongitude = workout.currentPoint.longitude;

    var point = <LatLng>[];

    return FlutterMap(
      mapController: mapController,
      options: new MapOptions(
        center: LatLng(currentLatLng.latitude, currentLatLng.longitude),
        minZoom: 15.0,
        interactiveFlags: interActiveFlags,
      ),
      layers: [
        new TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c']),
        new MarkerLayerOptions(markers: [
          new Marker(
              width: 45.0,
              height: 45.0,
              point: new LatLng(currentLatLng.latitude, currentLatLng.longitude),
              builder: (context) => new Container(
                child: IconButton(
                  icon: Icon(Icons.location_on),
                  color: Colors.red,
                  iconSize: 45.0,
                  onPressed: () {
                    print('Marker tapped');
                  },
                ),
              ))
        ]),
        PolylineLayerOptions(
          polylines: [
            Polyline(points: mapPoint, strokeWidth: 5.0, color: SprintColors.red),
          ],
        )
      ],
    );
  }
}

class CurrentLocation extends StatefulWidget {
  const CurrentLocation({
    Key? key,
    required this.mapController,
  }) : super(key: key);

  final MapController mapController;

  @override
  _CurrentLocationState createState() => _CurrentLocationState();
}

class _CurrentLocationState extends State<CurrentLocation> {
  int _eventKey = 0;

  var icon = Icons.gps_not_fixed;
  late final StreamSubscription<MapEvent> mapEventSubscription;

  @override
  void initState() {
    super.initState();

    mapEventSubscription =
        widget.mapController.mapEventStream.listen(onMapEvent);
  }

  @override
  void dispose() {
    mapEventSubscription.cancel();
    super.dispose();
  }

  void setIcon(IconData newIcon) {
    if (newIcon != icon && mounted) {
      setState(() {
        icon = newIcon;
      });
    }
  }

  void onMapEvent(MapEvent mapEvent) {
    if (mapEvent is MapEventMove && mapEvent.id == _eventKey.toString()) {
      setIcon(Icons.gps_not_fixed);
    }
  }

  void _moveToCurrent() async {
    _eventKey++;
    var location = Location();

    try {
      var currentLocation = await location.getLocation();
      var moved = widget.mapController.move(
        LatLng(currentLocation.latitude!, currentLocation.longitude!),
        18,
        id: _eventKey.toString(),
      );

      if (moved) {
        setIcon(Icons.gps_fixed);
      } else {
        setIcon(Icons.gps_not_fixed);
      }
    } catch (e) {
      setIcon(Icons.gps_off);
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      onPressed: _moveToCurrent,
    );
  }
}

// class MapWidget extends StatelessWidget {
//   const MapWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     double? latitude = mapPoint.last.latitude;
//     double? longitude = mapPoint.last.longitude;
//
//     double? markerLatitude = workout.currentPoint.latitude;
//     double? markerLongitude = workout.currentPoint.longitude;
//
//     var point = <LatLng>[];
//
//     return FlutterMap(
//       options: new MapOptions(
//         center: new LatLng(latitude, longitude),
//         minZoom: 15.0,
//       ),
//       layers: [
//         new TileLayerOptions(
//             urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
//             subdomains: ['a', 'b', 'c']),
//         new MarkerLayerOptions(markers: [
//           new Marker(
//               width: 45.0,
//               height: 45.0,
//               point: new LatLng(latitude, longitude),
//               builder: (context) => new Container(
//                     child: IconButton(
//                       icon: Icon(Icons.location_on),
//                       color: Colors.red,
//                       iconSize: 45.0,
//                       onPressed: () {
//                         print('Marker tapped');
//                       },
//                     ),
//                   ))
//         ]),
//         PolylineLayerOptions(
//           polylines: [
//             Polyline(points: mapPoint, strokeWidth: 4.0, color: SprintColors.red),
//           ],
//         )
//       ],
//     );
//   }
// }
