import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:sprint/model/global_variable.dart';
import 'package:sprint/model/list_workout.dart';
import 'package:sprint/model/workout.dart';
import 'package:sprint/style/color.dart';
import 'package:location/location.dart';
import 'package:sprint/utils/workout_preferences.dart';

class MapWidget extends StatefulWidget {
  // final int? workoutIndex;

  const MapWidget({
    Key? key,
  }) : super(key: key);

  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  @override
  void initState() {
    super.initState();
    mapController = MapController();
    setState(() {});
  }

  late final MapController mapController;

  var interActiveFlags = InteractiveFlag.all;

  @override
  Widget build(BuildContext context) {
    // List<LatLng> currentLatLng;
    // var currentLatLng = (widget.workoutIndex == null)
    //     ? LatLng(
    //         currentWorkout.mapPoints.last.latitude,
    //         currentWorkout.mapPoints.last.longitude,
    //       )
    //     : LatLng(
    //         listWorkout.workouts[widget.workoutIndex!].mapPoints.last.latitude,
    //         listWorkout.workouts[widget.workoutIndex!].mapPoints.last.longitude,
    //       );
    var currentLatLng = LatLng(
      currentWorkout.mapPoints!.last.latitude,
      currentWorkout.mapPoints!.last.longitude,
    );

    var firstLatLng = LatLng(
      currentWorkout.mapPoints!.first.latitude,
      currentWorkout.mapPoints!.first.longitude,
    );

    List<LatLng> point = currentWorkout.mapPoints!
        .map((pair) => LatLng(pair.latitude, pair.longitude))
        .toList();
    // var points = <LatLng>[
    //   LatLng(cur, currentWorkout.mapPoints!.last.latitude,)
    //
    // ];

    return FlutterMap(
      mapController: mapController,
      options: new MapOptions(
        center: currentLatLng,
        minZoom: 15.0,
        interactiveFlags: interActiveFlags,
      ),
      layers: [
        new TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c']),
        new MarkerLayerOptions(markers: [
          Marker(
            point: firstLatLng,
            builder: (context) => IconButton(
              icon: Icon(Icons.location_on),
              color: Colors.black,
              iconSize: 30.0,
              onPressed: () {
              },
            ),
          ),
          new Marker(
              // width: 45.0,
              // height: 45.0,
            rotateAlignment: AlignmentDirectional.centerEnd,
              point: currentLatLng,
              builder: (context) => new Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: IconButton(
                      icon: Icon(Icons.radio_button_checked_outlined),
                      color: Colors.red,
                      iconSize: 40.0,
                      onPressed: () {
                      },
                    ),
                  ))
        ]),
        PolylineLayerOptions(
          polylines: [
            Polyline(
                points: point,
                // (widget.workoutIndex == null)
                //     ? currentWorkout.mapPoints
                //     : listWorkout.workouts[widget.workoutIndex!].mapPoints,
                strokeWidth: 5.0,
                color: SprintColors.red),
          ],
        )
      ],
    );
  }
}

class MapIndexWidget extends StatefulWidget {
  final int workoutIndex;

  const MapIndexWidget({
    Key? key, required this.workoutIndex,
  }) : super(key: key);

  @override
  _MapIndexWidgetState createState() => _MapIndexWidgetState();
}

class _MapIndexWidgetState extends State<MapIndexWidget> {
  @override
  void initState() {
    super.initState();
    mapController = MapController();
    setState(() {});
  }

  late final MapController mapController;

  var interActiveFlags = InteractiveFlag.all;

  @override
  Widget build(BuildContext context) {
    // List<LatLng> currentLatLng;
    // var currentLatLng = (widget.workoutIndex == null)
    //     ? LatLng(
    //         currentWorkout.mapPoints.last.latitude,
    //         currentWorkout.mapPoints.last.longitude,
    //       )
    //     : LatLng(
    //         listWorkout.workouts[widget.workoutIndex!].mapPoints.last.latitude,
    //         listWorkout.workouts[widget.workoutIndex!].mapPoints.last.longitude,
    //       );
    var currentLatLng = LatLng(
      listWorkout.workouts[widget.workoutIndex].mapPoints!.last.latitude,
      listWorkout.workouts[widget.workoutIndex].mapPoints!.last.longitude,
    );

    var firstLatLng = LatLng(
      listWorkout.workouts[widget.workoutIndex].mapPoints!.first.latitude,
      listWorkout.workouts[widget.workoutIndex].mapPoints!.first.longitude,
    );

    List<LatLng> point = listWorkout.workouts[widget.workoutIndex].mapPoints!
        .map((pair) => LatLng(pair.latitude, pair.longitude))
        .toList();
    // var points = <LatLng>[
    //   LatLng(cur, currentWorkout.mapPoints!.last.latitude,)
    //
    // ];

    return FlutterMap(
      mapController: mapController,
      options: new MapOptions(
        center: currentLatLng,
        minZoom: 15.0,
        interactiveFlags: interActiveFlags,
      ),
      layers: [
        new TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c']),
        new MarkerLayerOptions(markers: [
          Marker(
            point: firstLatLng,
            builder: (context) => IconButton(
              icon: Icon(Icons.location_on),
              color: Colors.black,
              iconSize: 30.0,
              onPressed: () {
              },
            ),
          ),
          new Marker(
            // width: 45.0,
            // height: 45.0,
              rotateAlignment: AlignmentDirectional.centerEnd,
              point: currentLatLng,
              builder: (context) => new Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: IconButton(
                  icon: Icon(Icons.radio_button_checked_outlined),
                  color: Colors.red,
                  iconSize: 40.0,
                  onPressed: () {
                  },
                ),
              ))
        ]),
        PolylineLayerOptions(
          polylines: [
            Polyline(
                points: point,
                // (widget.workoutIndex == null)
                //     ? currentWorkout.mapPoints
                //     : listWorkout.workouts[widget.workoutIndex!].mapPoints,
                strokeWidth: 5.0,
                color: SprintColors.red),
          ],
        )
      ],
    );
  }
}

