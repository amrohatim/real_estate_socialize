import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/shop/screens/home/luxaryscroll.dart';
import 'package:flutter_application_2/features/shop/screens/home/nearhousescroll.dart';
import 'package:flutter_application_2/features/shop/screens/home/topcitiesscroll.dart';
import 'package:flutter_application_2/utils/constants/MytopmainBar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Myhomeprime extends StatelessWidget {
  const Myhomeprime({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          const Mytopmainbar(),
          ////////// Near from////////
          SizedBox(
            height: 20.h,
          ),

          const Mynearhousescroll(),

          SizedBox(height: 25.h),

          //////////// luxery/////////////

          const MYluxscroll(),

          SizedBox(
            height: 25.h,
          ),
          ////////////// top cities*///////////

          const Myscrolltopcity(),
        ]),
      ),
    );
  }
}
