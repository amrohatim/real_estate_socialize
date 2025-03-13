import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/authentication/screens/Registration/registration.dart';
import 'package:flutter_application_2/features/shop/screens/Setting/about.dart';
import 'package:flutter_application_2/features/shop/screens/Setting/account.dart';
import 'package:flutter_application_2/features/shop/screens/Setting/changepassword.dart';
import 'package:flutter_application_2/features/shop/screens/Setting/contactus.dart';
import 'package:flutter_application_2/features/shop/screens/Setting/favorute.dart';
import 'package:flutter_application_2/features/shop/screens/Setting/mypost.dart';
import 'package:flutter_application_2/features/shop/screens/Setting/recent.dart';
import 'package:flutter_application_2/utils/constants/MytopmainBar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class MySetting extends StatefulWidget {
  const MySetting({super.key});

  @override
  State<MySetting> createState() => _MySettingState();
}

class _MySettingState extends State<MySetting> {
  final myauth = FirebaseAuth.instance.currentUser!.uid;
  String? myaccountname;
  String? profile;
  fetchname() async {
    final cuser = FirebaseAuth.instance.currentUser;
    if (cuser != null) {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(myauth)
          .get()
          .then((ds) {
        myaccountname = ds["username"];
        profile = ds["profile"];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(48, 255, 255, 255),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Mytopmainbar(),
              SizedBox(height: 30),
              FutureBuilder(
                  future: fetchname(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState != ConnectionState.done) {
                      return CircularProgressIndicator(
                        color: Colors.blueAccent,
                        strokeWidth: 1,
                      );
                    } else {
                      return Column(
                        children: [
                          profile != "empty"
                              ? CircleAvatar(
                                  backgroundImage: NetworkImage(profile!),
                                  backgroundColor:
                                      Color.fromARGB(255, 234, 236, 236),
                                  radius: 50,
                                )
                              : CircleAvatar(
                                  child: Image.asset("assets/images/user.png"),
                                  backgroundColor:
                                      Color.fromARGB(255, 234, 236, 236),
                                  radius: 50,
                                ),
                          SizedBox(height: 8),
                          Text(
                            myaccountname!,
                            style: GoogleFonts.mali(
                                fontSize: 16, color: Color(0xff000000)),
                          ),
                        ],
                      );
                    }
                  }),
              SizedBox(height: 19),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Mylastpost(),
                          ));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        color: Color.fromARGB(43, 245, 245, 245),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 3,
                            ),
                            Icon(
                              Icons.padding,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              "MyPosts",
                              style: GoogleFonts.mali(
                                  fontSize: 14, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      margin: EdgeInsets.only(right: 6),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 0.1,
                                offset: Offset(0.5, 0.5),
                                color: Color.fromARGB(239, 68, 137, 255))
                          ],
                          color: Color.fromARGB(38, 247, 247, 247),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Myfavorite(),
                          ));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        color: Color.fromARGB(43, 245, 245, 245),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 3,
                            ),
                            Icon(
                              Icons.favorite,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              "Favorite",
                              style: GoogleFonts.mali(
                                  fontSize: 14, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      margin: EdgeInsets.only(right: 6),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 0.1,
                                offset: Offset(0.5, 0.5),
                                color: const Color.fromARGB(239, 255, 82, 82))
                          ],
                          color: Color.fromARGB(38, 247, 247, 247),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Myrecent(),
                          ));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        color: Color.fromARGB(43, 245, 245, 245),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 3,
                            ),
                            Icon(
                              Icons.history_toggle_off,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              "Recent",
                              style: GoogleFonts.mali(
                                  fontSize: 14, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      margin: EdgeInsets.only(right: 6),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 0.1,
                                offset: Offset(0.5, 0.5),
                                color: Color.fromARGB(239, 55, 192, 126))
                          ],
                          color: Color.fromARGB(38, 247, 247, 247),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 70),
              Container(
                margin: EdgeInsets.only(right: 100, left: 10, bottom: 15),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0.4, 0.4), color: Colors.blueAccent)
                    ]),
                child: Row(
                  children: [
                    Icon(
                      Icons.notifications_active_outlined,
                      color: Color(0xff828282),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Notifications",
                      style: GoogleFonts.notoSansAdlam(
                          fontSize: 18, color: Color(0xff000000)),
                    ),
                    SizedBox(
                      width: 69.41,
                    ),
                    Icon(
                      Icons.arrow_circle_right_outlined,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(width: 5)
                  ],
                ),
              ),
              InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const MyAccount();
                      },
                    ));
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 100, left: 10, bottom: 15),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0.4, 0.4),
                              color: Colors.blueAccent)
                        ]),
                    child: Row(
                      children: [
                        Icon(
                          Iconsax.user_edit,
                          color: Color(0xff828282),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Account",
                          style: GoogleFonts.notoSansAdlam(
                              fontSize: 18, color: Color(0xff000000)),
                        ),
                        SizedBox(
                          width: 109.55,
                        ),
                        Icon(
                          Icons.arrow_circle_right_outlined,
                          color: Colors.blueAccent,
                        ),
                        SizedBox(width: 5)
                      ],
                    ),
                  )),
              InkWell(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Changepassword())),
                child: Container(
                  margin: EdgeInsets.only(right: 100, left: 10, bottom: 15),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0.4, 0.4), color: Colors.blueAccent)
                      ]),
                  child: Row(
                    children: [
                      Icon(
                        Icons.password_rounded,
                        color: Color(0xff828282),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Change Password",
                        style: GoogleFonts.notoSansAdlam(
                            fontSize: 18, color: Color(0xff000000)),
                      ),
                      SizedBox(
                        width: 25.1,
                      ),
                      Icon(
                        Icons.arrow_circle_right_outlined,
                        color: Colors.blueAccent,
                      ),
                      SizedBox(
                        width: 5,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 100, left: 10, bottom: 15),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0.4, 0.4), color: Colors.blueAccent)
                    ]),
                child: Row(
                  children: [
                    Icon(
                      Icons.group_add_outlined,
                      color: Color(0xff828282),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Invite Friend",
                      style: GoogleFonts.notoSansAdlam(
                          fontSize: 18, color: Color(0xff000000)),
                    ),
                    SizedBox(
                      width: 70.52,
                    ),
                    Icon(
                      Icons.arrow_circle_right_outlined,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(width: 5)
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 100, left: 10, bottom: 15),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0.4, 0.4), color: Colors.blueAccent)
                    ]),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Contactus()));
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.contact_support_outlined,
                        color: Color(0xff828282),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Contact Us",
                        style: GoogleFonts.notoSansAdlam(
                            fontSize: 18, color: Color(0xff000000)),
                      ),
                      SizedBox(
                        width: 85.1,
                      ),
                      Icon(
                        Icons.arrow_circle_right_outlined,
                        color: Colors.blueAccent,
                      ),
                      SizedBox(
                        width: 5,
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Aboutus()));
                },
                child: Container(
                  margin: EdgeInsets.only(right: 100, left: 10, bottom: 15),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0.4, 0.4), color: Colors.blueAccent)
                      ]),
                  child: Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: Color(0xff828282),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "About Us",
                        style: GoogleFonts.notoSansAdlam(
                            fontSize: 18, color: Color(0xff000000)),
                      ),
                      SizedBox(
                        width: 100.3,
                      ),
                      Icon(
                        Icons.arrow_circle_right_outlined,
                        color: Colors.blueAccent,
                      ),
                      SizedBox(
                        width: 5,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 55),
              InkWell(
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => MyregPage()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Logout",
                        style: GoogleFonts.notoSansAdlam(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.w500)),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.logout,
                      size: 50,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(width: 25)
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
