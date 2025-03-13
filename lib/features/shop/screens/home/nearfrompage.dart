import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/shop/screens/home/detailpageflat/detailpageflat.dart';
import 'package:flutter_application_2/features/shop/screens/home/mynearhouse.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Mynearpage extends StatefulWidget {
  const Mynearpage({super.key});

  @override
  State<Mynearpage> createState() => _MynearpageState();
}

class _MynearpageState extends State<Mynearpage> {
  List<QueryDocumentSnapshot> myhouselist = [];
  getdata() async {
    final QuerySnapshot getflat =
        await FirebaseFirestore.instance.collection('Sale').get();

    myhouselist.addAll(getflat.docs);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.w),
          child: Text(
            "Near from you",
            style: GoogleFonts.notoSansAdlam(),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
                future: getdata(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return Padding(
                      padding: EdgeInsets.only(top: 250.h, left: 180.w),
                      child: const CircularProgressIndicator(
                        color: Colors.blueAccent,
                        strokeWidth: 1,
                      ),
                    );
                  } else {
                    return Container(
                      height: 750.h,
                      padding: EdgeInsets.only(left: 15.h),
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: myhouselist.length,
                        itemBuilder: (context, i) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => MyDetailFlat(
                                            mainsalerid: myhouselist[i]
                                                ['Salerid'],
                                            docsid: myhouselist[i].id,
                                          ))));
                            },
                            child: Nearhouseprime(
                              postname: myhouselist[i]['Postname'],
                              price: myhouselist[i]['YearlyRent'] == "empty"
                                  ? Text(
                                      // ignore: prefer_interpolation_to_compose_strings
                                      '\$'
                                              " " +
                                          myhouselist[i]['Price'].toString(),
                                      style: GoogleFonts.mali(
                                          fontSize: 19.sp,
                                          color: const Color.fromARGB(
                                              255, 81, 190, 163),
                                          fontWeight: FontWeight.w400),
                                    )
                                  : Text(
                                      '\$' " " +
                                          "Yearly${myhouselist[i]['Price'].toString()}/Monthly${myhouselist[i]['MonthlyRent'].toString()}",
                                      style: GoogleFonts.mali(
                                          fontSize: 12.sp,
                                          color: const Color.fromARGB(
                                              255, 81, 190, 163),
                                          fontWeight: FontWeight.w400),
                                    ),
                              rate: myhouselist[i]['Tag'],
                              country: myhouselist[i]['Country'],
                              state: myhouselist[i]['State'],
                              city: myhouselist[i]['City'],
                              bedroom: myhouselist[i]['BedRooms'].toString(),
                              space: myhouselist[i]['Space'].toString(),
                              myimage: myhouselist[i]['image'],
                            ),
                          );
                        },
                      ),
                    );
                  }
                })
          ],
        ),
      ),
    );
  }
}
