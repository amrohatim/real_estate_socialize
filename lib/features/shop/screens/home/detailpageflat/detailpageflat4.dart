import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Magellanmap extends StatefulWidget {
  Magellanmap({
    super.key,
    this.mapdoc,
  });
  final mapdoc;

  @override
  State<Magellanmap> createState() => _MagellanmapState(mapdoc);
}

class _MagellanmapState extends State<Magellanmap> {
  final mapdoc;
  _MagellanmapState(this.mapdoc);

  List<double>? latLng;

  getmarker() async {
    String? s;
    await FirebaseFirestore.instance
        .collection("Sale")
        .doc(mapdoc)
        .get()
        .then((value) => s = value["Map"]);
    latLng = extractLatLng(s!);
  }

  List<double> extractLatLng(String input) {
    // Remove the 'LatLng(' and ')'
    String cleanedInput = input.replaceAll('LatLng(', '').replaceAll(')', '');

    // Split the string by the comma to get latitude and longitude
    List<String> parts = cleanedInput.split(',');

    // Convert the strings to double
    double latitude = double.parse(parts[0].trim());
    double longitude = double.parse(parts[1].trim());

    return [latitude, longitude];
  }

  bool? sure = false;
  static const LatLng _oursecondposition = LatLng(34.3346, -122.0090);

  LatLng getloc() {
    double first = latLng![0];
    double second = latLng![1];
    return LatLng(first, second);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getmarker(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.blueAccent,
                  strokeWidth: 1,
                ),
              );
            } else {
              return GoogleMap(
                mapToolbarEnabled: true,
                scrollGesturesEnabled: true,
                initialCameraPosition: CameraPosition(
                  target: getloc(),
                  zoom: 13,
                ),
                markers: {
                  Marker(
                    markerId: MarkerId("_currentlocation"),
                    icon: BitmapDescriptor.defaultMarker,
                    position: getloc(),
                  ),
                },
              );
            }
          }),
    );
  }
}
