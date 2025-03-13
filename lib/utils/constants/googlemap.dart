import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Mygooglemap extends StatefulWidget {
  Mygooglemap({
    super.key,
  });

  @override
  State<Mygooglemap> createState() => _MygooglemapState();
}

class _MygooglemapState extends State<Mygooglemap> {
  LatLng? ourfirstposition;
  bool? sure = false;
  static const LatLng _oursecondposition = LatLng(37.3346, -122.0090);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
          title: Text(
            "Mark your estate location",
            style: GoogleFonts.notoSansAdlam(fontSize: 20),
          ),
        ),
        body: Column(
          children: [
            Container(
              height: 670,
              width: double.infinity,
              child: GoogleMap(
                mapToolbarEnabled: true,
                scrollGesturesEnabled: true,
                onTap: (argument) {
                  ourfirstposition = argument;
                  setState(() {});
                },
                initialCameraPosition: CameraPosition(
                  target: _oursecondposition,
                  zoom: 13,
                ),
                markers: {
                  Marker(
                      markerId: MarkerId("_currentlocation"),
                      icon: BitmapDescriptor.defaultMarker,
                      position: ourfirstposition == null
                          ? _oursecondposition
                          : ourfirstposition!),
                },
              ),
            ),
            Container(
              color: Colors.blueAccent,
              width: double.infinity,
              padding: EdgeInsets.all(9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  sure == false
                      ? TextButton(
                          onPressed: () {
                            sure = true;
                            setState(() {});
                          },
                          child: Text(
                            "Set Location",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      : Row(
                          children: [
                            Text(
                              "Is this your estate location ?",
                              style: TextStyle(color: Colors.white),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context, ourfirstposition);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                padding: EdgeInsets.all(5),
                                child: Text(
                                  "Confirm",
                                  style: TextStyle(color: Colors.blueAccent),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                sure = false;
                                setState(() {});
                              },
                              child: Text(
                                "Back",
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        )
                ],
              ),
            )
          ],
        ));
  }
}
