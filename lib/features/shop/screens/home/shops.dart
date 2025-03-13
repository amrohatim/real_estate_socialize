import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/shop/screens/home/detailpageflat/detailpageflat.dart';
import 'package:flutter_application_2/features/shop/screens/home/mynearhouse.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Shops extends StatefulWidget {
  const Shops({super.key, this.sortshop, this.tupeshop});
  final sortshop;
  final tupeshop;
  @override
  State<Shops> createState() => _ShopsState(sortshop, tupeshop);
}

class _ShopsState extends State<Shops> {
  final sortshop;
  final tupeshop;
  _ShopsState(this.sortshop, this.tupeshop);
  List<QueryDocumentSnapshot> myshoplist = [];
  getdatashop() async {
    final QuerySnapshot getshop = await FirebaseFirestore.instance
        .collection('Sale')
        .where("Tag", isEqualTo: sortshop)
        .where("Type", whereIn: tupeshop)
        .get();

    myshoplist.addAll(getshop.docs);
  }

  String? sortedshop = "Shop";
  List<DropdownMenuItem> mysortshop = [
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

  List<String> typeshop = ["Sale"];
  List<DropdownMenuItem> mytypeshop = [
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
          padding: EdgeInsets.symmetric(horizontal: 90.w),
          child: Text(
            "Shop",
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
                          "Shop",
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
                                EdgeInsets.fromLTRB(25.w, 0.h, 0.h, 5.w)),
                        elevation: 0,
                        items: mysortshop,
                        onChanged: (value) {
                          sortedshop = value;
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
                        items: mytypeshop,
                        onChanged: (value) {
                          typeshop = value;
                        })),
                SizedBox(
                  width: 10.w,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Shops(
                                  sortshop: sortedshop,
                                  tupeshop: typeshop,
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
              future: getdatashop(),
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return Padding(
                      padding: EdgeInsets.only(top: 250.h),
                      child: const CircularProgressIndicator(
                        color: Colors.blueAccent,
                        strokeWidth: 1,
                      ));
                } else {
                  return myshoplist.isNotEmpty
                      ? Container(
                          height: 700.h,
                          padding: EdgeInsets.only(left: 15.w),
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: myshoplist.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) => MyDetailFlat(
                                                mainsalerid: myshoplist[index]
                                                    ['Salerid'],
                                                docsid: myshoplist[index].id,
                                              ))));
                                },
                                child: Nearhouseprime(
                                  postname: myshoplist[index]['Postname'],
                                  price:
                                      myshoplist[index]['YearlyRent'] == "empty"
                                          ? Text(
                                              '\$' " " +
                                                  myshoplist[index]['Price']
                                                      .toString(),
                                              style: GoogleFonts.mali(
                                                  fontSize: 19.sp,
                                                  color: Color.fromARGB(
                                                      255, 81, 190, 163),
                                                  fontWeight: FontWeight.w400),
                                            )
                                          : Text(
                                              '\$' " " +
                                                  "Yearly${myshoplist[index]['Price'].toString()}/Monthly${myshoplist[index]['MonthlyRent'].toString()}",
                                              style: GoogleFonts.mali(
                                                  fontSize: 12.sp,
                                                  color: Color.fromARGB(
                                                      255, 81, 190, 163),
                                                  fontWeight: FontWeight.w400),
                                            ),
                                  rate: myshoplist[index]['Tag'] == "Flat"
                                      ? "House"
                                      : myshoplist[index]['Tag'],
                                  country: myshoplist[index]['Country'],
                                  state: myshoplist[index]['State'],
                                  city: myshoplist[index]['City'],
                                  bedroom:
                                      myshoplist[index]['BedRooms'].toString(),
                                  space: myshoplist[index]['Space'].toString(),
                                  myimage: myshoplist[index]['image'],
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
