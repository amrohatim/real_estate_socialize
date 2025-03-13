import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/authentication/screens/Registration/login.dart';
import 'package:flutter_application_2/features/authentication/screens/Registration/signup.dart';
import 'package:flutter_application_2/features/shop/screens/home/home.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class MyregPage extends StatelessWidget {
  const MyregPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 140.h,
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(15.w, 60.h, 0, 0),
                  child: LottieBuilder.asset(
                    "assets/images/Animation - 1714454609186.json",
                    width: 450.w,
                    height: 348.h,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Mylogin(),
                        ));
                  },
                  child: ElevatedButton(
                    onPressed: null,
                    child: Text(
                      "Login",
                      style: GoogleFonts.notoSansAdlam(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    style: TextButton.styleFrom(
                        elevation: 1.sp,
                        fixedSize: Size(200.w, 55.h),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor: Colors.blue),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(1.w, 25.h, 0, 0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return Mysignup();
                        },
                      ));
                    },
                    child: ElevatedButton(
                      onPressed: null,
                      child: Text(
                        "Sign up",
                        style: GoogleFonts.notoSansAdlam(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      style: TextButton.styleFrom(
                          fixedSize: Size(200.w, 55.h),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: Color.fromARGB(199, 3, 12, 17)),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(340.w, 124.h, 0, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) {
                          return Myhomepage(
                            currentIndex: 0,
                          );
                        },
                      ));
                    },
                    child: Text(
                      "Skip",
                      style: GoogleFonts.raleway(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.only(left: 11.w),
                        fixedSize: Size.fromWidth(50.w),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(90.sp))),
                        backgroundColor: Color.fromARGB(185, 0, 5, 0)),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
