import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/features/shop/screens/home/detailpageflat/detailpageflat.dart';
import 'package:flutter_application_2/features/shop/screens/home/mynearhouse.dart';
import 'package:flutter_application_2/features/shop/screens/home/nearfrompage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Mynearhousescroll extends StatefulWidget {
  const Mynearhousescroll({super.key});

  @override
  State<Mynearhousescroll> createState() => _MynearhousescrollState();
}

class _MynearhousescrollState extends State<Mynearhousescroll> {
  @override
  Widget build(BuildContext context) {
    List<QueryDocumentSnapshot> myflatlist = [];
    //String uidd = FirebaseAuth.instance.currentUser!.uid;
    // String? usercity;
    getdata() async {
      /*  await FirebaseFirestore.instance
          .collection("Users")
          .doc(uidd)
          .get()
          .then((value) {
        usercity = value["country"];
      });*/
      final QuerySnapshot getflat = await FirebaseFirestore.instance
          .collection('Sale')
          .where("City", isEqualTo: "Khartoum")
          .get();
      myflatlist.addAll(getflat.docs);
    }

    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15.w, top: 30.h),
              child: Text(
                "Near from You",
                style: GoogleFonts.notoSansAdlam(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff252B5C)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                right: 150.w,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const Mynearpage();
                  },
                ));
              },
              child: Padding(
                padding: EdgeInsets.only(top: 38.h),
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
                color: Colors.blueAccent,
                strokeWidth: 1,
              );
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
                                '\$' " " +
                                    myflatlist[index]['Price'].toString(),
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
      ],
    );
  }
}
