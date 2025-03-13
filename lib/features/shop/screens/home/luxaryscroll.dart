// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/shop/screens/home/Luxary.dart';
import 'package:flutter_application_2/features/shop/screens/home/detailpageflat/detailpageflat.dart';
import 'package:flutter_application_2/features/shop/screens/home/mynearhouse.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MYluxscroll extends StatefulWidget {
  const MYluxscroll({super.key});

  @override
  State<MYluxscroll> createState() => _MYluxscrollState();
}

class _MYluxscrollState extends State<MYluxscroll> {
  List<QueryDocumentSnapshot> myflatlist = [];
  getdata() async {
    final QuerySnapshot getflat =
        await FirebaseFirestore.instance.collection('Sale').get();

    myflatlist.addAll(getflat.docs);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 15.w,
            ),
            child: Text(
              "Luxury",
              style: GoogleFonts.notoSansAdlam(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff252B5C)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              right: 220.w,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const Mylux();
                },
              ));
            },
            child: Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: Text(
                "View all...",
                style: GoogleFonts.mali(
                    color: const Color(0xff234F68),
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp),
              ),
            ),
          ),
        ],
      ),
      FutureBuilder(
        future: getdata(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const CircularProgressIndicator(
                color: Colors.blueAccent, strokeWidth: 1);
          } else {
            return Container(
              height: 340.5.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: myflatlist.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyDetailFlat(
                              docsid: myflatlist[index].id,
                              mainsalerid: myflatlist[index]["Salerid"],
                            ),
                          ));
                    },
                    child: MyNearHouse(
                      postname: myflatlist[index]['Postname'],
                      price: myflatlist[index]['YearlyRent'] == "empty"
                          ? Text(
                              '\$' " " + myflatlist[index]['Price'].toString(),
                              style: GoogleFonts.breeSerif(
                                  fontSize: 19.r,
                                  color:
                                      const Color.fromARGB(255, 81, 190, 163),
                                  fontWeight: FontWeight.w400),
                            )
                          : Text(
                              '\$' " " +
                                  "Yearly${myflatlist[index]['Price'].toString()}/Monthly${myflatlist[index]['MonthlyRent'].toString()}",
                              style: GoogleFonts.breeSerif(
                                  fontSize: 12.r,
                                  color:
                                      const Color.fromARGB(255, 81, 190, 163),
                                  fontWeight: FontWeight.w400),
                            ),
                      rate: myflatlist[index]['Tag'] == "Flat"
                          ? "House"
                          : myflatlist[index]['Tag'],
                      country: myflatlist[index]['Country'],
                      state: myflatlist[index]['State'],
                      city: myflatlist[index]['City'],
                      bedroom: myflatlist[index]['BedRooms'].toString(),
                      space: myflatlist[index]['Space'].toString(),
                      aiimage: myflatlist[index]['image'],
                    ),
                  );
                },
              ),
            );
          }
        },
      )
    ]);
  }
}
