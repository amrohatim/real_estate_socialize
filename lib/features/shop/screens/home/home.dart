// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/features/shop/screens/Chat_Room/chat.dart';
import 'package:flutter_application_2/features/shop/screens/Setting/setting.dart';
import 'package:flutter_application_2/features/shop/screens/Dashboard/dashboard.dart';
import 'package:flutter_application_2/features/shop/screens/home/primaryhome.dart';
import 'package:flutter_application_2/features/shop/screens/post/post.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// ignore: must_be_immutable
class Myhomepage extends StatefulWidget {
  Myhomepage({super.key, required this.currentIndex});
  int currentIndex;

  @override
  State<Myhomepage> createState() => _MyhomepageState(currentIndex);
}

final serachcontroller = TextEditingController();

class _MyhomepageState extends State<Myhomepage> {
  @override
  /*void initState() {
    String useridd = FirebaseAuth.instance.currentUser!.uid;
    FirebaseFirestore.instance
        .collection("Users")
        .doc(useridd)
        .update({'status': "Online"});
    super.initState();
  }*/

  int currentIndex = 0;
  _MyhomepageState(this.currentIndex);
  @override
  Widget build(BuildContext context) {
    List<Widget> optionlist = <Widget>[
      const Myhomeprime(),
      const Chat(),
      MYPost(
        index: 0,
      ),
      const MySetting(),
    ];

    return Scaffold(
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: GNav(
              selectedIndex: currentIndex,
              onTabChange: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              tabBorderRadius: 0,
              gap: 8.sp,
              activeColor: Colors.blueAccent,
              tabBackgroundColor: Colors.grey.shade200,
              padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 10.w),
              tabs: [
                GButton(
                  icon: Icons.home_outlined,
                  iconSize: 30.sp,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.chat_outlined,
                  text: 'Chats',
                ),
                GButton(
                  icon: Icons.add_box_outlined,
                  text: 'Upload',
                ),
                GButton(
                  icon: Icons.settings_outlined,
                  text: 'Setting',
                )
              ]),
        ),
        body: optionlist.elementAt(currentIndex));
  }
}
