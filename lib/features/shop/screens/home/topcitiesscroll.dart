import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/shop/screens/home/topcities.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Myscrolltopcity extends StatelessWidget {
  const Myscrolltopcity({super.key});

  @override
  Widget build(BuildContext context) {
    final List mycityname = ["Miami", "Newyork", "Washington Dc", "Singpoare"];
    final List mycityimage = [
      "assets/images/miami.jpg",
      "assets/images/newyork.jpg",
      "assets/images/wahing.jpg",
      "assets/images/singapore.jpg"
    ];

    return Column(
      children: [
        const Divider(
          thickness: 0.5,
          indent: 110,
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 190.w),
              child: Padding(
                padding: EdgeInsets.only(left: 25.w),
                child: Text(
                  "Top Cities",
                  style: GoogleFonts.notoSansAdlam(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff252B5C)),
                ),
              ),
            ),
          ],
        ),
        Container(
          height: 260.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
              return Mytopcities(
                cityname: mycityname[index],
                cityimage: mycityimage[index],
              );
            },
          ),
        )
      ],
    );
  }
}
