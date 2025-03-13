import 'dart:io';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:awesome_top_snackbar/awesome_top_snackbar.dart';
import 'package:chewie/chewie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/constants/googlemap.dart';
import 'package:flutter_application_2/utils/constants/myestatetextfields.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:video_player/video_player.dart';

class MYFlat extends StatefulWidget {
  MYFlat({super.key});

  @override
  State<MYFlat> createState() => _MYFlatState();
}

class _MYFlatState extends State<MYFlat> {
  LatLng? maploc;
  ///////////////////////////////// Apartment list ///////////////////////////
  int? selectedapartment;
  List<DropdownMenuItem> Apartmentitem = [
    const DropdownMenuItem(
      value: 1,
      child: Text("1 Apartment",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      child: Text("2 Apartment",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 2,
    ),
    const DropdownMenuItem(
      child: Text("3 Apartment",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 3,
    ),
    const DropdownMenuItem(
      child: Text("4 Apartment",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 4,
    ),
    const DropdownMenuItem(
      child: Text("5 Apartment",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 5,
    ),
    const DropdownMenuItem(
      child: Text("6 Apartment",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 6,
    ),
    const DropdownMenuItem(
      child: Text("7 Apartment",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 7,
    ),
    const DropdownMenuItem(
      child: Text("8 Apartment",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 8,
    ),
    const DropdownMenuItem(
      child: Text("9 Apartment",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 9,
    ),
    const DropdownMenuItem(
      child: Text("10 Apartment",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 10,
    ),
    const DropdownMenuItem(
      child: Text("11 Apartment",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 11,
    ),
    const DropdownMenuItem(
      child: Text("12 Apartment",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 12,
    ),
    const DropdownMenuItem(
      child: Text("13 Apartment",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 13,
    ),
    const DropdownMenuItem(
      child: Text("14 Apartment",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 14,
    ),
    const DropdownMenuItem(
      child: Text("15 Apartment",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 15,
    ),
    const DropdownMenuItem(
      child: Text("16 Apartment",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 16,
    ),
    const DropdownMenuItem(
      child: Text("17 Apartment",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 17,
    ),
    const DropdownMenuItem(
      child: Text("18 Apartment",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 18,
    ),
    const DropdownMenuItem(
      child: Text("19 Apartment",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 19,
    ),
    const DropdownMenuItem(
      child: Text("20 Apartment",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 20,
    ),
    const DropdownMenuItem(
      child: Text("21 Apartment",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 21,
    ),
    const DropdownMenuItem(
      child: Text("22 Apartment",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 22,
    ),
    const DropdownMenuItem(
      child: Text("23 Apartment",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 23,
    ),
    const DropdownMenuItem(
      child: Text("24 Apartment",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 24,
    ),
    const DropdownMenuItem(
      child: Text("25 Apartment",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 25,
    ),
    const DropdownMenuItem(
      value: 26,
      child: Text("26 Apartment",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      child: Text("27 Apartment",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 27,
    ),
    const DropdownMenuItem(
      child: Text("28 Apartment",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 28,
    ),
    const DropdownMenuItem(
      child: Text("29 Apartment",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 29,
    ),
    const DropdownMenuItem(
      child: Text("30 Apartment",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 30,
    ),
    const DropdownMenuItem(
      child: Text("31 Apartment",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 31,
    ),
    const DropdownMenuItem(
      child: Text("32 Apartment",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 32,
    ),
    const DropdownMenuItem(
      child: Text("33 Apartment",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 33,
    ),
    const DropdownMenuItem(
      child: Text("34 Apartment",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 34,
    ),
    const DropdownMenuItem(
      child: Text("35 Apartment",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 35,
    ),
    const DropdownMenuItem(
      child: Text("36 Apartment",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 36,
    ),
    const DropdownMenuItem(
      child: Text("37 Apartment",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 37,
    ),
    const DropdownMenuItem(
      child: Text("38 Apartment",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 38,
    ),
    const DropdownMenuItem(
      child: Text("39 Apartment",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 39,
    ),
    const DropdownMenuItem(
      child: Text("40 Apartment",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 40,
    ),
    const DropdownMenuItem(
      child: Text("41 Apartment",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 41,
    ),
    const DropdownMenuItem(
      child: Text("42 Apartment",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 42,
    ),
    const DropdownMenuItem(
      child: Text("43 Apartment",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 43,
    ),
    const DropdownMenuItem(
      child: Text("44 Apartment",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 44,
    ),
    const DropdownMenuItem(
      child: Text("45 Apartment",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 45,
    ),
    const DropdownMenuItem(
      child: Text("46 Apartment",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 46,
    ),
    const DropdownMenuItem(
      child: Text("47 Apartment",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 47,
    ),
    const DropdownMenuItem(
      child: Text("48 Apartment",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 48,
    ),
    const DropdownMenuItem(
      child: Text("49 Apartment",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 49,
    ),
    const DropdownMenuItem(
      child: Text("50 Apartment",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 50,
    ),
  ];
  /////////////////////////////Garage list////////////////////////////////////
  int? selectedgarage;
  List<DropdownMenuItem> garageitem = [
    const DropdownMenuItem(
      value: 1,
      child: Text("1 Garage",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      child: Text("2 Garage",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 2,
    ),
    const DropdownMenuItem(
      child: Text("3 Garage",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 3,
    ),
    const DropdownMenuItem(
      child: Text("4 Garage",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 4,
    ),
    const DropdownMenuItem(
      child: Text("5 Garage",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 5,
    ),
  ];

  /////////////////////////////Storage list////////////////////////////////////
  int? selectedstorage;
  List<DropdownMenuItem> storageitem = [
    const DropdownMenuItem(
      value: 1,
      child: Text("1 Storage",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      child: Text("2 Storage",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 2,
    ),
    const DropdownMenuItem(
      child: Text("3 Storage",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 3,
    ),
    const DropdownMenuItem(
      child: Text("4 Storage",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 4,
    ),
    const DropdownMenuItem(
      child: Text("5 Storage",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 5,
    ),
  ];

  /////////////////////////////Basement list////////////////////////////////////
  int? selectedbasement;
  List<DropdownMenuItem> basementitem = [
    const DropdownMenuItem(
      value: 1,
      child: Text("1 Basement",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      child: Text("2 Basement",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 2,
    ),
    const DropdownMenuItem(
      child: Text("3 Basement",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 3,
    ),
    const DropdownMenuItem(
      child: Text("4 Basement",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 4,
    ),
    const DropdownMenuItem(
      child: Text("5 Basement",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 5,
    ),
  ];
  ///////////////////////////////Bath list//////////////////////////////////

  int? selectbath;
  List<DropdownMenuItem> bathitem = [
    const DropdownMenuItem(
      value: 1,
      child: Text("1 BathRoom",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      child: Text("2 BathRoom",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 2,
    ),
    const DropdownMenuItem(
      child: Text("3 BathRoom",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 3,
    ),
    const DropdownMenuItem(
      child: Text("4 BathRoom",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 4,
    ),
    const DropdownMenuItem(
      child: Text("5 BathRoom",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 5,
    ),
    const DropdownMenuItem(
      child: Text("6 BathRoom",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 6,
    ),
    const DropdownMenuItem(
      child: Text("7 BathRoom",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 7,
    ),
    const DropdownMenuItem(
      child: Text("8 BathRoom",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 8,
    ),
    const DropdownMenuItem(
      child: Text("9 BathRoom",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 9,
    ),
    const DropdownMenuItem(
      child: Text("10 BathRoom",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 10,
    )
  ];
  ////////////////////// kitchen list //////////////////////////////////////////
  int? selectedkitchen;

  List<DropdownMenuItem> kitchenitem = [
    const DropdownMenuItem(
      value: 1,
      child: Text("1 Kitchen",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      child: Text("2 Kitchen",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 2,
    ),
    const DropdownMenuItem(
      child: Text("3 Kitchen",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 3,
    ),
    const DropdownMenuItem(
      child: Text("4 Kitchen",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 4,
    ),
    const DropdownMenuItem(
      child: Text("5 Kitchen",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 5,
    ),
    const DropdownMenuItem(
      child: Text("6 Kitchen",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 6,
    ),
    const DropdownMenuItem(
      child: Text("7 Kitchen",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 7,
    ),
    const DropdownMenuItem(
      child: Text("8 Kitchen",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 8,
    ),
    const DropdownMenuItem(
      child: Text("9 Kitchen",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 9,
    ),
    const DropdownMenuItem(
      child: Text("10 Kitchen",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 10,
    )
  ];

  //////////////////////////// s list //////////////////////////////////////
  int? selected;

  List<DropdownMenuItem> roomitem = [
    const DropdownMenuItem(
      value: 1,
      child: Text("1Room",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      child: Text("2Room",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 2,
    ),
    const DropdownMenuItem(
      child: Text("3Room",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 3,
    ),
    const DropdownMenuItem(
      child: Text("4Room",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 4,
    ),
    const DropdownMenuItem(
      child: Text("5Room",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 5,
    ),
    const DropdownMenuItem(
      child: Text("6Room",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 6,
    ),
    const DropdownMenuItem(
      child: Text("7Room",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 7,
    ),
    const DropdownMenuItem(
      child: Text("8Room",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 8,
    ),
    const DropdownMenuItem(
      child: Text("9Room",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 9,
    ),
    const DropdownMenuItem(
      child: Text("10Room",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 10,
    ),
    const DropdownMenuItem(
      child: Text("11Room",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 11,
    ),
    const DropdownMenuItem(
      child: Text("12Room",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 12,
    ),
    const DropdownMenuItem(
      child: Text("13Room",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 13,
    ),
    const DropdownMenuItem(
      child: Text("14Room",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 14,
    ),
    const DropdownMenuItem(
      child: Text("15Room",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 15,
    ),
    const DropdownMenuItem(
      child: Text("16Room",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 16,
    ),
    const DropdownMenuItem(
      child: Text("17Room",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 17,
    ),
    const DropdownMenuItem(
      child: Text("18Room",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 18,
    ),
    const DropdownMenuItem(
      child: Text("19Room",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 19,
    ),
    const DropdownMenuItem(
      child: Text("20Room",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 20,
    ),
    const DropdownMenuItem(
      child: Text("21Room",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 21,
    ),
    const DropdownMenuItem(
      child: Text("22Room",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 22,
    ),
    const DropdownMenuItem(
      child: Text("23Room",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 23,
    ),
    const DropdownMenuItem(
      child: Text("24Room",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 24,
    ),
    const DropdownMenuItem(
      child: Text("25Room",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 25,
    ),
  ];
  ////////////////////////////////// Floor list/////////////////////////////////
  int? selectedfloor;
  List<DropdownMenuItem> flooritem = [
    const DropdownMenuItem(
      value: 0,
      child: Text("0 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      value: 1,
      child: Text("1 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      child: Text("2 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 2,
    ),
    const DropdownMenuItem(
      child: Text("3 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 3,
    ),
    const DropdownMenuItem(
      child: Text("4 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 4,
    ),
    const DropdownMenuItem(
      child: Text("5 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 5,
    ),
    const DropdownMenuItem(
      value: 6,
      child: Text("6 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      value: 7,
      child: Text("7 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      child: Text("8 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 8,
    ),
    const DropdownMenuItem(
      child: Text("9 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 9,
    ),
    const DropdownMenuItem(
      child: Text("10 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 10,
    ),
    const DropdownMenuItem(
      child: Text("11 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 11,
    ),
    const DropdownMenuItem(
      value: 12,
      child: Text("12 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      value: 13,
      child: Text("13 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      child: Text("14 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 14,
    ),
    const DropdownMenuItem(
      child: Text("15 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 15,
    ),
    const DropdownMenuItem(
      child: Text("16 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 16,
    ),
    const DropdownMenuItem(
      child: Text("17 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 17,
    ),
    const DropdownMenuItem(
      value: 18,
      child: Text("18 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      value: 19,
      child: Text("19 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      child: Text("20 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 20,
    ),
    const DropdownMenuItem(
      child: Text("21 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 21,
    ),
    const DropdownMenuItem(
      child: Text("22 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 22,
    ),
    const DropdownMenuItem(
      child: Text("23 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 23,
    ),
    const DropdownMenuItem(
      value: 24,
      child: Text("24 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      value: 25,
      child: Text("25 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      child: Text("26 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 26,
    ),
    const DropdownMenuItem(
      child: Text("27 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 27,
    ),
    const DropdownMenuItem(
      child: Text("28 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 28,
    ),
    const DropdownMenuItem(
      child: Text("29 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 29,
    ),
    const DropdownMenuItem(
      value: 30,
      child: Text("30 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      value: 31,
      child: Text("31 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      child: Text("32 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 32,
    ),
    const DropdownMenuItem(
      child: Text("33 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 33,
    ),
    const DropdownMenuItem(
      child: Text("34 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 34,
    ),
    const DropdownMenuItem(
      child: Text("35 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 35,
    ),
    const DropdownMenuItem(
      value: 36,
      child: Text("36 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      value: 37,
      child: Text("37 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      child: Text("38 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 38,
    ),
    const DropdownMenuItem(
      child: Text("39 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 39,
    ),
    const DropdownMenuItem(
      child: Text("40 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 40,
    ),
    const DropdownMenuItem(
      child: Text("41 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 41,
    ),
    const DropdownMenuItem(
      value: 42,
      child: Text("42 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      value: 42,
      child: Text("42 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      child: Text("43 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 43,
    ),
    const DropdownMenuItem(
      child: Text("44 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 44,
    ),
    const DropdownMenuItem(
      value: 45,
      child: Text("45 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      value: 46,
      child: Text("46 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      child: Text("47 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 47,
    ),
    const DropdownMenuItem(
      child: Text("48 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 48,
    ),
    const DropdownMenuItem(
      child: Text("49 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 49,
    ),
    const DropdownMenuItem(
      child: Text("50 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 50,
    ),
  ];

  ////////////////////// Elvator list //////////////////////////////////////////
  int? selectedelevator;

  List<DropdownMenuItem> Elevatoritem = [
    const DropdownMenuItem(
      value: 1,
      child: Text("1 Elevator",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      child: Text("2 Elevator",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 2,
    ),
    const DropdownMenuItem(
      child: Text("3 Elevator",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 3,
    ),
    const DropdownMenuItem(
      child: Text("4 Elevator",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 4,
    ),
    const DropdownMenuItem(
      child: Text("5 Elevator",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 5,
    ),
    const DropdownMenuItem(
      child: Text("6 Elevator",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 6,
    ),
    const DropdownMenuItem(
      child: Text("7 Elevator",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 7,
    ),
    const DropdownMenuItem(
      child: Text("8 Elevator",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 8,
    ),
    const DropdownMenuItem(
      child: Text("9 Elevator",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 9,
    ),
    const DropdownMenuItem(
      child: Text("10 Elevator",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: 10,
    )
  ];

  var mycountry;
  var mystate;
  var mycity;

  String? url;
  String? videourl;
  String? urls;

  CollectionReference? imgref;
  firebase_storage.Reference? ref;
  firebase_storage.Reference? videoref;
  TextEditingController pricecontrol = TextEditingController();
  TextEditingController postnamecontroller = TextEditingController();
  TextEditingController spacecontroller = TextEditingController();
  TextEditingController basementcontroller = TextEditingController();
  TextEditingController storagecontroller = TextEditingController();
  TextEditingController backyardcontroller = TextEditingController();
  TextEditingController monthcontroller = TextEditingController();
  TextEditingController yearcontroller = TextEditingController();
  String? salername;
  String uid = FirebaseAuth.instance.currentUser!.uid;

  bool loading = false;
  File? file;
  File? single;
  File? videofile;
  VideoPlayerController? myvideo;
  ChewieController? chewie;
  selectimage() async {
    final ImagePicker imagepick = ImagePicker();
    final XFile? image = await imagepick.pickImage(source: ImageSource.gallery);
    single = File(image!.path);

    setState(() {});
  }

  selectvideo() async {
    final ImagePicker imagepick = ImagePicker();
    final XFile? video = await imagepick.pickVideo(source: ImageSource.gallery);
    videofile = File(video!.path);
    myvideo = VideoPlayerController.file(videofile!)
      ..initialize().then((_) {
        chewie = ChewieController(
            videoPlayerController: myvideo!,
            aspectRatio: myvideo!.value.aspectRatio);
        setState(() {});
      });

    setState(() {});
  }

  final ImagePicker imagepick = ImagePicker();
  List<XFile> multiimages = [];
  void imagesmulti() async {
    final List<XFile>? pickimages = await imagepick.pickMultiImage();
    setState(() {
      if (pickimages!.isNotEmpty) {
        multiimages.addAll(pickimages);
      }
    });
    if (multiimages.length >= 5) {
      postimages = true;

      setState(() {});
    }
  }

  bool postimages = true;
  Color coor = const Color.fromARGB(255, 99, 96, 96);
  Color rentcolor = const Color.fromARGB(255, 99, 96, 96);
  Color salecolor = const Color.fromARGB(255, 99, 96, 96);
  String? posthint = "(e.g) A house beside airport with garden";

  @override
  void dispose() {
    myvideo!.dispose();
    chewie!.dispose();
    super.dispose();
  }

  GoogleMapController? controller;

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Scaffold(
            body: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 1500),
                child: CircularProgressIndicator(
                  color: Colors.blueAccent,
                ),
              ),
            ),
          )
        : SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 170),
                  child: Center(
                    child: Text(
                      "Enter your House location",
                      style: GoogleFonts.openSans(
                          fontSize: 18,
                          color: const Color.fromARGB(255, 45, 55, 59)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: CSCPicker(
                    showStates: true,
                    showCities: true,
                    layout: Layout.vertical,
                    onCountryChanged: (value) {
                      setState(() {
                        mycountry = value;
                      });
                    },
                    onCityChanged: (city) {
                      setState(() {
                        mycity = city;
                      });
                    },
                    onStateChanged: (value) {
                      setState(() {
                        mystate = value;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Maps Google",
                  style: GoogleFonts.palanquin(
                      fontSize: 18,
                      color: const Color.fromARGB(255, 83, 87, 88)),
                ),
                const SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.only(top: 11),
                  height: 60,
                  width: 60,
                  decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: Colors.grey, offset: Offset(0.7, 0.7))
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(40))),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () async {
                          maploc = await Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Mygooglemap();
                          }));
                        },
                        child: Image.asset(
                          "assets/images/googlemap.png",
                          scale: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                const Divider(
                  thickness: 0.5,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 400,
                  height: 120,
                  decoration: const BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(10, 20))),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Expanded(
                            child: Text(
                          "Note : fill your estate specifications carefully and take into your account that every detail will help to locate your estate properly , however any value that is not written it will be considered as Null including (numeric and size),and this will reduce the chances of selling your property.",
                          style: GoogleFonts.martelSans(fontSize: 13),
                        ))
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  "Enter your Flat details",
                  style: GoogleFonts.openSans(
                      fontSize: 18,
                      color: const Color.fromARGB(255, 45, 55, 59)),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Myinputtext(
                      controller: pricecontrol,
                      hinttext: "Price in Dollar",
                      color: salecolor,
                      Padding: const EdgeInsets.fromLTRB(12, 0, 0, 3),
                    ),
                    Myinputtext(
                      controller: spacecontroller,
                      color: coor,
                      hinttext: "Space in Meter",
                      Padding: const EdgeInsets.fromLTRB(12, 0, 0, 3),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0.1, 0.1),
                                      color: Colors.blueAccent)
                                ]),
                            width: 130,
                            height: 40,
                            child: DropdownButtonFormField(
                                menuMaxHeight: 250,
                                hint: Text(
                                  "Floors",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                      color: coor),
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.fromLTRB(27, 0, 0, 5)),
                                elevation: 0,
                                items: flooritem,
                                onChanged: (value) {
                                  setState(() => selectedfloor = value);
                                })),
                        Container(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0.1, 0.1),
                                      color: Colors.blueAccent)
                                ]),
                            width: 130,
                            height: 40,
                            child: DropdownButtonFormField(
                                menuMaxHeight: 250,
                                hint: Text(
                                  "Rooms",
                                  style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                      color: coor),
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.fromLTRB(27, 0, 0, 5)),
                                elevation: 0,
                                items: roomitem,
                                onChanged: (value) {
                                  setState(() => selected = value);
                                }))
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0.1, 0.1),
                                      color: Colors.blueAccent)
                                ]),
                            width: 130,
                            height: 40,
                            child: DropdownButtonFormField(
                                menuMaxHeight: 250,
                                hint: Text(
                                  "BathRoom",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                      color: coor),
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.fromLTRB(14, 0, 0, 5)),
                                elevation: 0,
                                items: bathitem,
                                onChanged: (value) {
                                  setState(() => selectbath = value);
                                })),
                        Container(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0.1, 0.1),
                                      color: Colors.blueAccent)
                                ]),
                            width: 130,
                            height: 40,
                            child: DropdownButtonFormField(
                                menuMaxHeight: 250,
                                hint: Text(
                                  "Kitchen",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                      color: coor),
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.fromLTRB(27, 0, 0, 5)),
                                elevation: 0,
                                items: kitchenitem,
                                onChanged: (value) {
                                  setState(() => selectedkitchen = value);
                                }))
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0.1, 0.1),
                                      color: Colors.blueAccent)
                                ]),
                            width: 130,
                            height: 40,
                            child: DropdownButtonFormField(
                                menuMaxHeight: 250,
                                hint: Text(
                                  "Elvator",
                                  style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15),
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.fromLTRB(27, 0, 0, 5)),
                                elevation: 0,
                                items: Elevatoritem,
                                onChanged: (value) {
                                  setState(() => selectedelevator = value);
                                })),
                        Container(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0.1, 0.1),
                                      color: Colors.blueAccent)
                                ]),
                            width: 130,
                            height: 40,
                            child: DropdownButtonFormField(
                                menuMaxHeight: 250,
                                hint: Text(
                                  "Basement",
                                  style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15),
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.fromLTRB(22, 0, 0, 5)),
                                elevation: 0,
                                items: basementitem,
                                onChanged: (value) {
                                  setState(() => selectedbasement = value);
                                }))
                      ],
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Myinputtext(
                          controller: basementcontroller,
                          hinttext: "Basement /Meter",
                          Padding: const EdgeInsets.fromLTRB(1, 0, 0, 3),
                        ),
                        Container(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0.1, 0.1),
                                      color: Colors.blueAccent)
                                ]),
                            width: 130,
                            height: 40,
                            child: DropdownButtonFormField(
                                menuMaxHeight: 250,
                                hint: Text(
                                  "Storage",
                                  style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15),
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.fromLTRB(22, 0, 0, 5)),
                                elevation: 0,
                                items: storageitem,
                                onChanged: (value) {
                                  setState(() => selectedstorage = value);
                                }))
                      ],
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Myinputtext(
                            controller: storagecontroller,
                            Padding: const EdgeInsets.only(left: 3),
                            hinttext: "Storage / Meter"),
                        Container(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0.1, 0.1),
                                      color: Colors.blueAccent)
                                ]),
                            width: 130,
                            height: 40,
                            child: DropdownButtonFormField(
                                menuMaxHeight: 250,
                                hint: Text(
                                  "Garage",
                                  style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15),
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.fromLTRB(22, 0, 0, 5)),
                                elevation: 0,
                                items: garageitem,
                                onChanged: (value) {
                                  setState(() => selectedgarage = value);
                                }))
                      ],
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Myinputtext(
                            controller: backyardcontroller,
                            hinttext: "Backyard / Meter"),
                        Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0.1, 0.1),
                                      color: Colors.blueAccent)
                                ]),
                            width: 130,
                            height: 40,
                            child: DropdownButtonFormField(
                                menuMaxHeight: 250,
                                hint: Text(
                                  "Apartments",
                                  style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15),
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.fromLTRB(13, 0, 0, 5)),
                                elevation: 0,
                                items: Apartmentitem,
                                onChanged: (value) {
                                  setState(() => selectedapartment = value);
                                }))
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Myinputtext(
                      controller: monthcontroller,
                      hinttext: "Monthly Rent /\$",
                      color: rentcolor,
                      Padding: const EdgeInsets.fromLTRB(7, 0, 0, 3),
                    ),
                    Myinputtext(
                      controller: yearcontroller,
                      hinttext: "Yearly Rent /\$",
                      color: rentcolor,
                      Padding: const EdgeInsets.fromLTRB(12, 0, 0, 3),
                    )
                  ],
                ),
                const SizedBox(height: 50),
                Text(
                  "Upload Main Image",
                  style: GoogleFonts.openSans(
                      fontSize: 18,
                      color: const Color.fromARGB(255, 45, 55, 59)),
                ),
                const SizedBox(height: 20),
                Text(
                  "This will be the interface image for your post ",
                  style: GoogleFonts.martelSans(fontSize: 15),
                ),
                const SizedBox(height: 10),
                Stack(
                  children: [
                    single != null
                        ? Container(
                            width: 350,
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: FileImage(File(single!.path)),
                                    fit: BoxFit.fill),
                                boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(2, 2),
                                      color: Colors.grey.shade300),
                                  BoxShadow(
                                      offset: const Offset(-2, 0),
                                      color: Colors.grey.shade300),
                                ],
                                color: Colors.white,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(15))),
                          )
                        : Container(
                            width: 350,
                            height: 200,
                            decoration: const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0.1, 0.1),
                                      color: Colors.blueAccent),
                                  BoxShadow(
                                      offset: Offset(-0.1, 0),
                                      color: Colors.blueAccent),
                                ],
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                          ),
                    single == null
                        ? Positioned(
                            left: 120,
                            top: 50,
                            child: IconButton(
                                onPressed: selectimage,
                                icon: const Icon(
                                  Icons.add_a_photo_sharp,
                                  size: 80,
                                  color: Color.fromARGB(255, 88, 86, 86),
                                )),
                          )
                        : Positioned(
                            top: -9,
                            child: MaterialButton(
                              elevation: 8,
                              focusColor: Colors.white,
                              onPressed: selectimage,
                              height: 30,
                              minWidth: 8,
                              color: Colors.black,
                              child: const Text("Change"),
                              textColor: Colors.white,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(7))),
                            ),
                          )
                  ],
                ),
                const SizedBox(height: 50),
                Text(
                  "Upload Post Images",
                  style: GoogleFonts.openSans(
                      fontSize: 18,
                      color: (postimages == true)
                          ? const Color.fromARGB(255, 45, 55, 59)
                          : Colors.red),
                ),
                const SizedBox(height: 20),
                Text(
                  "A collection of images for your post ",
                  style: GoogleFonts.martelSans(fontSize: 15),
                ),
                const SizedBox(height: 20),
                Container(
                  width: 100,
                  height: 90,
                  decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0.1, 0.1), color: Colors.blueAccent),
                        BoxShadow(
                            offset: Offset(-0.1, 0), color: Colors.blueAccent),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: IconButton(
                      onPressed: () {
                        imagesmulti();
                        if (multiimages.length >= 5) {
                          postimages = true;

                          setState(() {});
                        } else {
                          postimages = false;
                          setState(() {});
                        }
                      },
                      icon: const Icon(
                        Icons.add_a_photo,
                        size: 45,
                        color: Color.fromARGB(255, 88, 86, 86),
                      )),
                ),
                const SizedBox(height: 40),
                Container(
                  height: multiimages.isEmpty ? 50 : 200,
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1),
                        itemCount: multiimages.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Stack(children: [
                            Container(
                              margin: const EdgeInsets.all(0),
                              width: 150,
                              height: 110,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: FileImage(
                                          File(multiimages[index].path)),
                                      fit: BoxFit.fill),
                                  boxShadow: [
                                    const BoxShadow(
                                        offset: Offset(0.1, 0.1),
                                        color: Colors.blueAccent),
                                    const BoxShadow(
                                        offset: Offset(-0.1, 0),
                                        color: Colors.blueAccent),
                                  ],
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8))),
                            )
                          ]);
                        }),
                  ),
                ),
                Text(
                  "Upload Video (Optional)",
                  style: GoogleFonts.openSans(
                      fontSize: 18,
                      color: const Color.fromARGB(255, 45, 55, 59)),
                ),
                const SizedBox(height: 20),
                Stack(
                  children: [
                    myvideo != null
                        ? Container(
                            width: 350,
                            height: 200,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(2, 2),
                                      color: Colors.grey.shade300),
                                  BoxShadow(
                                      offset: const Offset(-2, 0),
                                      color: Colors.grey.shade300),
                                ],
                                color: Colors.white,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(15))),
                            child: myvideo!.value.isInitialized
                                ? AspectRatio(
                                    aspectRatio: myvideo!.value.aspectRatio,
                                    child: Chewie(controller: chewie!))
                                : const SizedBox.shrink(),
                          )
                        : Container(
                            width: 350,
                            height: 200,
                            decoration: const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0.1, 0.1),
                                      color: Colors.blueAccent),
                                  BoxShadow(
                                      offset: Offset(-0.1, 0),
                                      color: Colors.blueAccent),
                                ],
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                          ),
                    myvideo == null
                        ? Positioned(
                            left: 120,
                            top: 50,
                            child: IconButton(
                                onPressed: selectvideo,
                                icon: const Icon(
                                  Icons.videocam,
                                  size: 80,
                                  color: Color.fromARGB(255, 88, 86, 86),
                                )),
                          )
                        : Positioned(
                            top: -9,
                            child: MaterialButton(
                              elevation: 8,
                              focusColor: Colors.white,
                              onPressed: () {
                                selectvideo();
                                chewie!.dispose();
                                setState(() {});
                              },
                              height: 30,
                              minWidth: 8,
                              color: Colors.black,
                              child: const Text("Change"),
                              textColor: Colors.white,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(7))),
                            ),
                          )
                  ],
                ),
                const SizedBox(height: 60),
                Container(
                  margin: const EdgeInsets.only(left: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(5, 8, 0, 0),
                        child: Text(
                          "Post Name",
                          style: GoogleFonts.notoSansAdlam(
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        width: 300,
                        height: 35,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 65, 211, 255),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8))),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 5, bottom: 4),
                        child: TextFormField(
                          controller: postnamecontroller,
                          cursorColor: const Color.fromARGB(255, 31, 106, 129),
                          cursorHeight: 25,
                          cursorWidth: 1,
                          decoration: InputDecoration(
                              hintText: posthint,
                              hintStyle: GoogleFonts.robotoCondensed(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14,
                                  color: coor),
                              border: InputBorder.none),
                        ),
                        width: 300,
                        height: 75,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0.0, 0.2),
                                  color: Colors.blueAccent),
                            ],
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10))),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 70),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 110,
                      child: MaterialButton(
                        focusColor: Colors.white,
                        onPressed: () async {
                          if (mycountry == null ||
                              mystate == null ||
                              mycity == null ||
                              maploc == null) {
                            final snackBar = SnackBar(
                              elevation: 0,
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.transparent,
                              content: AwesomeSnackbarContent(
                                messageTextStyle: TextStyle(fontSize: 11.5),
                                title: 'Opps Missed location!',
                                message:
                                    'Please enter your location and set your house place on google maps,',
                                contentType: ContentType.failure,
                              ),
                            );

                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(snackBar);
                            ;
                          } else {
                            if (pricecontrol.text.isNotEmpty &
                                spacecontroller.text.isNotEmpty &
                                (selectedfloor != null) &
                                (selectedkitchen != null) &
                                (selectbath != null) &
                                (selected != null) &
                                postnamecontroller.text.isNotEmpty) {
                              if (multiimages.length >= 5 && single != null) {
                                await uploadsale();

                                final snackBar = SnackBar(
                                  elevation: 0,
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.transparent,
                                  content: AwesomeSnackbarContent(
                                    messageTextStyle: TextStyle(fontSize: 11),
                                    titleTextStyle: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                    title: 'Your post uploaded successfully !',
                                    message:
                                        'We evaluting your post , you will get the final result soon',
                                    contentType: ContentType.success,
                                    color: Colors.blueAccent,
                                  ),
                                );
                                ScaffoldMessenger.of(context)
                                  ..hideCurrentSnackBar()
                                  ..showSnackBar(snackBar);
                              } else {
                                postimages = false;
                                setState(() {});
                                final snackBar = SnackBar(
                                  elevation: 0,
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.transparent,
                                  content: AwesomeSnackbarContent(
                                    titleTextStyle: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                    messageTextStyle: TextStyle(fontSize: 12),
                                    title: 'Opps forget images !',
                                    message:
                                        'Please upload main image and 5 post images',
                                    contentType: ContentType.failure,
                                  ),
                                );
                                ScaffoldMessenger.of(context)
                                  ..hideCurrentSnackBar()
                                  ..showSnackBar(snackBar);
                              }
                            } else {
                              coor = Colors.red;
                              salecolor = Colors.red;
                              rentcolor = const Color.fromARGB(255, 99, 96, 96);

                              posthint = "Require a name for the post";
                              setState(() {});
                              final snackBar = SnackBar(
                                elevation: 0,
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.transparent,
                                content: AwesomeSnackbarContent(
                                  messageTextStyle: TextStyle(fontSize: 15),
                                  titleTextStyle: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                  title: 'Opps some fileds are empty !',
                                  message: 'Please fill all required fileds',
                                  contentType: ContentType.failure,
                                ),
                              );

                              ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(snackBar);
                            }
                          }
                        },
                        height: 50,
                        color: Colors.white,
                        child: Row(
                          children: [
                            Icon(Iconsax.dollar_circle),
                            Text(
                              ".Sale",
                              style: GoogleFonts.mali(fontSize: 19),
                            ),
                          ],
                        ),
                        textColor: Color.fromARGB(214, 25, 180, 105),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        "O/R",
                        style: GoogleFonts.mali(
                            fontSize: 17, color: Color.fromARGB(181, 0, 0, 0)),
                      ),
                    ),
                    Container(
                      width: 110,
                      child: MaterialButton(
                        focusColor: Colors.white,
                        onPressed: () async {
                          if (mycountry == null ||
                              mystate == null ||
                              mycity == null ||
                              maploc == null) {
                            final snackBar = SnackBar(
                              elevation: 0,
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.transparent,
                              content: AwesomeSnackbarContent(
                                messageTextStyle: TextStyle(fontSize: 11.5),
                                title: 'Opps Missed location!',
                                message:
                                    'Please enter your location and set your house place on google maps,',
                                contentType: ContentType.failure,
                              ),
                            );

                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(snackBar);
                          } else {
                            if (monthcontroller.text.isNotEmpty &
                                yearcontroller.text.isNotEmpty &
                                spacecontroller.text.isNotEmpty &
                                (selectedfloor != "") &
                                (selectedkitchen != "") &
                                (selectbath != null) &
                                (selected != null) &
                                postnamecontroller.text.isNotEmpty) {
                              if (multiimages.length >= 5 && single != null) {
                                await uploadrent();
                                final snackBar = SnackBar(
                                  elevation: 0,
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.transparent,
                                  content: AwesomeSnackbarContent(
                                    messageTextStyle: TextStyle(fontSize: 15),
                                    titleTextStyle: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                    title: 'Your post uploaded successfully !',
                                    message:
                                        'Go to home page to view your post',
                                    contentType: ContentType.success,
                                    color: Colors.blueAccent,
                                  ),
                                );
                                ScaffoldMessenger.of(context)
                                  ..hideCurrentSnackBar()
                                  ..showSnackBar(snackBar);
                              } else {
                                final snackBar = SnackBar(
                                  elevation: 0,
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.transparent,
                                  content: AwesomeSnackbarContent(
                                    titleTextStyle: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                    messageTextStyle: TextStyle(fontSize: 12),
                                    title: 'Opps forget images !',
                                    message:
                                        'Please upload main image and 5 post images',
                                    contentType: ContentType.failure,
                                  ),
                                );

                                ScaffoldMessenger.of(context)
                                  ..hideCurrentSnackBar()
                                  ..showSnackBar(snackBar);
                              }
                            } else {
                              coor = Colors.red;
                              rentcolor = Colors.red;
                              salecolor = const Color.fromARGB(255, 99, 96, 96);
                              posthint = "Require a name for the post";
                              setState(() {});
                              final snackBar = SnackBar(
                                elevation: 0,
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.transparent,
                                content: AwesomeSnackbarContent(
                                  messageTextStyle: TextStyle(fontSize: 15),
                                  titleTextStyle: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                  title: 'Opps some fileds are empty !',
                                  message: 'Please fill all required fileds',
                                  contentType: ContentType.failure,
                                ),
                              );

                              ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(snackBar);
                            }
                          }
                        },
                        height: 50,
                        color: Colors.white,
                        child: Row(
                          children: [
                            Icon(
                              Iconsax.key_square,
                              size: 24,
                            ),
                            Text(
                              ".Rent",
                              style: GoogleFonts.mali(fontSize: 19),
                            ),
                          ],
                        ),
                        textColor: Color.fromARGB(213, 241, 148, 27),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
  }

  Future uploadsale() async {
    loading = true;

    int price = int.parse(pricecontrol.text.trim());
    int space = int.parse(spacecontroller.text.trim());
    String email = FirebaseAuth.instance.currentUser!.email!;
    setState(() {});

    CollectionReference imagesref = FirebaseFirestore.instance
        .collection("Admin")
        .doc("Sales")
        .collection('Outgoing')
        .doc(uid + postnamecontroller.text.trim())
        .collection('imagelist');

    ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child("/Mainimage/$uid/${basename(single!.path)}");
    await ref!.putFile(single!);
    url = await ref!.getDownloadURL();
    videofile != null
        ? videoref = firebase_storage.FirebaseStorage.instance
            .ref()
            .child("/video/$uid/${basename(videofile!.path)}")
        : "";
    videofile != null ? await videoref!.putFile(videofile!) : "";

    videofile != null ? videourl = await videoref!.getDownloadURL() : "";
    try {
      await FirebaseFirestore.instance
          .collection("Admin")
          .doc("Sales")
          .collection('Outgoing')
          .doc(uid + postnamecontroller.text.trim())
          .set({
        "Type": "Sale",
        "BedRooms": selected,
        "City": mycity,
        "Country": mycountry,
        "Postname": postnamecontroller.text.trim(),
        "Price": price,
        "YearlyRent": "empty",
        "MonthlyRent": "empty",
        "Tag": "Flat",
        "Space": space,
        "State": mystate,
        "image": url,
        "video": videourl ?? "",
        "Numberofaprtments": selectedapartment ?? "",
        "Floors": selectedfloor ?? "",
        "Elevator": selectedelevator ?? "",
        "Bath": selectbath,
        "Kitchen": selectedkitchen,
        "Map": maploc.toString(),
        "Basement": selectedbasement ?? "",
        "Storage": selectedstorage ?? "",
        "Garage": selectedgarage ?? "",
        "asementmeter": basementcontroller.text.trim() ?? "",
        "Storagemeter": storagecontroller.text.trim() ?? "",
        "Backyard": backyardcontroller.text.trim() ?? "",
        "Pricecat": giveprice(price),
        "Spacecat": givespace(space),
        "Bedcat": givesbed(selected),
        "Bathcat": givesbath(selectbath),
        "Salerid": uid,
        "Saleremail": email,
        "Salername": await FirebaseFirestore.instance
            .collection('Users')
            .doc(uid)
            .get()
            .then((ds) {
          return salername = ds["username"];
        }),
        "Timestamp": Timestamp.now()
      }).whenComplete(() async {
        for (var imges in multiimages) {
          file = File(imges.path);

          ref = firebase_storage.FirebaseStorage.instance
              .ref()
              .child("/imagesmulti/$uid/${basename(imges.path)}");
          await ref!.putFile(file!);
          await ref!.getDownloadURL().then(
            (value) async {
              urls = value;
              await imagesref.add({"imageurl": value});
            },
          );
        }
        FirebaseFirestore.instance
            .collection('Users')
            .doc(uid)
            .collection("Mypost")
            .doc(uid + postnamecontroller.text.trim())
            .set({
          "Price": pricecontrol.text.trim(),
          "image": url,
          "Country": mycountry,
          "State": mystate,
          "City": mycity,
          "Salerid": uid,
          "docid": uid + postnamecontroller.text.trim()
        });
        loading = false;

        setState(() {});
      });
    } on FirebaseException catch (e) {
      loading = false;

      setState(() {});
      awesomeTopSnackbar(context as BuildContext, "${e.message}",
          backgroundColor: Colors.red,
          icon: const Icon(Icons.close, color: Colors.white),
          iconWithDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white),
          ));
    }
  }

  Future uploadrent() async {
    String email = FirebaseAuth.instance.currentUser!.email!;

    int price = int.parse(yearcontroller.text.trim());
    int space = int.parse(spacecontroller.text.trim());

    loading = true;
    setState(() {});
    CollectionReference imagesref = FirebaseFirestore.instance
        .collection('Sale')
        .doc(uid + postnamecontroller.text.trim())
        .collection('imagelist');
    videofile != null
        ? videoref = firebase_storage.FirebaseStorage.instance
            .ref()
            .child("/video/$uid/${basename(videofile!.path)}")
        : "";
    videofile != null ? await videoref!.putFile(videofile!) : "";

    videofile != null ? videourl = await videoref!.getDownloadURL() : "";
    ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child("/Mainimage/$uid/${basename(single!.path)}");
    await ref!.putFile(single!);
    url = await ref!.getDownloadURL();
    try {
      await FirebaseFirestore.instance
          .collection("Sale")
          .doc(uid + postnamecontroller.text.trim())
          .set({
        "Price": price,
        "Type": "Rent",
        "BedRooms": selected,
        "City": mycity,
        "Country": mycountry,
        "Postname": postnamecontroller.text.trim(),
        "YearlyRent": yearcontroller.text.trim(),
        "MonthlyRent": monthcontroller.text.trim(),
        "Tag": "Flat",
        "Space": spacecontroller.text.trim(),
        "State": mystate,
        "Map": maploc.toString(),
        "image": url,
        "video": videourl ?? "",
        "Numberofaprtments": selectedapartment,
        "Floors": selectedfloor,
        "Elevator": selectedelevator,
        "Bath": selectbath,
        "Kitchen": selectedkitchen,
        "Basement": selectedbasement,
        "Storage": selectedstorage,
        "Garage": selectedgarage,
        "Pricecat": giveprice(price),
        "Spacecat": givespace(space),
        "Bedcat": givesbed(selected),
        "Bathcat": givesbath(selectbath),
        "asementmeter": basementcontroller.text.trim(),
        "Storagemeter": storagecontroller.text.trim(),
        "Backyard": backyardcontroller.text.trim(),
        "Salerid": uid,
        "Saleremail": email,
        "Salername": await FirebaseFirestore.instance
            .collection('Users')
            .doc(uid)
            .get()
            .then((ds) {
          return salername = ds["username"];
        }),
        "Timestamp": Timestamp.now()
      }).whenComplete(() async {
        for (var imges in multiimages) {
          file = File(imges.path);

          ref = firebase_storage.FirebaseStorage.instance
              .ref()
              .child("/imagesmulti/$uid/${basename(imges.path)}");
          await ref!.putFile(file!);
          await ref!.getDownloadURL().then(
            (value) async {
              urls = value;
              await imagesref.add({"imageurl": value});
            },
          );
        }
        FirebaseFirestore.instance
            .collection('Users')
            .doc(uid)
            .collection("Mypost")
            .doc(uid + postnamecontroller.text.trim())
            .set({
          "Price": price,
          "image": url,
          "Country": mycountry,
          "State": mystate,
          "City": mycity,
          "Salerid": uid,
          "docid": uid + postnamecontroller.text.trim()
        });
        loading = false;

        setState(() {});
      });
    } on FirebaseException catch (e) {
      loading = false;

      setState(() {});
      awesomeTopSnackbar(context as BuildContext, "${e.message}",
          backgroundColor: Colors.red,
          icon: const Icon(Icons.close, color: Colors.white),
          iconWithDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white),
          ));
    }
  }

  String giveprice(i) {
    return i >= 500 && i <= 10000
        ? "pricecat1"
        : i >= 10000 && i <= 100000
            ? "pricecat2"
            : i >= 100000 && i <= 1000000
                ? "pricecat3"
                : i >= 1000000 && i <= 5000000
                    ? "pricecat4"
                    : i >= 5000000 && i <= 50000000
                        ? "pricecat5"
                        : "Noprice";
  }

  String givespace(i) {
    return i >= 100 && i <= 500
        ? "spacecat1"
        : i >= 500 && i <= 1000
            ? "spacecat2"
            : i >= 1000 && i <= 5000
                ? "spacecat3"
                : "nospace";
  }

  String givesbed(i) {
    return i >= 1 && i <= 5
        ? "bedcat1"
        : i >= 5 && i <= 10
            ? "bedcat2"
            : i >= 10 && i <= 25
                ? "bedcat3"
                : "nobed";
  }

  String givesbath(i) {
    return i >= 1 && i <= 3
        ? "bathcat1"
        : i >= 3 && i <= 6
            ? "bathcat2"
            : i >= 6 && i <= 10
                ? "bathcat3"
                : "nospace";
  }
}
