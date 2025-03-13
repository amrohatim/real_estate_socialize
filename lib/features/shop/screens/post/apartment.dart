import 'dart:io';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:awesome_top_snackbar/awesome_top_snackbar.dart';
import 'package:chewie/chewie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/constants/googlemap.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:path/path.dart';

import 'package:flutter_application_2/utils/constants/myestatetextfields.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'package:google_fonts/google_fonts.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class MyApartment extends StatefulWidget {
  const MyApartment({
    super.key,
  });

  @override
  State<MyApartment> createState() => _MyApartmentState();
}

class _MyApartmentState extends State<MyApartment> {
  String? selectfloorapart = "";
  List<DropdownMenuItem> flooritemapart = [
    const DropdownMenuItem(
      value: "0",
      child: Text("Ground floor",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      value: "1",
      child: Text("1ST",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      child: Text("2ND",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "2",
    ),
    const DropdownMenuItem(
      child: Text("3RD",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "3",
    ),
    const DropdownMenuItem(
      child: Text("4TH",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "4",
    ),
    const DropdownMenuItem(
      child: Text("5TH",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "5",
    ),
    const DropdownMenuItem(
      value: "6",
      child: Text("6TH",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      value: "7",
      child: Text("7TH",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      child: Text("8TH",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "8",
    ),
    const DropdownMenuItem(
      child: Text("9TH",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "9",
    ),
    const DropdownMenuItem(
      child: Text("10TH",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "10",
    ),
    const DropdownMenuItem(
      child: Text("11TH",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "11",
    ),
    const DropdownMenuItem(
      value: "12",
      child: Text("12TH",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      value: "13",
      child: Text("13TH",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      child: Text("14TH",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "14",
    ),
    const DropdownMenuItem(
      child: Text("15TH",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "15",
    ),
    const DropdownMenuItem(
      child: Text("16TH",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "16",
    ),
    const DropdownMenuItem(
      child: Text("17TH",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "17",
    ),
    const DropdownMenuItem(
      value: "18",
      child: Text("18TH",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      value: "19",
      child: Text("19TH",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      child: Text("20TH",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "20",
    ),
    const DropdownMenuItem(
      child: Text("21TH",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "21",
    ),
    const DropdownMenuItem(
      child: Text("22TH",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "22",
    ),
    const DropdownMenuItem(
      child: Text("23TH",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "23",
    ),
    const DropdownMenuItem(
      value: "24",
      child: Text("24TH",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      value: "25",
      child: Text("25TH",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      child: Text("26TH",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "26",
    ),
    const DropdownMenuItem(
      child: Text("27TH",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "27",
    ),
    const DropdownMenuItem(
      child: Text("28TH",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "28",
    ),
    const DropdownMenuItem(
      child: Text("29TH",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "29",
    ),
    const DropdownMenuItem(
      value: "30",
      child: Text("30TH",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      value: "31",
      child: Text("31TH",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      child: Text("32TH",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "32",
    ),
    const DropdownMenuItem(
      child: Text("33TH",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "33",
    ),
    const DropdownMenuItem(
      child: Text("34TH",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "34",
    ),
    const DropdownMenuItem(
      child: Text("35TH",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "35",
    ),
    const DropdownMenuItem(
      value: "36",
      child: Text("36TH",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      value: "37",
      child: Text("37TH",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      child: Text("38TH",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "38",
    ),
    const DropdownMenuItem(
      child: Text("39TH",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "39",
    ),
    const DropdownMenuItem(
      child: Text("40TH",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "40",
    ),
    const DropdownMenuItem(
      child: Text("41TH",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "41",
    ),
    const DropdownMenuItem(
      value: "42",
      child: Text("42TH",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      value: "42",
      child: Text("42TH",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      child: Text("43TH",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "43",
    ),
    const DropdownMenuItem(
      child: Text("44TH",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "44",
    ),
    const DropdownMenuItem(
      value: "45",
      child: Text("45TH",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      value: "46",
      child: Text("46TH",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
    ),
    const DropdownMenuItem(
      child: Text("47TH",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "47",
    ),
    const DropdownMenuItem(
      child: Text("48TH",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "48",
    ),
    const DropdownMenuItem(
      child: Text("49TH",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "49",
    ),
    const DropdownMenuItem(
      child: Text("50TH",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
      value: "50",
    ),
  ];
  int? selectroomapart;
  List<DropdownMenuItem> roomitemapart = [
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
  int? selectbathapart;
  List<DropdownMenuItem> bathitemapart = [
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
  String selectedkitchenapart = "";
  List<DropdownMenuItem> kitchenitemapart = [
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

  TextEditingController pricecontrolapart = TextEditingController();
  TextEditingController spacecontrollerapart = TextEditingController();
  TextEditingController monthlyapartcontroller = TextEditingController();
  TextEditingController yearlyapartcontroller = TextEditingController();
  TextEditingController postnameapartcontroller = TextEditingController();

  var mycountryapart;
  var mystateapart;
  var mycityapart;

  bool postimagesapart = true;
  LatLng? maploc;

  bool loading = false;
  File? file;
  File? singleapart;
  File? videofileapart;
  String? urlapart;
  String? videourlsapart;
  String? urlsapart;

  CollectionReference? imgref;
  firebase_storage.Reference? ref;
  firebase_storage.Reference? videoref;
  VideoPlayerController? _myvideo;
  ChewieController? chewie;

  selectimageapart() async {
    final ImagePicker imagepick = ImagePicker();
    final XFile? image = await imagepick.pickImage(source: ImageSource.gallery);
    singleapart = File(image!.path);
  }

  selectvideoapart() async {
    final ImagePicker imagepick = ImagePicker();
    final XFile? video = await imagepick.pickVideo(source: ImageSource.gallery);
    videofileapart = File(video!.path);
    _myvideo = VideoPlayerController.file(videofileapart!)
      ..initialize().then((_) {
        chewie = ChewieController(
            videoPlayerController: _myvideo!,
            aspectRatio: _myvideo!.value.aspectRatio);
        setState(() {});
      });

    setState(() {});
  }

  String? salername;

  final ImagePicker imagepick = ImagePicker();
  List<XFile> multiimagesapart = [];
  void imagesmulti() async {
    final List<XFile>? pickimages = await imagepick.pickMultiImage();
    setState(() {
      if (pickimages!.isNotEmpty) {
        multiimagesapart.addAll(pickimages);
      }
      if (multiimagesapart.length >= 5) {
        postimagesapart = true;
        setState(() {});
      }
    });
  }

  Color coorapart = Color.fromARGB(255, 99, 96, 96);
  Color rentcolorapart = Color.fromARGB(255, 99, 96, 96);
  Color salecolorapart = Color.fromARGB(255, 99, 96, 96);
  String? posthintapart = "(e.g) A house beside airport with garden";
  String uid = FirebaseAuth.instance.currentUser!.uid;

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
                  padding: const EdgeInsets.only(top: 170),
                  child: Center(
                    child: Text(
                      "Enter your Apartment location",
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
                    showCities: true,
                    showStates: true,
                    onCountryChanged: (value) {
                      setState(() {
                        mycountryapart = value;
                      });
                    },
                    onCityChanged: (value) {
                      mycityapart = value;
                    },
                    onStateChanged: (value) {
                      mystateapart = value;
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
                  "Enter your Apartment details",
                  style: GoogleFonts.openSans(
                      fontSize: 18,
                      color: const Color.fromARGB(255, 45, 55, 59)),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Myinputtext(
                      controller: pricecontrolapart,
                      hinttext: "Price in Dollar",
                      color: salecolorapart,
                      Padding: EdgeInsets.fromLTRB(12, 0, 0, 3),
                    ),
                    Myinputtext(
                      controller: spacecontrollerapart,
                      color: coorapart,
                      hinttext: "Space in Meter",
                      Padding: EdgeInsets.fromLTRB(12, 0, 0, 3),
                    ),
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
                              "Floor level",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: coorapart),
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.fromLTRB(21, 0, 0, 5)),
                            elevation: 0,
                            items: flooritemapart,
                            onChanged: (value) {
                              setState(() => selectfloorapart = value);
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
                                  color: coorapart),
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.fromLTRB(27, 0, 0, 5)),
                            elevation: 0,
                            items: roomitemapart,
                            onChanged: (value) {
                              setState(() => selectroomapart = value);
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
                                  color: coorapart),
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.fromLTRB(14, 0, 0, 5)),
                            elevation: 0,
                            items: bathitemapart,
                            onChanged: (value) {
                              setState(() => selectbathapart = value);
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
                                  color: coorapart),
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.fromLTRB(27, 0, 0, 5)),
                            elevation: 0,
                            items: kitchenitemapart,
                            onChanged: (value) {
                              setState(() => selectedkitchenapart = value);
                            }))
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Myinputtext(
                      controller: monthlyapartcontroller,
                      hinttext: "Monthly Rent /\$",
                      Padding: EdgeInsets.fromLTRB(7, 0, 0, 3),
                      color: rentcolorapart,
                    ),
                    Myinputtext(
                      controller: yearlyapartcontroller,
                      hinttext: "Yearly Rent /\$",
                      Padding: EdgeInsets.fromLTRB(12, 0, 0, 3),
                      color: rentcolorapart,
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
                    singleapart != null
                        ? Container(
                            width: 350,
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: FileImage(File(singleapart!.path)),
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
                    singleapart == null
                        ? Positioned(
                            left: 120,
                            top: 50,
                            child: IconButton(
                                onPressed: selectimageapart,
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
                              onPressed: selectimageapart,
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
                      color: (postimagesapart == true)
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
                        if (multiimagesapart.length >= 5) {
                          postimagesapart = true;

                          setState(() {});
                        } else {
                          postimagesapart = false;
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
                  height: multiimagesapart.isEmpty ? 50 : 200,
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1),
                        itemCount: multiimagesapart.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Stack(children: [
                            Container(
                              margin: const EdgeInsets.all(0),
                              width: 150,
                              height: 110,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: FileImage(
                                          File(multiimagesapart[index].path)),
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
                                onPressed: selectvideoapart,
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
                                selectvideoapart();
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
                          controller: postnameapartcontroller,
                          cursorColor: const Color.fromARGB(255, 31, 106, 129),
                          cursorHeight: 25,
                          cursorWidth: 1,
                          decoration: InputDecoration(
                              hintText: posthintapart,
                              hintStyle: GoogleFonts.robotoCondensed(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14,
                                  color: coorapart),
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
                          if (mycountryapart == null ||
                              mystateapart == null ||
                              mycityapart == null ||
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

                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(snackBar);
                          } else {
                            if (pricecontrolapart.text.isNotEmpty &
                                spacecontrollerapart.text.isNotEmpty &
                                (selectfloorapart != "") &
                                (selectedkitchenapart != "") &
                                (selectbathapart != null) &
                                (selectroomapart != null) &
                                postnameapartcontroller.text.isNotEmpty) {
                              if (multiimagesapart.length >= 5 &&
                                  singleapart != null) {
                                await uploadsaleapart();
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
                                postimagesapart = false;
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
                              coorapart = Colors.red;
                              salecolorapart = Colors.red;
                              rentcolorapart =
                                  const Color.fromARGB(255, 99, 96, 96);

                              posthintapart = "Require a name for the post";
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
                          if (mycountryapart == null ||
                              mystateapart == null ||
                              mycityapart == null ||
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
                            if (monthlyapartcontroller.text.isNotEmpty &
                                    yearlyapartcontroller.text.isNotEmpty &
                                    spacecontrollerapart.text.isNotEmpty &&
                                selectfloorapart != "" &&
                                selectedkitchenapart != "" &&
                                selectbathapart != null &&
                                selectroomapart != null &&
                                postnameapartcontroller.text.isNotEmpty) {
                              if (multiimagesapart.length >= 5 &&
                                  singleapart != null) {
                                await uploadrentapart();
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
                              coorapart = Colors.red;
                              rentcolorapart = Colors.red;
                              salecolorapart =
                                  const Color.fromARGB(255, 99, 96, 96);
                              posthintapart = "Require a name for the post";
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

  Future uploadsaleapart() async {
    loading = true;
    int price = int.parse(pricecontrolapart.text.trim());
    int space = int.parse(spacecontrollerapart.text.trim());
    String email = FirebaseAuth.instance.currentUser!.email!;

    setState(() {});
    CollectionReference imagesref = FirebaseFirestore.instance
        .collection('Sale')
        .doc(uid + postnameapartcontroller.text.trim())
        .collection('imagelist');

    ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child("/Mainimage/$uid/${basename(singleapart!.path)}");
    await ref!.putFile(singleapart!);
    urlapart = await ref!.getDownloadURL();
    videofileapart != null
        ? videoref = firebase_storage.FirebaseStorage.instance
            .ref()
            .child("/video/$uid/${basename(videofileapart!.path)}")
        : "";
    videofileapart != null ? await videoref!.putFile(videofileapart!) : "";

    videofileapart != null
        ? videourlsapart = await videoref!.getDownloadURL()
        : "";
    try {
      await FirebaseFirestore.instance
          .collection("Sale")
          .doc(uid + postnameapartcontroller.text.trim())
          .set({
        "Type": "Sale",
        "BedRooms": selectroomapart,
        "City": mycityapart,
        "Country": mycountryapart,
        "Postname": postnameapartcontroller.text,
        "Price": price,
        "YearlyRent": "empty",
        "MonthlyRent": "empty",
        "Tag": "apartment",
        "Space": space,
        "State": mystateapart,
        "image": urlapart,
        "video": videourlsapart ?? "",
        "Floors": selectfloorapart ?? "",
        "Bath": selectbathapart,
        "Kitchen": selectedkitchenapart,
        "Map": maploc.toString(),
        "Pricecat": giveprice(price),
        "Spacecat": givespace(space),
        "Bedcat": givesbed(selectroomapart),
        "Bathcat": givesbath(selectbathapart),
        'Salerid': uid,
        "Saleremail": email,
        "Salername": await FirebaseFirestore.instance
            .collection('Users')
            .doc(uid)
            .get()
            .then((ds) {
          return salername = ds["username"];
        }),
      }).whenComplete(() async {
        for (var imges in multiimagesapart) {
          file = File(imges.path);

          ref = firebase_storage.FirebaseStorage.instance
              .ref()
              .child("/imagesmulti/$uid/${basename(imges.path)}");
          await ref!.putFile(file!);
          await ref!.getDownloadURL().then(
            (value) async {
              urlsapart = value;
              await imagesref.add({"imageurl": value});
            },
          );
        }
        FirebaseFirestore.instance
            .collection('Users')
            .doc(uid)
            .collection("Mypost")
            .doc(uid + postnameapartcontroller.text.trim())
            .set({
          "Price": pricecontrolapart.text.trim(),
          "image": url,
          "Country": mycountryapart,
          "State": mystateapart,
          "City": mycityapart,
          "Salerid": uid,
          "docid": uid + postnameapartcontroller.text.trim()
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

  Future uploadrentapart() async {
    loading = true;

    int price = int.parse(yearlyapartcontroller.text.trim());
    int space = int.parse(spacecontrollerapart.text.trim());
    String email = FirebaseAuth.instance.currentUser!.email!;

    setState(() {});
    CollectionReference imagesref = FirebaseFirestore.instance
        .collection('Sale')
        .doc(uid + postnameapartcontroller.text.trim())
        .collection('imagelist');

    ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child("/Mainimage/$uid/${basename(singleapart!.path)}");
    await ref!.putFile(singleapart!);
    urlapart = await ref!.getDownloadURL();
    videofileapart != null
        ? videoref = firebase_storage.FirebaseStorage.instance
            .ref()
            .child("/video/$uid/${basename(videofileapart!.path)}")
        : "";
    videofileapart != null ? await videoref!.putFile(videofileapart!) : "";

    videofileapart != null
        ? videourlsapart = await videoref!.getDownloadURL()
        : "";
    try {
      await FirebaseFirestore.instance
          .collection("Sale")
          .doc(uid + postnameapartcontroller.text.trim())
          .set({
        "Type": "Rent",
        "BedRooms": selectroomapart,
        "City": mycityapart,
        "Country": mycountryapart,
        "Postname": postnameapartcontroller.text,
        "Price": price,
        "YearlyRent": yearlyapartcontroller.text.trim(),
        "MonthlyRent": monthlyapartcontroller.text.trim(),
        "Tag": "apartment",
        "Space": spacecontrollerapart.text.trim(),
        "State": mystateapart,
        "image": urlapart,
        "video": videourlsapart ?? "",
        "Floorlevel": selectfloorapart ?? "",
        "Bath": selectbathapart,
        "Kitchen": selectedkitchenapart,
        "Map": maploc.toString(),
        "Pricecat": giveprice(price),
        "Spacecat": givespace(space),
        "Bedcat": givesbed(selectroomapart),
        "Bathcat": givesbath(selectbathapart),
        'Salerid': uid,
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
        for (var imges in multiimagesapart) {
          file = File(imges.path);

          ref = firebase_storage.FirebaseStorage.instance
              .ref()
              .child("/imagesmulti/$uid/${basename(imges.path)}");
          await ref!.putFile(file!);
          await ref!.getDownloadURL().then(
            (value) async {
              urlsapart = value;
              await imagesref.add({"imageurl": value});
            },
          );
        }
        FirebaseFirestore.instance
            .collection('Users')
            .doc(uid)
            .collection("Mypost")
            .doc(uid + postnameapartcontroller.text.trim())
            .set({
          "Price": price,
          "image": url,
          "Country": mycountryapart,
          "State": mystateapart,
          "City": mycityapart,
          "Salerid": uid,
          "docid": uid + postnameapartcontroller.text.trim()
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
