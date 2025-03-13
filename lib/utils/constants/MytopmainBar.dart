import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/shop/screens/home/apartments.dart';
import 'package:flutter_application_2/features/shop/screens/home/flats.dart';
import 'package:flutter_application_2/features/shop/screens/home/shops.dart';
import 'package:flutter_application_2/features/shop/screens/home/villas.dart';
import 'package:flutter_application_2/features/shop/screens/post/filter.dart';
import 'package:flutter_application_2/features/shop/screens/post/search.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Mytopmainbar extends StatefulWidget {
  const Mytopmainbar({super.key});

  @override
  State<Mytopmainbar> createState() => _MytopmainbarState();
}

class _MytopmainbarState extends State<Mytopmainbar> {
  TextEditingController searchcontrol = TextEditingController();
  String name = "";

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/images/homebackground.jpg"),
        Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: Container(
            height: 50.h,
            width: 280.w,
            margin: EdgeInsets.fromLTRB(10.w, 50.h, 70.w, 0.h),
            decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.blueAccent, offset: Offset(0.1, 0.1))
                ],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            child: TextFormField(
              textCapitalization: TextCapitalization.values.first,
              onChanged: (value) {
                name = value;
              },
              decoration: InputDecoration(
                  prefixIcon: IconButton(
                      onPressed: () {
                        setState(() {});
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Search(comefrom: name.trim())));
                      },
                      icon: const Icon(Icons.search)),
                  prefixIconColor: Colors.blueAccent,
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  hintText: "search by city ...",
                  hintStyle: GoogleFonts.roboto(
                      fontSize: 18.sp, fontWeight: FontWeight.w300)),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(310.w, 50.5.h, 0.w, 0.h),
          child: Container(
              height: 49.h,
              width: 48.w,
              decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.blueAccent, offset: Offset(0.5, 0.5))
                  ],
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8))),
              child: IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                        backgroundColor: Colors.white,
                        context: context,
                        builder: (context) => const Mybottomsheet());
                  },
                  icon: Icon(
                    Icons.tune_rounded,
                    color: Colors.white,
                    size: 30.sp,
                  ))),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(5.w, 145.h, 0.w, 0.h),
          child: MaterialButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Villas(
                      sortedvilla: "Villa",
                      tupevilla: ["Sale"],
                    ),
                  ));
            },
            minWidth: 80.w,
            color: const Color(0xffF5F4F8),
            child: Text(
              "Villa",
              style: TextStyle(
                  color: const Color(0xff252B5C),
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(95.w, 145.h, 0.w, 0.w),
          child: MaterialButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Flats(
                      sort: "Flat",
                      tupe: ["Sale"],
                    ),
                  ));
            },
            minWidth: 80.w,
            color: const Color(0xffF5F4F8),
            child: Text(
              "House",
              style: TextStyle(
                  color: const Color(0xff252B5C),
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(190.w, 145.h, 0.w, 0.h),
          child: MaterialButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Shops(
                      sortshop: "Shop",
                      tupeshop: ["Sale"],
                    ),
                  ));
            },
            minWidth: 80.w,
            color: const Color(0xffF5F4F8),
            child: Text(
              "Shop",
              style: TextStyle(
                  color: const Color(0xff252B5C),
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(280.w, 145.h, 0.w, 0.h),
          child: MaterialButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Apartments(
                      sortedapart: "Apartment",
                      tupeapart: ["Sale"],
                    ),
                  ));
            },
            minWidth: 80.w,
            color: const Color(0xffF5F4F8),
            child: Text(
              "Apartment",
              style: TextStyle(
                  color: const Color(0xff252B5C),
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp),
            ),
          ),
        ),
      ],
    );
  }
}

class Mybottomsheet extends StatefulWidget {
  const Mybottomsheet({super.key});

  @override
  State<Mybottomsheet> createState() => _MybottomsheetState();
}

class _MybottomsheetState extends State<Mybottomsheet> {
  var country;
  var state;
  var city;
  String? pricecat;
  String? spacecat;
  String? bedcat;
  String? bathcat;

  String? house;
  @override
  Widget build(BuildContext context) {
    return BottomSheet(
        onClosing: dispose,
        builder: (context) {
          return Container(
            height: 600.h,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 40.h, left: 39.w),
                    child: Text(
                      "Location",
                      style: GoogleFonts.mali(
                          fontSize: 20.sp,
                          color: const Color.fromARGB(206, 5, 5, 5)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(100.w, 20.h, 0.w, 0.w),
                    child: Container(
                      width: 200.w,
                      child: CSCPicker(
                        selectedItemStyle: GoogleFonts.mali(),
                        dropdownDecoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        disabledDropdownDecoration: const BoxDecoration(
                            color: Color.fromARGB(153, 255, 243, 243),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        showStates: true,
                        showCities: true,
                        layout: Layout.vertical,
                        onCountryChanged: (value) {
                          setState(() {
                            country = value;
                          });
                        },
                        onCityChanged: (city) {
                          setState(() {
                            city = city;
                          });
                        },
                        onStateChanged: (value) {
                          setState(() {
                            state = value;
                          });
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40.w, top: 20.h),
                    child: Text(
                      "Tag",
                      style: GoogleFonts.mali(
                          fontSize: 20,
                          color: const Color.fromARGB(206, 5, 5, 5)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w, top: 10.h),
                    child: Row(children: [
                      TextButton(
                        onPressed: () {
                          house = "Flat";
                          setState(() {});
                        },
                        style: TextButton.styleFrom(
                            fixedSize: Size(80.w, 30.h),
                            backgroundColor: house == "Flat"
                                ? Colors.blueAccent
                                : Colors.white,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                        child: Text(
                          "House",
                          style: GoogleFonts.mali(
                              fontSize: 14.sp,
                              color: house == "Flat"
                                  ? Colors.white
                                  : const Color.fromARGB(255, 58, 57, 57)),
                        ),
                      ),
                      SizedBox(width: 6.w),
                      TextButton(
                        onPressed: () {
                          house = "Villa";
                          setState(() {});
                        },
                        style: TextButton.styleFrom(
                            fixedSize: Size(80.w, 30.h),
                            backgroundColor: house == "Villa"
                                ? Colors.deepOrangeAccent
                                : Colors.white,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                        child: Text(
                          "Villa",
                          style: GoogleFonts.mali(
                              fontSize: 14.sp,
                              color: house == "Villa"
                                  ? Colors.white
                                  : const Color.fromARGB(255, 58, 57, 57)),
                        ),
                      ),
                      SizedBox(width: 6.w),
                      TextButton(
                        onPressed: () {
                          house = "Apartment";
                          setState(() {});
                        },
                        style: TextButton.styleFrom(
                            fixedSize: Size(100.w, 30.h),
                            backgroundColor: house == "Apartment"
                                ? Colors.deepPurple
                                : Colors.white,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                        child: Text(
                          "Apartment",
                          style: GoogleFonts.mali(
                              fontSize: 14.sp,
                              color: house == "Apartment"
                                  ? Colors.white
                                  : const Color.fromARGB(255, 58, 57, 57)),
                        ),
                      ),
                      SizedBox(
                        width: 6.w,
                      ),
                      TextButton(
                        onPressed: () {
                          house = "Shop";
                          setState(() {});
                        },
                        style: TextButton.styleFrom(
                            fixedSize: Size(80.w, 30.h),
                            backgroundColor: house == "Shop"
                                ? const Color.fromARGB(255, 63, 216, 157)
                                : Colors.white,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                        child: Text(
                          "Shop",
                          style: GoogleFonts.mali(
                              fontSize: 14.sp,
                              color: house == "Shop"
                                  ? Colors.white
                                  : const Color.fromARGB(255, 58, 57, 57)),
                        ),
                      )
                    ]),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30.h, left: 40.w),
                    child: Text(
                      "Price",
                      style: GoogleFonts.mali(
                          fontSize: 20,
                          color: const Color.fromARGB(206, 5, 5, 5)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.h, left: 10.w),
                    child: Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            pricecat = "pricecat1";
                            setState(() {});
                          },
                          child: Text(
                            "500~10,000\$",
                            style: GoogleFonts.mali(
                                fontSize: 12.sp,
                                color: pricecat == "pricecat1"
                                    ? Colors.white
                                    : const Color.fromARGB(255, 58, 57, 57)),
                          ),
                          style: TextButton.styleFrom(
                              fixedSize: Size(100.w, 30.h),
                              backgroundColor: pricecat == "pricecat1"
                                  ? Colors.blueAccent
                                  : Colors.white,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                        ),
                        SizedBox(
                          width: 7.w,
                        ),
                        TextButton(
                          onPressed: () {
                            pricecat = "pricecat2";
                            setState(() {});
                          },
                          child: Text(
                            "10,000~100,000\$",
                            style: GoogleFonts.mali(
                                fontSize: 12.sp,
                                color: pricecat == "pricecat2"
                                    ? Colors.white
                                    : const Color.fromARGB(255, 58, 57, 57)),
                          ),
                          style: TextButton.styleFrom(
                              fixedSize: Size(124.w, 30.h),
                              backgroundColor: pricecat == "pricecat2"
                                  ? Colors.blueAccent
                                  : Colors.white,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                        ),
                        SizedBox(width: 7.w),
                        TextButton(
                          onPressed: () {
                            pricecat = "pricecat3";
                            setState(() {});
                          },
                          child: Text(
                            "100,000~1,000,000\$",
                            style: GoogleFonts.mali(
                                fontSize: 12.sp,
                                color: pricecat == "pricecat3"
                                    ? Colors.white
                                    : const Color.fromARGB(255, 58, 57, 57)),
                          ),
                          style: TextButton.styleFrom(
                              fixedSize: Size(144.w, 30.h),
                              backgroundColor: pricecat == "pricecat3"
                                  ? Colors.blueAccent
                                  : Colors.white,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.w, top: 10.h),
                    child: Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            pricecat = "pricecat4";
                            setState(() {});
                          },
                          child: Text(
                            "1,000,000~5,000,000\$",
                            style: GoogleFonts.mali(
                                fontSize: 12.sp,
                                color: pricecat == "pricecat4"
                                    ? Colors.white
                                    : const Color.fromARGB(255, 58, 57, 57)),
                          ),
                          style: TextButton.styleFrom(
                              fixedSize: Size(160.w, 30.h),
                              backgroundColor: pricecat == "pricecat4"
                                  ? Colors.blueAccent
                                  : Colors.white,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                        ),
                        SizedBox(width: 7.w),
                        TextButton(
                          onPressed: () {
                            pricecat = "pricecat5";
                            setState(() {});
                          },
                          child: Text(
                            "5,000,000~50,000,000\$",
                            style: GoogleFonts.mali(
                                fontSize: 12.sp,
                                color: pricecat == "pricecat5"
                                    ? Colors.white
                                    : const Color.fromARGB(255, 58, 57, 57)),
                          ),
                          style: TextButton.styleFrom(
                              fixedSize: Size(164.w, 30.h),
                              backgroundColor: pricecat == "pricecat5"
                                  ? Colors.blueAccent
                                  : Colors.white,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30.h, left: 40.w),
                    child: Text(
                      "Space",
                      style: GoogleFonts.mali(
                          fontSize: 20.sp,
                          color: const Color.fromARGB(206, 5, 5, 5)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.h, left: 10.w),
                    child: Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            spacecat = "spacecat1";
                            setState(() {});
                          },
                          child: Text(
                            "100~500 m",
                            style: GoogleFonts.mali(
                                fontSize: 12.sp,
                                color: spacecat == "spacecat1"
                                    ? Colors.white
                                    : const Color.fromARGB(255, 58, 57, 57)),
                          ),
                          style: TextButton.styleFrom(
                              fixedSize: Size(100.w, 30.h),
                              backgroundColor: spacecat == "spacecat1"
                                  ? Colors.blueAccent
                                  : Colors.white,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        TextButton(
                          onPressed: () {
                            spacecat = "spacecat2";
                            setState(() {});
                          },
                          child: Text(
                            "500~1000 m",
                            style: GoogleFonts.mali(
                                fontSize: 12.sp,
                                color: spacecat == "spacecat2"
                                    ? Colors.white
                                    : const Color.fromARGB(255, 58, 57, 57)),
                          ),
                          style: TextButton.styleFrom(
                              fixedSize: Size(100.w, 30.h),
                              backgroundColor: spacecat == "spacecat2"
                                  ? Colors.blueAccent
                                  : Colors.white,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                        ),
                        SizedBox(width: 15.w),
                        TextButton(
                          onPressed: () {
                            spacecat = "spacecat3";
                            setState(() {});
                          },
                          child: Text(
                            "1000~5000 m",
                            style: GoogleFonts.mali(
                                fontSize: 12.sp,
                                color: spacecat == "spacecat3"
                                    ? Colors.white
                                    : const Color.fromARGB(255, 58, 57, 57)),
                          ),
                          style: TextButton.styleFrom(
                              fixedSize: Size(105.w, 30.h),
                              backgroundColor: spacecat == "spacecat3"
                                  ? Colors.blueAccent
                                  : Colors.white,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30.h, left: 40.w),
                    child: Text(
                      "Bedrooms",
                      style: GoogleFonts.mali(
                          fontSize: 20.sp,
                          color: const Color.fromARGB(206, 5, 5, 5)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.h, left: 10.w),
                    child: Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            bedcat = "bedcat1";
                            setState(() {});
                          },
                          child: Text(
                            "1~5 room",
                            style: GoogleFonts.mali(
                                fontSize: 12.sp,
                                color: bedcat == "bedcat1"
                                    ? Colors.white
                                    : const Color.fromARGB(255, 58, 57, 57)),
                          ),
                          style: TextButton.styleFrom(
                              fixedSize: Size(100.w, 30.h),
                              backgroundColor: bedcat == "bedcat1"
                                  ? Colors.blueAccent
                                  : Colors.white,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        TextButton(
                          onPressed: () {
                            bedcat = "bedcat2";
                            setState(() {});
                          },
                          child: Text(
                            "5~10 room",
                            style: GoogleFonts.mali(
                                fontSize: 12.sp,
                                color: bedcat == "bedcat2"
                                    ? Colors.white
                                    : const Color.fromARGB(255, 58, 57, 57)),
                          ),
                          style: TextButton.styleFrom(
                              fixedSize: Size(100.w, 30.h),
                              backgroundColor: bedcat == "bedcat2"
                                  ? Colors.blueAccent
                                  : Colors.white,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                        ),
                        SizedBox(width: 15.w),
                        TextButton(
                          onPressed: () {
                            bedcat = "bedcat3";
                            setState(() {});
                          },
                          child: Text(
                            "10~25 room",
                            style: GoogleFonts.mali(
                                fontSize: 12.sp,
                                color: bedcat == "bedcat3"
                                    ? Colors.white
                                    : const Color.fromARGB(255, 58, 57, 57)),
                          ),
                          style: TextButton.styleFrom(
                              fixedSize: Size(105.w, 30.h),
                              backgroundColor: bedcat == "bedcat3"
                                  ? Colors.blueAccent
                                  : Colors.white,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30.h, left: 40.w),
                    child: Text(
                      "Bathrooms",
                      style: GoogleFonts.mali(
                          fontSize: 20.sp,
                          color: const Color.fromARGB(206, 5, 5, 5)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.h, left: 10.w),
                    child: Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            bathcat = "bathcat1";
                            setState(() {});
                          },
                          child: Text(
                            "1~3 bath",
                            style: GoogleFonts.mali(
                                fontSize: 12.sp,
                                color: bathcat == "bathcat1"
                                    ? Colors.white
                                    : const Color.fromARGB(255, 58, 57, 57)),
                          ),
                          style: TextButton.styleFrom(
                              fixedSize: Size(100.w, 30.h),
                              backgroundColor: bathcat == "bathcat1"
                                  ? Colors.blueAccent
                                  : Colors.white,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        TextButton(
                          onPressed: () {
                            bathcat = "bathcat2";
                            setState(() {});
                          },
                          child: Text(
                            "3~6 bath",
                            style: GoogleFonts.mali(
                                fontSize: 12.sp,
                                color: bathcat == "bathcat2"
                                    ? Colors.white
                                    : const Color.fromARGB(255, 58, 57, 57)),
                          ),
                          style: TextButton.styleFrom(
                              fixedSize: Size(100.w, 30.h),
                              backgroundColor: bathcat == "bathcat2"
                                  ? Colors.blueAccent
                                  : Colors.white,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                        ),
                        SizedBox(width: 15.w),
                        TextButton(
                          onPressed: () {
                            bathcat = "bathcat3";
                            setState(() {});
                          },
                          child: Text(
                            "6~10 bath",
                            style: GoogleFonts.mali(
                                fontSize: 12.sp,
                                color: bathcat == "bathcat3"
                                    ? Colors.white
                                    : const Color.fromARGB(255, 58, 57, 57)),
                          ),
                          style: TextButton.styleFrom(
                              fixedSize: Size(105.w, 30.h),
                              backgroundColor: bathcat == "bathcat3"
                                  ? Colors.blueAccent
                                  : Colors.white,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 136.w, top: 10.h, bottom: 10.h),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Filter(
                                      fcountry: country,
                                      fcity: city,
                                      fstate: state,
                                      price: pricecat,
                                      space: spacecat,
                                      room: bedcat,
                                      bath: bathcat,
                                      tag: house,
                                    )));
                      },
                      child: Container(
                        width: 120.w,
                        height: 45.h,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 64, 179, 255),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0.3, 0.3),
                                  color: Colors.blueAccent)
                            ]),
                        child: Center(
                            child: Text(
                          "Filter",
                          style: GoogleFonts.mali(
                              fontSize: 18.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
                        )),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
