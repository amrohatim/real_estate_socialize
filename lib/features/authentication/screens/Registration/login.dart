// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:awesome_top_snackbar/awesome_top_snackbar.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/authentication/screens/Registration/logintextfiled.dart';
import 'package:flutter_application_2/features/authentication/screens/Registration/signup.dart';
import 'package:flutter_application_2/features/shop/screens/Setting/account.dart';
import 'package:flutter_application_2/features/shop/screens/home/home.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Mylogin extends StatefulWidget {
  const Mylogin({super.key});

  @override
  State<Mylogin> createState() => _MyloginState();
}

class _MyloginState extends State<Mylogin> {
  MyAccount acc = MyAccount();
  final gmailcontroller = TextEditingController();

  final passwordcontroller = TextEditingController();
  bool loading = false;
  Future signuserin() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: gmailcontroller.text.trim(),
          password: passwordcontroller.text.trim());
      if (FirebaseAuth.instance.currentUser!.emailVerified) {
        loading = false;
        setState(() {});
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return Myhomepage(
              currentIndex: 0,
            );
          },
        ));
      } else {
        awesomeTopSnackbar(context, "Verify your email first",
            backgroundColor: Colors.red,
            icon: const Icon(Icons.close, color: Colors.white),
            iconWithDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white),
            ));
      }
    } on FirebaseException catch (e) {
      loading = false;
      setState(() {});
      awesomeTopSnackbar(context, "${e.message}",
          backgroundColor: Colors.red,
          icon: const Icon(Icons.close, color: Colors.white),
          iconWithDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white),
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

  // ignore: prefer_typing_uninitialized_variables
  var values;
  bool validemail(input) {
    if (EmailValidator.validate(input)) {
      return true;
    } else {
      return false;
    }
  }

  final keyform = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: SafeArea(
            child: Center(
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              //-----------logo------------------//
              SizedBox(height: 25.h),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 50.w, 0),
                child: Image.asset(
                  "assets/images/enter.png",
                  scale: 3.4.sp,
                ),
              ),

              //--------------welcoming text---------
              SizedBox(height: 25.h),

              Text(
                "Welcome to Magellan Please Login",
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
                key: keyform,
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
                      controller: gmailcontroller,
                      hinttext: "E-Mail",
                      obscureText: false,
                    ),
                    SizedBox(
                      height: 25.h,
                    ),

                    //-------input text password-----------

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
                      controller: passwordcontroller,
                      hinttext: "Password",
                      obscureText: true,
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 10.h,
              ),

              //----------elevatedbutton signin------------

              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(250.w, 0, 0, 0),
                    child: Text("Forget Password ?",
                        style: TextStyle(
                            color: const Color.fromARGB(224, 16, 89, 122))),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20.h, 0, 0),
                    child: GestureDetector(
                      onTap: () {
                        loading = true;
                        if (keyform.currentState!.validate()) {
                          signuserin();
                        }
                      },
                      child: ElevatedButton(
                          style: TextButton.styleFrom(
                              fixedSize: Size(330.w, 80.h),
                              backgroundColor: Colors.blueAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          onPressed: null,
                          child: Text(
                            "Log In",
                            style: GoogleFonts.notoSansAdlam(
                                fontSize: 20.sp,
                                color: Color.fromARGB(255, 245, 243, 243)),
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 10.h,
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
                  Text(
                    "Don't have an account ?",
                    style: TextStyle(color: Color.fromARGB(224, 16, 89, 122)),
                  ),
                  Expanded(
                      child: Divider(
                    thickness: 0.5,
                    color: Color.fromARGB(255, 189, 188, 188),
                  ))
                ],
              ),

              SizedBox(
                height: 25.h,
              ),

              GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Mysignup();
                  },
                )),
                child: ElevatedButton(
                    style: TextButton.styleFrom(
                        fixedSize: Size(330.w, 80.h),
                        backgroundColor: Color.fromARGB(199, 3, 12, 17),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: null,
                    child: Text(
                      "Sign Up",
                      style: GoogleFonts.notoSansAdlam(
                          fontSize: 20.sp,
                          color: Color.fromARGB(255, 245, 243, 243)),
                    )),
              ),

              ///text forget password---------------
            ]),
          ),
        )),
      ),
    );
  }
}
