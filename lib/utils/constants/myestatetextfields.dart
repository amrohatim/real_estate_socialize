import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Myinputtext extends StatelessWidget {
  const Myinputtext(
      {super.key,
      required this.hinttext,
      this.Padding,
      this.controller,
      this.val,
      this.color});
  final String hinttext;
  final Padding;
  final controller;
  final val;
  final color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Padding,
      height: 40,
      width: 130,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(7)),
          boxShadow: [
            BoxShadow(offset: Offset(0.1, 0.1), color: Colors.blueAccent),
          ]),
      child: TextFormField(
        validator: val,
        controller: controller,
        cursorColor: Colors.grey,
        cursorHeight: 23,
        cursorWidth: 0.9,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(bottom: 10, left: 2),
          hintText: hinttext,
          hintStyle: GoogleFonts.openSans(
              fontWeight: FontWeight.w400, fontSize: 15, color: color),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class MyFloordrop extends StatefulWidget {
  const MyFloordrop({super.key, this.roomval});
  final roomval;
  @override
  State<MyFloordrop> createState() => _MyFloordropState(roomval);
}

class _MyFloordropState extends State<MyFloordrop> {
  var _selectitem;
  final roomval;
  _MyFloordropState(this.roomval);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(7)),
            border: Border.all(color: Colors.grey, width: 0.2)),
        width: 130,
        height: 40,
        child: DropdownButtonFormField(
          validator: roomval,
          menuMaxHeight: 250,
          hint: Text(
            "Floors",
            style:
                GoogleFonts.openSans(fontWeight: FontWeight.w400, fontSize: 15),
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.fromLTRB(27, 0, 0, 5)),
          elevation: 0,
          items: [
            "1Floor",
            "2Floor",
            "3Floor",
            "4Floor",
            "5Floor",
            "6Floor",
            "7Floor",
            "8Floor",
            "9Floor",
            "10Floor",
            "11Floor",
            "12Floor",
            "13Floor",
            "14Floor",
            "15Floor",
            "16Floor",
            "17Floor",
            "18Floor",
            "19Floor",
            "20Floor",
            "21Floor",
            "22Floor",
            "23Floor",
            "24Floor",
            "25Floor",
            "26Floor",
            "27Floor",
            "28Floor",
            "29Floor",
            "30Floor",
            "31Floor",
            "32Floor",
            "33Floor",
            "34Floor",
            "35Floor",
            "36Floor",
            "37Floor",
            "38Floor",
            "39Floor",
            "40Floor",
            "41Floor",
            "42Floor",
            "43Floor",
            "44Floor",
            "45Floor",
            "46Floor",
            "47Floor",
            "48Floor",
            "49Floor",
            "50Floor",
          ]
              .map((e) => DropdownMenuItem(
                    child: Text(
                      "$e",
                      style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w300, fontSize: 15),
                    ),
                    value: e,
                  ))
              .toList(),
          onChanged: (val) {
            setState(() {
              _selectitem = val.toString();
            });
          },
        ));
  }
}

class MyDropBathroom extends StatefulWidget {
  MyDropBathroom({super.key, this.roomval});
  final roomval;

  @override
  State<MyDropBathroom> createState() => _MyDropBathroomState(roomval);
}

class _MyDropBathroomState extends State<MyDropBathroom> {
  final roomval;
  _MyDropBathroomState(this.roomval);
  var selectbath;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(7)),
            border: Border.all(color: Colors.grey, width: 0.2)),
        width: 130,
        height: 40,
        child: DropdownButtonFormField(
          validator: roomval,
          menuMaxHeight: 250,
          hint: Text(
            "BathRoom",
            style:
                GoogleFonts.openSans(fontWeight: FontWeight.w400, fontSize: 15),
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.fromLTRB(25, 0, 0, 5)),
          elevation: 0,
          items: [
            "1BathRoom",
            "2BathRoom",
            "3BathRoom",
            "4BathRoom",
            "5BathRoom",
            "6BathRoom",
            "7BathRoom",
            "8BathRoom",
            "9BathRoom",
            "10BathRoom",
            "11BathRoom",
            "12BathRoom",
            "13BathRoom",
            "14BathRoom",
            "15BathRoom",
            "16BathRoom",
            "17BathRoom",
            "18BathRoom",
            "19BathRoom",
            "20BathRoom",
            "21BathRoom",
            "22BathRoom",
            "23BathRoom",
            "24BathRoom",
            "25BathRoom",
            "+25BathRoom"
          ]
              .map((e) => DropdownMenuItem(
                    child: Text(
                      "$e",
                      style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w300, fontSize: 12),
                    ),
                    value: e,
                  ))
              .toList(),
          onChanged: (val) {
            setState(() {
              selectbath = val.toString();
            });
          },
        ));
  }
}

class MyDropBasement extends StatefulWidget {
  const MyDropBasement({super.key, this.roomval});
  final roomval;
  @override
  State<MyDropBasement> createState() => _MyDropBasementState(roomval);
}

class _MyDropBasementState extends State<MyDropBasement> {
  final roomval;
  _MyDropBasementState(this.roomval);
  var selectbase;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(7)),
            border: Border.all(color: Colors.grey, width: 0.2)),
        width: 130,
        height: 40,
        child: DropdownButtonFormField(
          validator: roomval,
          menuMaxHeight: 250,
          hint: Text(
            "Basement",
            style:
                GoogleFonts.openSans(fontWeight: FontWeight.w400, fontSize: 15),
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.fromLTRB(27, 0, 0, 5)),
          elevation: 0,
          items: [
            "1Basement",
            "2Basement",
            "3Basement",
            "4Basement",
            "5Basement",
          ]
              .map((e) => DropdownMenuItem(
                    child: Text(
                      "$e",
                      style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w300, fontSize: 15),
                    ),
                    value: e,
                  ))
              .toList(),
          onChanged: (val) {
            setState(() {
              selectbase = val.toString();
            });
          },
        ));
  }
}

class MyDropStorage extends StatefulWidget {
  const MyDropStorage({super.key, this.roomval});
  final roomval;
  @override
  State<MyDropStorage> createState() => _MyDropStorageState(roomval);
}

class _MyDropStorageState extends State<MyDropStorage> {
  final roomval;
  _MyDropStorageState(this.roomval);
  var selectstorage;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(7)),
            border: Border.all(color: Colors.grey, width: 0.2)),
        width: 130,
        height: 40,
        child: DropdownButtonFormField(
          validator: roomval,
          menuMaxHeight: 250,
          hint: Text(
            "Storage",
            style:
                GoogleFonts.openSans(fontWeight: FontWeight.w400, fontSize: 15),
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.fromLTRB(27, 0, 0, 5)),
          elevation: 0,
          items: [
            "1Storage",
            "2Storage",
            "3Storage",
            "4Storage",
            "5Storage",
          ]
              .map((e) => DropdownMenuItem(
                    child: Text(
                      "$e",
                      style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w300, fontSize: 15),
                    ),
                    value: e,
                  ))
              .toList(),
          onChanged: (val) {
            setState(() {
              selectstorage = val.toString();
            });
          },
        ));
  }
}

class MyDropGarage extends StatefulWidget {
  const MyDropGarage({super.key, this.roomval});
  final roomval;

  @override
  State<MyDropGarage> createState() => _MyDropGarageState(roomval);
}

class _MyDropGarageState extends State<MyDropGarage> {
  final roomval;
  _MyDropGarageState(this.roomval);
  var selectgarage;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(7)),
            border: Border.all(color: Colors.grey, width: 0.2)),
        width: 130,
        height: 40,
        child: DropdownButtonFormField(
          validator: roomval,
          menuMaxHeight: 250,
          hint: Text(
            "Garage",
            style:
                GoogleFonts.openSans(fontWeight: FontWeight.w400, fontSize: 15),
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.fromLTRB(27, 0, 0, 5)),
          elevation: 0,
          items: [
            "1Garage",
            "2Garage",
            "3Garage",
            "4Garage",
            "5Garage",
          ]
              .map((e) => DropdownMenuItem(
                    child: Text(
                      "$e",
                      style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w300, fontSize: 15),
                    ),
                    value: e,
                  ))
              .toList(),
          onChanged: (val) {
            setState(() {
              selectgarage = val.toString();
            });
          },
        ));
  }
}

class MyElvator extends StatefulWidget {
  const MyElvator({super.key, this.roomval});
  final roomval;

  @override
  State<MyElvator> createState() => _MyElvatorState(roomval);
}

class _MyElvatorState extends State<MyElvator> {
  final roomval;
  _MyElvatorState(this.roomval);
  var selectelevator;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(7)),
            border: Border.all(color: Colors.grey, width: 0.2)),
        width: 130,
        height: 40,
        child: DropdownButtonFormField(
          validator: roomval,
          menuMaxHeight: 250,
          hint: Text(
            "Elevator",
            style:
                GoogleFonts.openSans(fontWeight: FontWeight.w400, fontSize: 15),
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.fromLTRB(27, 0, 0, 5)),
          elevation: 0,
          items: [
            "1Elevator",
            "2Elevator",
            "3Elevator",
            "4Elevator",
            "5Elevator",
            "6Elevator",
            "7Elevator",
            "8Elevator",
            "9Elevator",
            "10Elevator",
          ]
              .map((e) => DropdownMenuItem(
                    child: Text(
                      "$e",
                      style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w300, fontSize: 15),
                    ),
                    value: e,
                  ))
              .toList(),
          onChanged: (val) {
            setState(() {
              selectelevator = val.toString();
            });
          },
        ));
  }
}

class MyNumofapart extends StatefulWidget {
  const MyNumofapart({super.key, this.roomval});
  final roomval;

  @override
  State<MyNumofapart> createState() => _MyNumofapartState(roomval);
}

class _MyNumofapartState extends State<MyNumofapart> {
  final roomval;
  _MyNumofapartState(this.roomval);
  var selectapart;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(7, 0, 0, 0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(7)),
            border: Border.all(color: Colors.grey, width: 0.2)),
        width: 130,
        height: 40,
        child: DropdownButtonFormField(
          validator: roomval,
          menuMaxHeight: 250,
          hint: Text(
            "Apartments",
            style:
                GoogleFonts.openSans(fontWeight: FontWeight.w400, fontSize: 14),
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 5)),
          elevation: 0,
          items: [
            "1Apartment",
            "2Apartments",
            "3Apartments",
            "4Apartments",
            "5Apartments",
            "6Apartments",
            "7Apartments",
            "8Apartments",
            "9Apartments",
            "10Apartments",
            "11Apartments",
            "12Apartments",
            "13Apartments",
            "14Apartments",
            "15Apartments",
            "16Apartments",
            "17Apartments",
            "18Apartments",
            "19Apartments",
            "20Apartments",
            "21Apartments",
            "22Apartments",
            "23Apartments",
            "24Apartments",
            "25Apartments",
            "26Apartments",
            "27Apartments",
            "28Apartments",
            "29Apartments",
            "30Apartments",
            "31Apartments",
            "32Apartments",
            "33Apartments",
            "34Apartments",
            "35Apartments",
            "36Apartments",
            "37Apartments",
            "38Apartments",
            "39Apartments",
            "40Apartments",
            "+40"
          ]
              .map((e) => DropdownMenuItem(
                    child: Text(
                      "$e",
                      style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w300, fontSize: 15),
                    ),
                    value: e,
                  ))
              .toList(),
          onChanged: (val) {
            setState(() {
              selectapart = val.toString();
            });
          },
        ));
  }
}

class MyDropFloor extends StatefulWidget {
  const MyDropFloor({super.key});

  @override
  State<MyDropFloor> createState() => _MyDropFloorState();
}

class _MyDropFloorState extends State<MyDropFloor> {
  var selectflev = "1ST";
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(7)),
            border: Border.all(color: Colors.grey, width: 0.2)),
        width: 130,
        height: 40,
        child: DropdownButtonFormField(
          menuMaxHeight: 250,
          hint: Text(
            "Floor level",
            style:
                GoogleFonts.openSans(fontWeight: FontWeight.w400, fontSize: 15),
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 5)),
          elevation: 0,
          items: [
            "1ST",
            "2ND",
            "3RD",
            "4TH",
            "5TH",
            "6TH",
            "7TH",
            "8TH",
            "9TH",
            "10TH",
            "11TH",
            "12TH",
            "13TH",
            "14TH",
            "15TH",
            "16TH",
            "17TH",
            "18TH",
            "19TH",
            "20TH",
            "21TH",
            "22TH",
            "23TH",
            "24TH",
            "25TH",
            "26TH",
            "27TH",
            "28TH",
            "29TH",
            "30TH",
            "31TH",
            "32TH",
            "33TH",
            "34TH",
            "35TH",
            "36TH",
            "37TH",
            "38TH",
            "39TH",
            "40TH",
            "41TH",
            "42TH",
            "43TH",
            "44TH",
            "45TH",
            "46TH",
            "47TH",
            "48TH",
            "49TH",
            "50TH",
            "51TH",
            "52TH",
            "53TH",
            "54TH",
            "55TH",
            "56TH",
            "57TH",
            "58TH",
            "59TH",
            "60TH",
            "61TH",
            "62TH",
            "63TH",
            "64TH",
            "65TH",
            "66TH",
            "67TH",
            "68TH",
            "69TH",
            "70TH",
            "71TH",
            "72TH",
            "73TH",
            "74TH",
            "75TH",
            "76TH",
            "77TH",
            "78TH",
            "79TH",
            "80TH",
            "81TH",
            "82TH",
            "83TH",
            "84TH",
            "85TH",
            "86TH",
            "87TH",
            "88TH",
            "89TH",
            "54TH",
            "90TH",
            "91TH",
            "92TH",
            "93TH",
            "94TH",
            "95TH",
            "96TH",
            "97TH",
            "98TH",
            "99TH",
            "100TH",
            "+ 100",
          ]
              .map((e) => DropdownMenuItem(
                    child: Text(
                      "$e",
                      style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w300, fontSize: 15),
                    ),
                    value: e,
                  ))
              .toList(),
          onChanged: (val) {
            setState(() {
              selectflev = val.toString();
            });
          },
        ));
  }
}
