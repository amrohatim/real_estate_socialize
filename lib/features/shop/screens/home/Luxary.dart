import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/shop/screens/home/detailpageflat/detailpageflat.dart';
import 'package:flutter_application_2/features/shop/screens/home/mynearhouse.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Mylux extends StatefulWidget {
  const Mylux({super.key});

  @override
  State<Mylux> createState() => _MyluxState();
}

class _MyluxState extends State<Mylux> {
  List<QueryDocumentSnapshot> myvillalist = [];
  getdata() async {
    final QuerySnapshot getflat = await FirebaseFirestore.instance
        .collection('Sale')
        .where("Tag", isEqualTo: "Villa")
        .get();

    myvillalist.addAll(getflat.docs);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 85.w),
          child: Text(
            "Luxury",
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
                      padding: EdgeInsets.only(left: 15.w),
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: myvillalist.length,
                        itemBuilder: (context, i) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => MyDetailFlat(
                                            mainsalerid: myvillalist[i]
                                                ['Salerid'],
                                            docsid: myvillalist[i].id,
                                          ))));
                            },
                            child: Nearhouseprime(
                              postname: myvillalist[i]['Postname'],
                              price: myvillalist[i]['YearlyRent'] == "empty"
                                  ? Text(
                                      '\$' " " +
                                          myvillalist[i]['Price'].toString(),
                                      style: GoogleFonts.mali(
                                          fontSize: 19.sp,
                                          color:
                                              Color.fromARGB(255, 81, 190, 163),
                                          fontWeight: FontWeight.w400),
                                    )
                                  : Text(
                                      '\$' " " +
                                          "Yearly${myvillalist[i]['Price'].toString()}/Monthly${myvillalist[i]['MonthlyRent'].toString()}",
                                      style: GoogleFonts.mali(
                                          fontSize: 12.sp,
                                          color:
                                              Color.fromARGB(255, 81, 190, 163),
                                          fontWeight: FontWeight.w400),
                                    ),
                              rate: myvillalist[i]['Tag'],
                              country: myvillalist[i]['Country'],
                              state: myvillalist[i]['State'],
                              city: myvillalist[i]['City'],
                              bedroom: myvillalist[i]['BedRooms'].toString(),
                              space: myvillalist[i]['Space'].toString(),
                              myimage: myvillalist[i]['image'],
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
