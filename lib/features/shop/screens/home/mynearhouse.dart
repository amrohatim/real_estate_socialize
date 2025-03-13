import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MyNearHouse extends StatelessWidget {
  MyNearHouse({
    super.key,
    required this.price,
    required this.country,
    required this.rate,
    required this.postname,
    required this.city,
    required this.state,
    required this.bedroom,
    required this.space,
    required this.aiimage,
  });
  final price;
  final String country;
  final String rate;
  final String postname;
  final String city;
  final String state;
  final String bedroom;
  final String space;
  final String aiimage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.all(8.sp),
          child: Container(
            width: 290.w,
            height: 310.h,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Column(
              children: [
                Container(
                  // ignorimae: sort_child_properties_last

                  width: 280.w,
                  height: 179.h,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(aiimage), fit: BoxFit.fill),
                      color: const Color.fromARGB(255, 177, 170, 170),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.only(left: 3.w),
                  child: Row(children: [
                    SizedBox(
                      width: 5.w,
                    ),
                    Expanded(
                      child: Text(
                        postname,
                        style: GoogleFonts.raleway(
                            fontSize: 14.sp,
                            color: const Color(0xff252B5C),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ]),
                ),
                SizedBox(
                  height: 5.w,
                ),
                SingleChildScrollView(
                  padding: EdgeInsets.only(right: 60.w),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 3.w,
                      ),
                      Text(
                        " $country . ",
                        style: GoogleFonts.raleway(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff252B5C)),
                      ),
                      SizedBox(
                        width: 7.w,
                      ),
                      Text(
                        "$state .",
                        style: GoogleFonts.raleway(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff252B5C)),
                      ),
                      SizedBox(
                        width: 7.w,
                      ),
                      Text(
                        city,
                        style: GoogleFonts.raleway(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff252B5C)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.w,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 7.w),
                      const Icon(
                        Icons.bedroom_child_outlined,
                        color: Colors.blueAccent,
                      ),
                      Text(
                        "$bedroom Bedroom",
                        style: GoogleFonts.lato(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff252B5C)),
                      ),
                      SizedBox(width: 7.w),
                      Icon(
                        CupertinoIcons.scope,
                        color: Colors.blueAccent,
                        size: 20.sp,
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        "$space Meter",
                        style: GoogleFonts.lato(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff252B5C)),
                      ),
                      SizedBox(width: 7.w),
                      Icon(
                        size: 18.sp,
                        CupertinoIcons.tag_solid,
                        color: const Color.fromARGB(255, 66, 33, 3),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Text(
                        rate,
                        style: GoogleFonts.raleway(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff252B5C)),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 100.w),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: price,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Nearhouseprime extends StatelessWidget {
  Nearhouseprime({
    super.key,
    required this.price,
    required this.country,
    required this.rate,
    required this.postname,
    required this.city,
    required this.state,
    required this.bedroom,
    required this.space,
    required this.myimage,
  });
  final price;
  final String country;
  final String rate;
  final String postname;
  final String city;
  final String state;
  final String bedroom;
  final String space;
  final String myimage;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Container(
                height: 352.h,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(
                  children: [
                    Container(
                      // ignorimae: sort_child_properties_last

                      width: 358.w,
                      height: 220.h,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(myimage), fit: BoxFit.fill),
                          color: const Color.fromARGB(255, 177, 170, 170),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15))),
                    ),
                    SizedBox(height: 10.h),
                    Padding(
                      padding: EdgeInsets.only(left: 3.w),
                      child: Row(children: [
                        SizedBox(
                          width: 5.w,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.w),
                          child: Text(
                            postname,
                            style: GoogleFonts.raleway(
                                fontSize: 14.sp,
                                color: const Color(0xff252B5C),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ]),
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            " $country . ",
                            style: GoogleFonts.raleway(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff252B5C)),
                          ),
                          SizedBox(
                            width: 7.w,
                          ),
                          Text(
                            "$state .",
                            maxLines: 1,
                            style: GoogleFonts.raleway(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff252B5C)),
                          ),
                          SizedBox(
                            width: 7.w,
                          ),
                          Text(
                            city,
                            maxLines: 1,
                            style: GoogleFonts.raleway(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff252B5C)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 7.w),
                          const Icon(
                            Icons.bedroom_child_outlined,
                            color: Colors.blueAccent,
                          ),
                          Text(
                            "$bedroom Bedroom",
                            style: GoogleFonts.lato(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff252B5C)),
                          ),
                          SizedBox(width: 7.w),
                          Icon(
                            CupertinoIcons.scope,
                            color: Colors.blueAccent,
                            size: 20.sp,
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text(
                            "$space Meter",
                            style: GoogleFonts.lato(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff252B5C)),
                          ),
                          SizedBox(width: 7.w),
                          Icon(
                            size: 18.sp,
                            CupertinoIcons.tag_solid,
                            color: const Color.fromARGB(255, 66, 33, 3),
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          Text(
                            rate,
                            style: GoogleFonts.raleway(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff252B5C)),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 100.w),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: price,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
