import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:sprint/model/workout.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double? latitude = workOut.startPoint.latitude;
    double? longitude = workOut.startPoint.longitude;

    double? markerLatitude = workOut.currentPoint.latitude;
    double? markerLongitude = workOut.currentPoint.longitude;

    var point = <LatLng>[

    ];

    return FlutterMap(
      options: new MapOptions(
        center: new LatLng(latitude!, longitude!),
        minZoom: 15.0,
      ),
      layers: [
        new TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c']),
        new MarkerLayerOptions(markers: [
          new Marker(
              width: 45.0,
              height: 45.0,
              point: new LatLng(latitude, longitude),
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
            Polyline(
                points: mapPoint,
                strokeWidth: 4.0,
                color: Colors.purple),
          ],
        )
      ],
    );
  }
}
