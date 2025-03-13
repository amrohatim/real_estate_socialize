import 'dart:async';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/features/authentication/screens/Registration/registration.dart';
import 'package:flutter_application_2/features/shop/screens/home/home.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'package:path/path.dart';

class Verifyaccount extends StatefulWidget {
  Verifyaccount(
      {super.key,
      this.givemeimage,
      required this.usernamec,
      required this.countryc,
      required this.phonenumberc});

  TextEditingController usernamec;
  TextEditingController countryc;
  TextEditingController phonenumberc;
  final givemeimage;

  @override
  State<Verifyaccount> createState() =>
      _VerifyaccountState(usernamec, countryc, phonenumberc, givemeimage!);
}

class _VerifyaccountState extends State<Verifyaccount> {
  TextEditingController usernamec;
  TextEditingController countryc;
  TextEditingController phonenumberc;

  final givemeimage;
  _VerifyaccountState(
      this.usernamec, this.countryc, this.phonenumberc, this.givemeimage);
  bool isemailv = false;
  Timer? timer;
  @override
  void initState() {
    super.initState();
    isemailv = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!isemailv) {
      sendverify();
      timer = Timer.periodic(
        const Duration(seconds: 3),
        (_) => checkemail(),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future sendverify() async {
    final userr = FirebaseAuth.instance.currentUser!;
    await userr.sendEmailVerification();

    await Future.delayed(Duration(seconds: 5));
  }

  Future checkemail() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isemailv = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if (isemailv) timer?.cancel();
    if (isemailv) {
      firebase_storage.Reference? refs;
      String? uurl;
      final myuser = FirebaseAuth.instance.currentUser!.uid;
      final myemail = FirebaseAuth.instance.currentUser!.email;

      if (givemeimage != "") {
        refs = firebase_storage.FirebaseStorage.instance
            .ref()
            .child("/Mainimage/$myuser/${basename(givemeimage.path)}");
        await refs!.putFile(givemeimage);
        uurl = await refs!.getDownloadURL();
        String? token = await FirebaseMessaging.instance.getToken();
        await FirebaseFirestore.instance.collection("Users").doc(myuser).set({
          'username': usernamec.text,
          'country': countryc.text.trim(),
          'phone': phonenumberc.text.trim(),
          'uid': myuser,
          'status': 'Offline',
          'token': token,
          'profile': uurl,
          "email": myemail
        });
      } else if (givemeimage == "") {
        String? token = await FirebaseMessaging.instance.getToken();
        await FirebaseFirestore.instance.collection("Users").doc(myuser).set({
          'username': usernamec.text,
          'country': countryc.text.trim(),
          'phone': phonenumberc.text.trim(),
          'uid': myuser,
          'status': 'Offline',
          'token': token,
          'profile': "empty",
          "email": myemail
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return isemailv
        ? Myhomepage(
            currentIndex: 0,
          )
        : Scaffold(
            backgroundColor: Colors.grey.shade100,
            body: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Image.asset(
                    "assets/images/Emails-amico.png",
                    scale: 2.sp,
                  ),
                  Text(
                    "Verify your E-Mail",
                    style: GoogleFonts.openSans(
                        fontSize: 22.sp,
                        color: Color.fromARGB(255, 77, 71, 71),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "A verification message has been sent to your email",
                    style: GoogleFonts.lato(fontSize: 16.sp),
                  ),
                  SizedBox(height: 20.h),
                  ElevatedButton.icon(
                      style: TextButton.styleFrom(
                          elevation: 2.sp,
                          fixedSize: Size(350.w, 50.h),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          backgroundColor: Colors.blueAccent),
                      onPressed: () {
                        sendverify();
                      },
                      icon: Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                      label: Text(
                        "Resend Message",
                        style: TextStyle(color: Colors.white),
                      )),
                  SizedBox(
                    height: 10.h,
                  ),
                  ElevatedButton(
                      style: TextButton.styleFrom(
                          elevation: 2.sp,
                          fixedSize: Size(350.w, 50.h),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          backgroundColor: Colors.white),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyregPage(),
                            ));
                      },
                      child: Text(
                        "Cancel",
                        style:
                            TextStyle(color: Color.fromARGB(255, 77, 71, 71)),
                      ))
                ],
              ),
            ),
          );
  }
}
