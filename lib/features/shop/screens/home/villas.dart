import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/shop/screens/home/detailpageflat/detailpageflat.dart';
import 'package:flutter_application_2/features/shop/screens/home/mynearhouse.dart';
import 'package:flutter_application_2/utils/constants/MytopmainBar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Villas extends StatefulWidget {
  const Villas({super.key, this.sortedvilla, this.tupevilla});
  final sortedvilla;
  final tupevilla;

  @override
  State<Villas> createState() => _Villas(sortedvilla, tupevilla);
}

class _Villas extends State<Villas> {
  final sortedvilla;
  final tupevilla;
  _Villas(this.sortedvilla, this.tupevilla);
  List<QueryDocumentSnapshot> myvillalist = [];
  getdata() async {
    final QuerySnapshot getflat = await FirebaseFirestore.instance
        .collection('Sale')
        .where("Tag", isEqualTo: sortedvilla)
        .where("Type", whereIn: tupevilla)
        .get();

    myvillalist.addAll(getflat.docs);
  }

  String sorted = "Villa";
  List<DropdownMenuItem> mysort = [
    DropdownMenuItem(
      child: Text(
        "House",
        style: GoogleFonts.notoSansAdlam(),
      ),
      value: "Flat",
    ),
    DropdownMenuItem(
      child: Text(
        "Villa",
        style: GoogleFonts.notoSansAdlam(),
      ),
      value: "Villa",
    ),
    DropdownMenuItem(
      child: Text(
        "Shop",
        style: GoogleFonts.notoSansAdlam(),
      ),
      value: "Shop",
    ),
    DropdownMenuItem(
      child: Text(
        "Apartment",
        style: GoogleFonts.notoSansAdlam(fontSize: 14),
      ),
      value: "Apartment",
    ),
  ];

  List<String> type = ["Sale"];
  List<DropdownMenuItem> mytype = [
    DropdownMenuItem(
      child: Text(
        "Buy",
        style: GoogleFonts.notoSansAdlam(),
      ),
      value: ["Sale"],
    ),
    DropdownMenuItem(
      child: Text(
        "Rent",
        style: GoogleFonts.notoSansAdlam(),
      ),
      value: ["Rent"],
    ),
    DropdownMenuItem(
      child: Text(
        "Both",
        style: GoogleFonts.notoSansAdlam(),
      ),
      value: ["Sale", "Rent"],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 95.w),
          child: Text(
            "Villa",
            style: GoogleFonts.notoSansAdlam(),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0.1, 0.1),
                              color: Colors.blueAccent)
                        ]),
                    width: 123.3.w,
                    height: 40.h,
                    child: DropdownButtonFormField(
                        menuMaxHeight: 250.h,
                        hint: Text(
                          "Villa",
                          style: GoogleFonts.openSans(
                              fontWeight: FontWeight.w400,
                              fontSize: 15.sp,
                              color: const Color.fromARGB(150, 0, 0, 0)),
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.fromLTRB(25.w, 0.h, 0.w, 5.h)),
                        elevation: 0,
                        items: mysort,
                        onChanged: (value) {
                          sorted = value;
                        })),
                SizedBox(width: 4.w),
                SizedBox(width: 4.w),
                Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0.1, 0.1),
                              color: Colors.blueAccent)
                        ]),
                    width: 120.w,
                    height: 40.w,
                    child: DropdownButtonFormField(
                        menuMaxHeight: 250.h,
                        hint: Text(
                          "Buy",
                          style: GoogleFonts.openSans(
                              fontWeight: FontWeight.w400,
                              fontSize: 15.sp,
                              color: const Color.fromARGB(150, 0, 0, 0)),
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.fromLTRB(25.w, 0.h, 0.w, 5.h)),
                        elevation: 0,
                        items: mytype,
                        onChanged: (value) {
                          type = value;
                        })),
                SizedBox(
                  width: 10.w,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Villas(
                                  sortedvilla: sorted,
                                  tupevilla: type,
                                )));
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.h, horizontal: 30.w),
                    decoration: const BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Text(
                      "Sort",
                      style: GoogleFonts.notoSansAdlam(
                          fontSize: 15.sp, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            FutureBuilder(
              future: getdata(),
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return Padding(
                      padding: EdgeInsets.only(
                        top: 250.h,
                      ),
                      child: const CircularProgressIndicator(
                        color: Colors.blueAccent,
                        strokeWidth: 1,
                      ));
                } else {
                  return myvillalist.isNotEmpty
                      ? Container(
                          height: 700.h,
                          padding: EdgeInsets.only(left: 15.w),
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: myvillalist.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) => MyDetailFlat(
                                                mainsalerid: myvillalist[index]
                                                    ['Salerid'],
                                                docsid: myvillalist[index].id,
                                              ))));
                                },
                                child: Nearhouseprime(
                                  postname: myvillalist[index]['Postname'],
                                  price: myvillalist[index]['YearlyRent'] ==
                                          "empty"
                                      ? Text(
                                          '\$' " " +
                                              myvillalist[index]['Price']
                                                  .toString(),
                                          style: GoogleFonts.mali(
                                              fontSize: 19.sp,
                                              color: Color.fromARGB(
                                                  255, 81, 190, 163),
                                              fontWeight: FontWeight.w400),
                                        )
                                      : Text(
                                          '\$' " " +
                                              "Yearly${myvillalist[index]['Price'].toString()}/Monthly${myvillalist[index]['MonthlyRent'].toString()}",
                                          style: GoogleFonts.mali(
                                              fontSize: 12.sp,
                                              color: Color.fromARGB(
                                                  255, 81, 190, 163),
                                              fontWeight: FontWeight.w400),
                                        ),
                                  rate: myvillalist[index]['Tag'] == "Flat"
                                      ? "House"
                                      : myvillalist[index]['Tag'],
                                  country: myvillalist[index]['Country'],
                                  state: myvillalist[index]['State'],
                                  city: myvillalist[index]['City'],
                                  bedroom:
                                      myvillalist[index]['BedRooms'].toString(),
                                  space: myvillalist[index]['Space'].toString(),
                                  myimage: myvillalist[index]['image'],
                                ),
                              );
                            },
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.only(top: 300.h),
                          child: Text(
                            "There is no property",
                            style: GoogleFonts.openSans(
                                fontSize: 24.sp, color: Colors.grey[600]),
                          ),
                        );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
