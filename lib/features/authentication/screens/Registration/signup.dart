// ignore_for_file: non_constant_identifier_names, unused_import

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/authentication/screens/Registration/continuesignup.dart';
import 'package:flutter_application_2/features/authentication/screens/Registration/login.dart';
import 'package:flutter_application_2/features/authentication/screens/Registration/logintextfiled.dart';
import 'package:flutter_application_2/features/authentication/screens/Registration/verify.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Mysignup extends StatefulWidget {
  const Mysignup({super.key});

  @override
  State<Mysignup> createState() => _MysignupState();
}

final Cuser = FirebaseAuth.instance.currentUser;

class _MysignupState extends State<Mysignup> {
  final formkey = GlobalKey<FormState>();

  final _gmailcontroller = TextEditingController();

  final _passwordcontroller = TextEditingController();

  void signUserUp() async {
    final validform = formkey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (validform) {
      formkey.currentState!.save();

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Mycontsignup(
                gmail: _gmailcontroller, password: _passwordcontroller),
          ));
    }
  }

  bool shortpass(input) {
    if (input.length < 8) {
      return true;
    } else {
      return false;
    }
  }

  bool emptypass(input) {
    if (input.length == 0) {
      return true;
    } else {
      return false;
    }
  }

  bool validemail(input) {
    if (EmailValidator.validate(input)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: SafeArea(
            child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(bottom: 30.h),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //-----------logo------------------//
                    SizedBox(height: 25.h),
                    Padding(
                      padding: EdgeInsets.only(right: 5.w),
                      child: Image.asset(
                        "assets/images/end-user.png",
                        scale: 2.5.sp,
                      ),
                    ),

                    //--------------welcoming text---------
                    SizedBox(height: 10.h),

                    Text(
                      "Welcome to Magellan let's Create your account",
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700]),
                    ),

                    SizedBox(
                      height: 25.h,
                    ),

                    // input text user name-----
                    Form(
                      key: formkey,
                      child: Column(
                        children: [
                          Mylogintextfiled(
                            validator: (value) {
                              if (emptypass(value)) {
                                return "this field is requierd";
                              } else if (validemail(value)) {
                                return null;
                              } else {
                                return "Please enter a vaild email";
                              }
                            },
                            prefxicon: Icon(
                              color: Colors.blueAccent,
                              Icons.email,
                              size: 30.sp,
                            ),
                            controller: _gmailcontroller,
                            hinttext: "E-Mail",
                            obscureText: false,
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Mylogintextfiled(
                            validator: (value) {
                              if (emptypass(value)) {
                                return "this field is requierd";
                              } else if (shortpass(value)) {
                                return "Password is too short";
                              } else {
                                return null;
                              }
                            },
                            prefxicon: Icon(
                              color: Colors.blueAccent,
                              Icons.password_outlined,
                              size: 30.sp,
                            ),
                            controller: _passwordcontroller,
                            hinttext: "Password",
                            obscureText: true,
                          )
                        ],
                      ),
                    ),

                    //-------input text password-----------

                    SizedBox(
                      height: 35.h,
                    ),

                    //----------elevatedbutton signin------------

                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10.h),
                          child: ElevatedButton(
                              style: TextButton.styleFrom(
                                  fixedSize: Size(330.w, 80.h),
                                  backgroundColor: Colors.blueAccent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              onPressed: () {
                                signUserUp();
                              },
                              child: Text(
                                "Sign Up",
                                style: GoogleFonts.notoSansAdlam(
                                    fontSize: 20.sp,
                                    color: const Color.fromARGB(
                                        255, 245, 243, 243)),
                              )),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),

                    ///text dont have an account----------
                    Row(
                      children: [
                        Expanded(
                            child: Divider(
                          thickness: 0.5,
                          color: Color.fromARGB(255, 189, 188, 188),
                        )),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Text(
                            "Already have an account ?",
                            style: TextStyle(
                                color: Color.fromARGB(224, 16, 89, 122)),
                          ),
                        ),
                        Expanded(
                            child: Divider(
                          thickness: 0.5,
                          color: Color.fromARGB(255, 189, 188, 188),
                        ))
                      ],
                    ),

                    SizedBox(
                      height: 35.h,
                    ),

                    GestureDetector(
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const Mylogin();
                      })),
                      child: ElevatedButton(
                          style: TextButton.styleFrom(
                              fixedSize: Size(330.w, 80.h),
                              backgroundColor:
                                  const Color.fromARGB(199, 3, 12, 17),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          onPressed: null,
                          child: Text(
                            "Log In",
                            style: GoogleFonts.notoSansAdlam(
                                fontSize: 20.sp,
                                color:
                                    const Color.fromARGB(255, 245, 243, 243)),
                          )),
                    ),

                    SizedBox(width: 15.w),
                  ]),
            ),
          ),
        )),
      ),
    );
  }
}
