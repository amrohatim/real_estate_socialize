import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Pagetwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 300, 0, 0),
              child: Image.asset(
                "assets/images/blueback.jpg",
                scale: 1.sp,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 110.h, 0, 0),
              child: Text(
                "Business to Business",
                style: GoogleFonts.mali(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromARGB(255, 49, 49, 49)),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15.w, 150.h, 0, 0),
              child: Container(
                width: 400.w,
                height: 200.h,
                padding: const EdgeInsets.all(8),
                child: Text(
                  "Direct Buy and Rent from owners and agents  everything allowed there is no restrictions or limitions , make an appoinment to complete deals without delay.",
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
    );
  }
}
