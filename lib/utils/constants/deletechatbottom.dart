import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/shop/screens/home/home.dart';
import 'package:google_fonts/google_fonts.dart';

class Chatdelete extends StatefulWidget {
  const Chatdelete({super.key, this.getdeletedchat});
  final getdeletedchat;

  @override
  State<Chatdelete> createState() => _ChatdeleteState(getdeletedchat);
}

class _ChatdeleteState extends State<Chatdelete> {
  final getdeletedchat;
  _ChatdeleteState(this.getdeletedchat);
  String uid = FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    return BottomSheet(
        onClosing: dispose,
        builder: (context) => Container(
              width: 370,
              height: 70,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: InkWell(
                  onTap: () async {
                    await FirebaseFirestore.instance
                        .collection("Users")
                        .doc(uid)
                        .collection("ChatRoom")
                        .doc(getdeletedchat)
                        .delete();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Myhomepage(currentIndex: 1)));
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.delete,
                        color: Colors.redAccent,
                        size: 30,
                      ),
                      Text(
                        "Delete chat",
                        style: GoogleFonts.notoSansAdlam(fontSize: 16),
                      )
                    ],
                  ),
                ),
              ),
            ));
  }
}
