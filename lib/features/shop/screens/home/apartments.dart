import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/shop/screens/home/detailpageflat/detailpageflat.dart';
import 'package:flutter_application_2/features/shop/screens/home/mynearhouse.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Apartments extends StatefulWidget {
  const Apartments({super.key, this.sortedapart, this.tupeapart});
  final sortedapart;
  final tupeapart;

  @override
  State<Apartments> createState() => _ApartmentsState(sortedapart, tupeapart);
}

class _ApartmentsState extends State<Apartments> {
  final sortedapart;
  final tupeapart;
  _ApartmentsState(this.sortedapart, this.tupeapart);
  List<QueryDocumentSnapshot> myapartlist = [];
  getdata() async {
    final QuerySnapshot getflat = await FirebaseFirestore.instance
        .collection('Sale')
        .where("Tag", isEqualTo: sortedapart)
        .where("Type", whereIn: tupeapart)
        .get();

    myapartlist.addAll(getflat.docs);
  }

  String sorted = "Apartment";
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
          padding: EdgeInsets.symmetric(horizontal: 70.w),
          child: Text(
            "Apartment",
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
                          "Apartment",
                          style: GoogleFonts.openSans(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
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
                    height: 40.h,
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
                                EdgeInsets.fromLTRB(27.w, 0.h, 0.w, 5.h)),
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
                            builder: (context) => Apartments(
                                  sortedapart: sorted,
                                  tupeapart: type,
                                )));
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.h, horizontal: 30.w),
                    decoration: BoxDecoration(
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
                    ),
                  );
                } else {
                  return myapartlist.isNotEmpty
                      ? Container(
                          padding: EdgeInsets.only(left: 15.w),
                          height: 700.h,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: myapartlist.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) => MyDetailFlat(
                                                mainsalerid: myapartlist[index]
                                                    ['Salerid'],
                                                docsid: myapartlist[index].id,
                                              ))));
                                },
                                child: Nearhouseprime(
                                  postname: myapartlist[index]['Postname'],
                                  price: myapartlist[index]['YearlyRent'] ==
                                          "empty"
                                      ? Text(
                                          '\$' " " +
                                              myapartlist[index]['Price']
                                                  .toString(),
                                          style: GoogleFonts.mali(
                                              fontSize: 19.sp,
                                              color: Color.fromARGB(
                                                  255, 81, 190, 163),
                                              fontWeight: FontWeight.w400),
                                        )
                                      : Text(
                                          '\$' " " +
                                              "Yearly${myapartlist[index]['Price'].toString()}/Monthly${myapartlist[index]['MonthlyRent'].toString()}",
                                          style: GoogleFonts.mali(
                                              fontSize: 12.sp,
                                              color: Color.fromARGB(
                                                  255, 81, 190, 163),
                                              fontWeight: FontWeight.w400),
                                        ),
                                  rate: myapartlist[index]['Tag'] == "Flat"
                                      ? "House"
                                      : myapartlist[index]['Tag'],
                                  country: myapartlist[index]['Country'],
                                  state: myapartlist[index]['State'],
                                  city: myapartlist[index]['City'],
                                  bedroom:
                                      myapartlist[index]['BedRooms'].toString(),
                                  space: myapartlist[index]['Space'].toString(),
                                  myimage: myapartlist[index]['image'],
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
