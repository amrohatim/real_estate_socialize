import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class Changepassword extends StatefulWidget {
  const Changepassword({super.key});

  @override
  State<Changepassword> createState() => _ChangePassword();
}

class _ChangePassword extends State<Changepassword> {
  final passwordcontroller = TextEditingController();
  final newpasswordcontroller = TextEditingController();
  final confirmpasswordcontroller = TextEditingController();
  final myauth = FirebaseAuth.instance.currentUser!.uid;

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              "Change Password",
              style: GoogleFonts.notoSansAdlam(),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(children: [
                SizedBox(
                  height: 90,
                ),

                //////////// User Name ////////////////
                Form(
                  key: formkey,
                  child: Column(
                    children: [
                      /////////////////// Password ////////////////////

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: TextFormField(
                            controller: passwordcontroller,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.blueAccent)),
                                hintText: "Password",
                                hintStyle: GoogleFonts.notoSansAdlam(),
                                prefixIcon: Icon(
                                  color: Colors.blueAccent,
                                  Icons.password_rounded,
                                  size: 30,
                                ))),
                      ),

                      /////////////////////////// Enter new password///////////////
                      SizedBox(height: 25),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: TextFormField(
                            controller: newpasswordcontroller,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.blueAccent)),
                                hintText: "New Password",
                                hintStyle: GoogleFonts.notoSansAdlam(),
                                prefixIcon: Icon(
                                  color: Colors.blueAccent,
                                  Icons.password_rounded,
                                  size: 30,
                                ))),
                      ),

                      ////////////////////////Confirm new password/////////////
                      SizedBox(height: 25),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: TextFormField(
                            controller: confirmpasswordcontroller,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.blueAccent)),
                                hintText: "Confirm Password",
                                hintStyle: GoogleFonts.notoSansAdlam(),
                                prefixIcon: Icon(
                                  color: Colors.blueAccent,
                                  Icons.password_rounded,
                                  size: 30,
                                ))),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 30,
                ),

                SizedBox(
                  height: 70,
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(110, 0, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          style: TextButton.styleFrom(
                              fixedSize: Size(170, 50),
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          onPressed: () {},
                          child: Text(
                            "Change Password",
                            style: GoogleFonts.notoSansAdlam(
                                fontSize: 14,
                                color: Color.fromARGB(255, 245, 243, 243)),
                          )),
                    ],
                  ),
                ),
                SizedBox(height: 20)
              ]),
            ],
          ),
        ));
  }
}
