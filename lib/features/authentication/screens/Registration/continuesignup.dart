import 'dart:io';

import 'package:awesome_top_snackbar/awesome_top_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/authentication/screens/Registration/verify.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

// ignore: must_be_immutable
class Mycontsignup extends StatefulWidget {
  Mycontsignup({super.key, required this.gmail, required this.password});
  TextEditingController gmail;
  TextEditingController password;

  @override
  // ignore: no_logic_in_create_state
  State<Mycontsignup> createState() => _MycontsignupState(gmail, password);
}

class _MycontsignupState extends State<Mycontsignup> {
  TextEditingController gmail;
  TextEditingController password;
  _MycontsignupState(this.gmail, this.password);
  final usernameconroller = TextEditingController();
  final countrycontroller = TextEditingController();
  final phonenumbercontroller = TextEditingController();
  bool ispressed = false;
  File? profile;

  selectimage() async {
    final ImagePicker imagepick = ImagePicker();
    final XFile? image = await imagepick.pickImage(source: ImageSource.gallery);
    profile = File(image!.path);

    setState(() {});
  }

  // ignore: prefer_typing_uninitialized_variables

  bool emptypass(input) {
    if (input.length == 0) {
      return true;
    } else {
      return false;
    }
  }

  bool shortuser(input) {
    if (input.length < 5) {
      return true;
    } else {
      return false;
    }
  }

  final formkey = GlobalKey<FormState>();
  void signUserUp() async {
    final validform = formkey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (validform) {
      formkey.currentState!.save();
      if (FirebaseAuth.instance.currentUser == null) {
        try {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: gmail.text.trim(), password: password.text.trim());
          Navigator.pushReplacement(
              // ignore: use_build_context_synchronously
              context,
              MaterialPageRoute(
                builder: (context) => Verifyaccount(
                  givemeimage: profile != null ? profile : "",
                  usernamec: usernameconroller,
                  phonenumberc: phonenumbercontroller,
                  countryc: countrycontroller,
                ),
              ));
        } on FirebaseAuthException catch (e) {
          // ignore: use_build_context_synchronously
          awesomeTopSnackbar(context, "${e.message}",
              backgroundColor: Colors.red,
              icon: const Icon(Icons.close, color: Colors.white),
              iconWithDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white),
              ));
        }
      } else if (FirebaseAuth.instance.currentUser!.emailVerified == false) {
        try {
          Navigator.pushReplacement(
              // ignore: use_build_context_synchronously
              context,
              MaterialPageRoute(
                builder: (context) => Verifyaccount(
                  givemeimage: profile != null ? profile : "",
                  usernamec: usernameconroller,
                  phonenumberc: phonenumbercontroller,
                  countryc: countrycontroller,
                ),
              ));
        } on FirebaseAuthException catch (e) {
          // ignore: use_build_context_synchronously
          awesomeTopSnackbar(context, "${e.message}",
              backgroundColor: Colors.red,
              icon: const Icon(Icons.close, color: Colors.white),
              iconWithDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white),
              ));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 90.h, 0, 0),
          child: Column(
            children: [
              Stack(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(10.w, 20.h, 5.w, 60.h),
                        child: Text(
                          "Hello",
                          style: GoogleFonts.mali(fontSize: 20.sp),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 45.sp),
                        child: Image.asset(
                          "assets/images/waving-hand.png",
                          scale: 14.sp,
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15.w, 55.h, 40.w, 0),
                    child: Text(
                      "Please verify your email and  Set Up  your profile information in order to continue  ",
                      style: GoogleFonts.mali(fontSize: 16.sp),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 150.h),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      width: 450.w,
                      height: 535.h,
                    ),
                  ),
                  Column(children: [
                    SizedBox(
                      height: 150.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 15.w, bottom: 7.h),
                      child: Text(
                        "Upload profile picture",
                        style: GoogleFonts.mali(fontSize: 16.sp),
                      ),
                    ),
                    SizedBox(
                      height: 150.h,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 20.w, 20.h),
                        child: InkWell(
                          onTap: selectimage,
                          child: profile == null
                              ? CircleAvatar(
                                  backgroundColor:
                                      Color.fromARGB(255, 234, 236, 236),
                                  radius: 55.sp,
                                  child: Icon(
                                    Icons.add_a_photo,
                                    size: 50.sp,
                                    color: Color.fromARGB(197, 68, 137, 255),
                                  ),
                                )
                              : Stack(children: [
                                  CircleAvatar(
                                    backgroundImage:
                                        FileImage(File(profile!.path)),
                                    radius: 55.sp,
                                  ),
                                  Positioned(
                                    bottom: 18.h,
                                    right: 4.w,
                                    child: Container(
                                        padding: EdgeInsets.all(9.sp),
                                        decoration: const BoxDecoration(
                                            color: Colors.blueAccent,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30))),
                                        child: Icon(
                                          Icons.camera_alt_outlined,
                                          color: Colors.white,
                                          size: 15.sp,
                                        )),
                                  )
                                ]),
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),

                    //////////// User Name ////////////////

                    Form(
                      key: formkey,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30.w),
                            child: TextFormField(
                                validator: (value) {
                                  if (emptypass(value)) {
                                    return "This field is requierd";
                                  } else if (shortuser(value)) {
                                    return "User Name too short";
                                  }
                                  return null;
                                },
                                controller: usernameconroller,
                                decoration: InputDecoration(
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blueAccent)),
                                    hintText: "User name",
                                    hintStyle: GoogleFonts.notoSansAdlam(),
                                    prefixIcon: Icon(
                                      color: Colors.blueAccent,
                                      Icons.person_outlined,
                                      size: 30.sp,
                                    ))),
                          ),
                          SizedBox(height: 45.h),

                          //////////   Phone Number //////////////////

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30.w),
                            child: IntlPhoneField(
                              controller: phonenumbercontroller,
                              decoration: InputDecoration(
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blueAccent)),
                                  hintText: "Phone number",
                                  hintStyle: GoogleFonts.notoSansAdlam(),
                                  prefixIcon: Icon(
                                    color: Colors.blueAccent,
                                    Icons.person_outlined,
                                    size: 30.sp,
                                  )),
                              initialCountryCode: 'SD',
                              onChanged: (phone) {},
                            ),
                          ),

                          SizedBox(height: 25.h),

                          ///////// ////Your Country //////////////

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30.w),
                            child: TextFormField(
                                validator: (value) {
                                  if (emptypass(value)) {
                                    return "This field is requierd";
                                  }
                                  return null;
                                },
                                controller: countrycontroller,
                                decoration: InputDecoration(
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blueAccent)),
                                    hintText: "City",
                                    hintStyle: GoogleFonts.notoSansAdlam(),
                                    prefixIcon: Icon(
                                      color: Colors.blueAccent,
                                      Icons.location_city,
                                      size: 30.sp,
                                    ))),
                          ),
                        ],
                      ),
                    ),

                    //////////   Phone Number //////////////////

                    SizedBox(
                      height: 30.h,
                    ),

                    ///////////////// I am here for //////////////////

                    /////////////// Buy and Sale avatar ///////////////////

                    Padding(
                      padding: EdgeInsets.fromLTRB(30.w, 0.h, 30.w, 25.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              if (formkey.currentState!.validate()) {
                                signUserUp();
                              }
                            },
                            child: ElevatedButton(
                                style: TextButton.styleFrom(
                                    fixedSize: Size(330.w, 70.h),
                                    backgroundColor: ispressed
                                        ? Colors.grey[500]
                                        : Colors.blue,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                onPressed: null,
                                child: Text(
                                  "Set Up & Verify",
                                  style: GoogleFonts.notoSansAdlam(
                                      fontSize: 18.sp,
                                      color: const Color.fromARGB(
                                          255, 245, 243, 243)),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
