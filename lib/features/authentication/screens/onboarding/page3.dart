import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Pagethree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(45.w, 350.h, 0, 0),
                child: Image.asset(
                  "assets/images/locations.jpg",
                  scale: 1.6.sp,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20.w, 110.h, 0, 0),
                child: Text(
                  "Explore Globally",
                  style: GoogleFonts.mali(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 49, 49, 49)),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15.w, 150.h, 0, 0),
                child: Container(
                  width: 400.w,
                  height: 200.h,
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    "Search for real estate from all places around the world and expand your options now with Magellan there is no limit to possibilities.",
                    style: GoogleFonts.lato(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[800]),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
