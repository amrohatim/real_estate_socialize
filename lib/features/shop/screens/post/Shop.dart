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
import 'package:video_player/video_player.dart';
import 'package:path/path.dart';

class MyShop extends StatefulWidget {
  const MyShop({
    super.key,
  });

  @override
  State<MyShop> createState() => _MyShopState();
}

class _MyShopState extends State<MyShop> {
  String? selectfloorshop = "";
  List<DropdownMenuItem> flooritemshop = [
    const DropdownMenuItem(
      value: "0",
      child: Text("0 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      value: "1",
      child: Text("1 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      child: Text("2 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "2",
    ),
    const DropdownMenuItem(
      child: Text("3 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "3",
    ),
    const DropdownMenuItem(
      child: Text("4 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "4",
    ),
    const DropdownMenuItem(
      child: Text("5 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "5",
    ),
    const DropdownMenuItem(
      value: "6",
      child: Text("6 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      value: "7",
      child: Text("7 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      child: Text("8 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "8",
    ),
    const DropdownMenuItem(
      child: Text("9 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "9",
    ),
    const DropdownMenuItem(
      child: Text("10 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "10",
    ),
    const DropdownMenuItem(
      child: Text("11 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "11",
    ),
    const DropdownMenuItem(
      value: "12",
      child: Text("12 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      value: "13",
      child: Text("13 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      child: Text("14 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "14",
    ),
    const DropdownMenuItem(
      child: Text("15 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "15",
    ),
    const DropdownMenuItem(
      child: Text("16 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "16",
    ),
    const DropdownMenuItem(
      child: Text("17 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "17",
    ),
    const DropdownMenuItem(
      value: "18",
      child: Text("18 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      value: "19",
      child: Text("19 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      child: Text("20 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "20",
    ),
    const DropdownMenuItem(
      child: Text("21 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "21",
    ),
    const DropdownMenuItem(
      child: Text("22 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "22",
    ),
    const DropdownMenuItem(
      child: Text("23 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "23",
    ),
    const DropdownMenuItem(
      value: "24",
      child: Text("24 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      value: "25",
      child: Text("25 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      child: Text("26 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "26",
    ),
    const DropdownMenuItem(
      child: Text("27 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "27",
    ),
    const DropdownMenuItem(
      child: Text("28 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "28",
    ),
    const DropdownMenuItem(
      child: Text("29 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "29",
    ),
    const DropdownMenuItem(
      value: "30",
      child: Text("30 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      value: "31",
      child: Text("31 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      child: Text("32 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "32",
    ),
    const DropdownMenuItem(
      child: Text("33 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "33",
    ),
    const DropdownMenuItem(
      child: Text("34 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "34",
    ),
    const DropdownMenuItem(
      child: Text("35 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "35",
    ),
    const DropdownMenuItem(
      value: "36",
      child: Text("36 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      value: "37",
      child: Text("37 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      child: Text("38 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "38",
    ),
    const DropdownMenuItem(
      child: Text("39 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "39",
    ),
    const DropdownMenuItem(
      child: Text("40 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "40",
    ),
    const DropdownMenuItem(
      child: Text("41 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "41",
    ),
    const DropdownMenuItem(
      value: "42",
      child: Text("42 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      value: "42",
      child: Text("42 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      child: Text("43 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "43",
    ),
    const DropdownMenuItem(
      child: Text("44 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "44",
    ),
    const DropdownMenuItem(
      value: "45",
      child: Text("45 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      value: "46",
      child: Text("46 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      child: Text("47 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "47",
    ),
    const DropdownMenuItem(
      child: Text("48 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "48",
    ),
    const DropdownMenuItem(
      child: Text("49 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "49",
    ),
    const DropdownMenuItem(
      child: Text("50 Floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "50",
    ),
  ];
  int? selectroomshop;

  List<DropdownMenuItem> roomitemshop = [
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

  String selectedstorageshop = "";
  List<DropdownMenuItem> storageitemshop = [
    const DropdownMenuItem(
      value: "1",
      child: Text("1 Storage",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      child: Text("2 Storage",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "2",
    ),
    const DropdownMenuItem(
      child: Text("3 Storage",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "3",
    ),
    const DropdownMenuItem(
      child: Text("4 Storage",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "4",
    ),
    const DropdownMenuItem(
      child: Text("5 Storage",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "5",
    ),
  ];
  int? selectbathshop;
  List<DropdownMenuItem> bathitemshop = [
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
  String selectedkitchenshop = "";
  List<DropdownMenuItem> kitchenitemshop = [
    const DropdownMenuItem(
      value: "1",
      child: Text("1 Kitchen",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      child: Text("2 Kitchen",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "2",
    ),
    const DropdownMenuItem(
      child: Text("3 Kitchen",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "3",
    ),
    const DropdownMenuItem(
      child: Text("4 Kitchen",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "4",
    ),
    const DropdownMenuItem(
      child: Text("5 Kitchen",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "5 ",
    ),
    const DropdownMenuItem(
      child: Text("6 Kitchen",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "6",
    ),
    const DropdownMenuItem(
      child: Text("7 Kitchen",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "7",
    ),
    const DropdownMenuItem(
      child: Text("8 Kitchen",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "8",
    ),
    const DropdownMenuItem(
      child: Text("9 Kitchen",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "9 ",
    ),
    const DropdownMenuItem(
      child: Text("10 Kitchen",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "10",
    )
  ];

  TextEditingController pricecontrolshop = TextEditingController();
  TextEditingController spacecontrollershop = TextEditingController();
  TextEditingController storageshopcontroller = TextEditingController();
  TextEditingController monthlyshopcontroller = TextEditingController();
  TextEditingController yearlyshopcontroller = TextEditingController();
  TextEditingController postnameshopcontroller = TextEditingController();
  var mycountryshop;
  var mystateshop;
  var mycityshop;
  bool postimagesshop = true;
  Color coorshop = Color.fromARGB(255, 99, 96, 96);
  Color rentcolorshop = Color.fromARGB(255, 99, 96, 96);
  Color salecolorshop = Color.fromARGB(255, 99, 96, 96);
  String? posthintshop = "(e.g) A house beside airport with garden";
  bool loading = false;
  File? file;
  File? singleshop;
  File? videofileshop;
  String? urlshop;
  String? videourlsshop;
  String? urlsshop;

  CollectionReference? imgref;
  firebase_storage.Reference? ref;
  firebase_storage.Reference? videoref;
  VideoPlayerController? _myvideo;
  ChewieController? chewie;
  selectimageshop() async {
    final ImagePicker imagepicks = ImagePicker();
    final XFile? image =
        await imagepicks.pickImage(source: ImageSource.gallery);
    singleshop = File(image!.path);
  }

  selectvideoshop() async {
    final ImagePicker imagepick = ImagePicker();
    final XFile? video = await imagepick.pickVideo(source: ImageSource.gallery);
    videofileshop = File(video!.path);
    _myvideo = VideoPlayerController.file(videofileshop!)
      ..initialize().then((_) {
        chewie = ChewieController(
            videoPlayerController: _myvideo!,
            aspectRatio: _myvideo!.value.aspectRatio);
        setState(() {});
      });

    setState(() {});
  }

  final ImagePicker imagepick = ImagePicker();
  List<XFile> multiimagesshop = [];
  void imagesmulti() async {
    final List<XFile>? pickimages = await imagepick.pickMultiImage();
    setState(() {
      if (pickimages!.isNotEmpty) {
        multiimagesshop.addAll(pickimages);
      }
      if (multiimagesshop.length >= 5) {
        postimagesshop = true;
        setState(() {});
      }
    });
  }

  LatLng? maploc;
  @override
  void dispose() {
    _myvideo!.dispose();
    chewie!.dispose();
    super.dispose();
  }

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
                  padding: EdgeInsets.only(top: 170),
                  child: Center(
                    child: Text(
                      "Enter your Shop location",
                      style: GoogleFonts.openSans(
                          fontSize: 18,
                          color: const Color.fromARGB(255, 45, 55, 59)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: CSCPicker(
                    layout: Layout.vertical,
                    onCountryChanged: (value) {
                      setState(() {
                        mycountryshop = value;
                      });
                    },
                    onCityChanged: (value) {
                      setState(() {
                        mycityshop = value;
                      });
                    },
                    onStateChanged: (value) {
                      setState(() {
                        mystateshop = value;
                      });
                    },
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Maps Google",
                  style: GoogleFonts.palanquin(
                      fontSize: 18, color: Color.fromARGB(255, 83, 87, 88)),
                ),
                SizedBox(height: 15),
                Container(
                  padding: EdgeInsets.only(top: 11),
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
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
                SizedBox(height: 40),
                Divider(
                  thickness: 0.5,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 400,
                  height: 120,
                  decoration: BoxDecoration(
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
                SizedBox(height: 30),
                Text(
                  "Enter your Shop details",
                  style: GoogleFonts.openSans(
                      fontSize: 18,
                      color: const Color.fromARGB(255, 45, 55, 59)),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Myinputtext(
                      hinttext: "Price in Dollar",
                      Padding: EdgeInsets.fromLTRB(12, 0, 0, 3),
                      controller: pricecontrolshop,
                      color: salecolorshop,
                    ),
                    Myinputtext(
                      hinttext: "Space in Meter",
                      Padding: EdgeInsets.fromLTRB(12, 0, 0, 3),
                      controller: spacecontrollershop,
                    )
                  ],
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(7)),
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
                                  color: coorshop),
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.fromLTRB(30, 0, 0, 5)),
                            elevation: 0,
                            items: flooritemshop,
                            onChanged: (value) {
                              setState(() => selectfloorshop = value);
                            })),
                    Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(7)),
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
                                  color: coorshop),
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.fromLTRB(27, 0, 0, 5)),
                            elevation: 0,
                            items: roomitemshop,
                            onChanged: (value) {
                              setState(() => selectroomshop = value);
                            }))
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(7)),
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
                                  color: coorshop),
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.fromLTRB(14, 0, 0, 5)),
                            elevation: 0,
                            items: bathitemshop,
                            onChanged: (value) {
                              setState(() => selectbathshop = value);
                            })),
                    Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(7)),
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
                                  color: coorshop),
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.fromLTRB(27, 0, 0, 5)),
                            elevation: 0,
                            items: kitchenitemshop,
                            onChanged: (value) {
                              setState(() => selectedkitchenshop = value);
                            }))
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(7)),
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
                                  fontWeight: FontWeight.w400, fontSize: 15),
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.fromLTRB(22, 0, 0, 5)),
                            elevation: 0,
                            items: storageitemshop,
                            onChanged: (value) {
                              setState(() => selectedstorageshop = value);
                            })),
                    Myinputtext(
                      hinttext: "Storage in Meter",
                      Padding: EdgeInsets.only(left: 4),
                      controller: storageshopcontroller,
                    )
                  ],
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Myinputtext(
                      hinttext: "Monthly Rent /\$",
                      Padding: EdgeInsets.fromLTRB(7, 0, 0, 3),
                      controller: monthlyshopcontroller,
                      color: rentcolorshop,
                    ),
                    Myinputtext(
                      hinttext: "Yearly Rent /\$",
                      Padding: EdgeInsets.fromLTRB(12, 0, 0, 3),
                      controller: yearlyshopcontroller,
                      color: rentcolorshop,
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
                    singleshop != null
                        ? Container(
                            width: 350,
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: FileImage(File(singleshop!.path)),
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
                    singleshop == null
                        ? Positioned(
                            left: 120,
                            top: 50,
                            child: IconButton(
                                onPressed: selectimageshop,
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
                              onPressed: selectimageshop,
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
                      color: (postimagesshop == true)
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
                        if (multiimagesshop.length >= 5) {
                          postimagesshop = true;

                          setState(() {});
                        } else {
                          postimagesshop = false;
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
                  height: multiimagesshop.isEmpty ? 50 : 200,
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1),
                        itemCount: multiimagesshop.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Stack(children: [
                            Container(
                              margin: const EdgeInsets.all(0),
                              width: 150,
                              height: 110,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: FileImage(
                                          File(multiimagesshop[index].path)),
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
                    _myvideo != null
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
                            child: _myvideo!.value.isInitialized
                                ? AspectRatio(
                                    aspectRatio: _myvideo!.value.aspectRatio,
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
                    _myvideo == null
                        ? Positioned(
                            left: 120,
                            top: 50,
                            child: IconButton(
                                onPressed: selectvideoshop,
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
                                selectvideoshop();
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
                          controller: postnameshopcontroller,
                          cursorColor: const Color.fromARGB(255, 31, 106, 129),
                          cursorHeight: 25,
                          cursorWidth: 1,
                          decoration: InputDecoration(
                              hintText: posthintshop,
                              hintStyle: GoogleFonts.robotoCondensed(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14,
                                  color: coorshop),
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
                          if (mycountryshop == null ||
                              mystateshop == null ||
                              mycityshop == null ||
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
                            if (pricecontrolshop.text.isNotEmpty &
                                spacecontrollershop.text.isNotEmpty &
                                (selectfloorshop != "") &
                                (selectedkitchenshop != "") &
                                (selectbathshop != null) &
                                (selectroomshop != null) &
                                postnameshopcontroller.text.isNotEmpty) {
                              if (multiimagesshop.length >= 5 &&
                                  singleshop != null) {
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
                                postimagesshop = false;
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
                              coorshop = Colors.red;
                              salecolorshop = Colors.red;
                              rentcolorshop =
                                  const Color.fromARGB(255, 99, 96, 96);

                              posthintshop = "Require a name for the post";
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
                          if (mycountryshop == null ||
                              mystateshop == null ||
                              mycityshop == null ||
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
                            if (monthlyshopcontroller.text.isNotEmpty ||
                                yearlyshopcontroller.text.isNotEmpty &
                                    spacecontrollershop.text.isNotEmpty &
                                    (selectfloorshop != "") &
                                    (selectedkitchenshop != "") &
                                    (selectbathshop != null) &
                                    (selectroomshop != null) &
                                    postnameshopcontroller.text.isNotEmpty) {
                              if (multiimagesshop.length >= 5 &&
                                  singleshop != null) {
                                await uploadrentshop();
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
                              coorshop = Colors.red;
                              rentcolorshop = Colors.red;
                              salecolorshop =
                                  const Color.fromARGB(255, 99, 96, 96);
                              posthintshop = "Require a name for the post";
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

  Future uploadsaleshop() async {
    loading = true;
    int price = int.parse(pricecontrolshop.text.trim());
    int space = int.parse(spacecontrollershop.text.trim());
    String email = FirebaseAuth.instance.currentUser!.email!;

    setState(() {});
    String uid = FirebaseAuth.instance.currentUser!.uid;
    CollectionReference imagesref = FirebaseFirestore.instance
        .collection('Sale')
        .doc(uid + postnameshopcontroller.text.trim())
        .collection('imagelist');

    ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child("/Mainimage/$uid/${basename(singleshop!.path)}");
    await ref!.putFile(singleshop!);
    urlshop = await ref!.getDownloadURL();
    videofileshop != null
        ? videoref = firebase_storage.FirebaseStorage.instance
            .ref()
            .child("/video/$uid/${basename(videofileshop!.path)}")
        : "";
    videofileshop != null ? await videoref!.putFile(videofileshop!) : "";

    videofileshop != null
        ? videourlsshop = await videoref!.getDownloadURL()
        : "";
    try {
      await FirebaseFirestore.instance
          .collection("Sale")
          .doc(uid + postnameshopcontroller.text.trim())
          .set({
        "Type": "Sale",
        "BedRooms": selectroomshop,
        "City": mycityshop,
        "Country": mycountryshop,
        "Postname": postnameshopcontroller.text,
        "Price": price,
        "Tag": "Shop",
        "YearlyRent": "empty",
        "MonthlyRent": "empty",
        "Space": spacecontrollershop.text.trim(),
        "State": mystateshop,
        "image": urlshop,
        "video": videourlsshop ?? "",
        "Floors": selectfloorshop ?? "",
        "Bath": selectbathshop,
        "Kitchen": selectedkitchenshop,
        "Storage": selectedstorageshop ?? "",
        "Map": maploc.toString(),
        "Storagemeter": storageshopcontroller.text.trim() ?? "",
        "Pricecat": giveprice(price),
        "Spacecat": givespace(space),
        "Bedcat": givesbed(selectroomshop),
        "Bathcat": givesbath(selectbathshop),
        "Salerid": uid,
        "Saleremail": email,
        "Salername": await FirebaseFirestore.instance
            .collection('Users')
            .doc(uid)
            .get()
            .then((ds) {
          return ds["username"];
        }),
        "Timestamp": Timestamp.now()
      }).whenComplete(() async {
        for (var imges in multiimagesshop) {
          file = File(imges.path);

          ref = firebase_storage.FirebaseStorage.instance
              .ref()
              .child("/imagesmulti/$uid/${basename(imges.path)}");
          await ref!.putFile(file!);
          await ref!.getDownloadURL().then(
            (value) async {
              urlsshop = value;
              await imagesref.add({"imageurl": value});
            },
          );
        }
        FirebaseFirestore.instance
            .collection('Users')
            .doc(uid)
            .collection("Mypost")
            .doc(uid + postnameshopcontroller.text.trim())
            .set({
          "Price": pricecontrolshop.text.trim(),
          "image": url,
          "Country": mycountryshop,
          "State": mystateshop,
          "City": mycityshop,
          "Salerid": uid,
          "docid": uid + postnameshopcontroller.text.trim()
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

  Future uploadrentshop() async {
    loading = true;
    String email = FirebaseAuth.instance.currentUser!.email!;

    int price = int.parse(yearlyshopcontroller.text.trim());
    int space = int.parse(spacecontrollershop.text.trim());
    setState(() {});
    String uid = FirebaseAuth.instance.currentUser!.uid;
    CollectionReference imagesref = FirebaseFirestore.instance
        .collection('Sale')
        .doc(uid + postnameshopcontroller.text.trim())
        .collection('imagelist');

    ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child("/Mainimage/$uid/${basename(singleshop!.path)}");
    await ref!.putFile(singleshop!);
    urlshop = await ref!.getDownloadURL();
    videofileshop != null
        ? videoref = firebase_storage.FirebaseStorage.instance
            .ref()
            .child("/video/$uid/${basename(videofileshop!.path)}")
        : "";
    videofileshop != null ? await videoref!.putFile(videofileshop!) : "";

    videofileshop != null
        ? videourlsshop = await videoref!.getDownloadURL()
        : "";
    try {
      await FirebaseFirestore.instance
          .collection("Sale")
          .doc(uid + postnameshopcontroller.text.trim())
          .set({
        "Type": "Rent",
        "BedRooms": selectroomshop,
        "City": mycityshop,
        "Country": mycountryshop,
        "Postname": postnameshopcontroller.text,
        "Price": price,
        "Tag": "Shop",
        "YearlyRent": yearlyshopcontroller.text.trim(),
        "MonthlyRent": monthlyshopcontroller.text.trim(),
        "Space": spacecontrollershop.text.trim(),
        "State": mystateshop,
        "image": urlshop,
        "video": videourlsshop ?? "",
        "Floors": selectfloorshop ?? "",
        "Bath": selectbathshop,
        "Kitchen": selectedkitchenshop,
        "Storage": selectedstorageshop ?? "",
        "Map": maploc.toString(),
        "Storagemeter": storageshopcontroller.text.trim() ?? "",
        "Pricecat": giveprice(price),
        "Spacecat": givespace(space),
        "Bedcat": givesbed(selectroomshop),
        "Bathcat": givesbath(selectbathshop),
        "Saleremail": email,
        "Salerid": uid,
        "Salername": await FirebaseFirestore.instance
            .collection('Users')
            .doc(uid)
            .get()
            .then((ds) {
          return ds["username"];
        }),
        "Timestamp": Timestamp.now()
      }).whenComplete(() async {
        for (var imges in multiimagesshop) {
          file = File(imges.path);

          ref = firebase_storage.FirebaseStorage.instance
              .ref()
              .child("/imagesmulti/$uid/${basename(imges.path)}");
          await ref!.putFile(file!);
          await ref!.getDownloadURL().then(
            (value) async {
              urlsshop = value;
              await imagesref.add({"imageurl": value});
            },
          );
        }
        FirebaseFirestore.instance
            .collection('Users')
            .doc(uid)
            .collection("Mypost")
            .doc(uid + postnameshopcontroller.text.trim())
            .set({
          "Price": price,
          "image": url,
          "Country": mycountryshop,
          "State": mystateshop,
          "City": mycityshop,
          "Salerid": uid,
          "docid": uid + postnameshopcontroller.text.trim()
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
