import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/features/shop/screens/home/detailpageflat/detailpageflat.dart';
import 'package:flutter_application_2/features/shop/screens/post/post.dart';
import 'package:flutter_application_2/utils/constants/MytopmainBar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class Mylastpost extends StatefulWidget {
  const Mylastpost({super.key});

  @override
  State<Mylastpost> createState() => _MylastpostState();
}

class _MylastpostState extends State<Mylastpost> {
  List<QueryDocumentSnapshot> myfavlist = [];
  List<QueryDocumentSnapshot> myuserlist = [];

  String uid = FirebaseAuth.instance.currentUser!.uid;
  getmypost() async {
    final QuerySnapshot getflat = await FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .collection("Mypost")
        .get();

    myfavlist.addAll(getflat.docs);
    final QuerySnapshot alluser =
        await FirebaseFirestore.instance.collection("Users").get();
    myuserlist.addAll(alluser.docs);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(239, 68, 137, 255),
        foregroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 75),
          child: Text(
            "MyPosts",
            style: GoogleFonts.notoSansAdlam(),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40),
            FutureBuilder(
                future: getmypost(),
                builder: ((context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return const Padding(
                      padding: EdgeInsets.only(top: 200, left: 180),
                      child: CircularProgressIndicator(
                        color: Colors.blueAccent,
                        strokeWidth: 1,
                      ),
                    );
                  } else {
                    return myfavlist.isNotEmpty
                        ? Container(
                            height: 700,
                            padding: EdgeInsets.symmetric(horizontal: 80),
                            child: ListView.builder(
                                itemCount: myfavlist.length,
                                itemBuilder: (context, index) {
                                  return myfavlist[index]["Country"] != null
                                      ? InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        MyDetailFlat(
                                                          mainsalerid:
                                                              myfavlist[index]
                                                                  ["Salerid"],
                                                          docsid:
                                                              myfavlist[index]
                                                                  ["docid"],
                                                        )));
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(bottom: 10),
                                            width: 200,
                                            height: 300,
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15)),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color(0xfff5f5f3),
                                                      spreadRadius: 3,
                                                      blurRadius: 10,
                                                      offset: Offset(0, 3))
                                                ]),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: 180,
                                                    width: 220,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    20)),
                                                        color: Colors.white,
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                                myfavlist[index]
                                                                    ["image"]),
                                                            fit: BoxFit.fill)),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10, top: 10),
                                                    child:
                                                        SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            myfavlist[index]
                                                                ["State"],
                                                            style: GoogleFonts
                                                                .notoSansAdlam(
                                                                    fontSize:
                                                                        15,
                                                                    color: Color
                                                                        .fromARGB(
                                                                            195,
                                                                            0,
                                                                            0,
                                                                            0)),
                                                          ),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          Text(
                                                            ". ${myfavlist[index]["City"]}",
                                                            style: GoogleFonts
                                                                .notoSansAdlam(
                                                                    fontSize:
                                                                        15,
                                                                    color: Color
                                                                        .fromARGB(
                                                                            195,
                                                                            0,
                                                                            0,
                                                                            0)),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      const Icon(
                                                        size: 20,
                                                        Iconsax.dollar_circle,
                                                        color: Color.fromARGB(
                                                            255, 81, 190, 163),
                                                      ),
                                                      SizedBox(width: 3),
                                                      Text(
                                                        myfavlist[index]
                                                                ["Price"]
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 17,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    81,
                                                                    190,
                                                                    163)),
                                                      ),
                                                      SizedBox(width: 50),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                right: 10,
                                                                top: 35),
                                                        child: Container(
                                                          width: 30,
                                                          height: 30,
                                                          decoration: BoxDecoration(
                                                              color: Colors.red,
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          7))),
                                                          child: IconButton(
                                                              onPressed: () {
                                                                FirebaseFirestore
                                                                    .instance
                                                                    .collection(
                                                                        'Users')
                                                                    .doc(uid)
                                                                    .collection(
                                                                        "Mypost")
                                                                    .doc(myfavlist[
                                                                            index]
                                                                        [
                                                                        "docid"])
                                                                    .delete();
                                                                FirebaseFirestore
                                                                    .instance
                                                                    .collection(
                                                                        "Sale")
                                                                    .doc(myfavlist[
                                                                            index]
                                                                        [
                                                                        "docid"])
                                                                    .delete();
                                                                for (var i = 0;
                                                                    i <=
                                                                        myuserlist
                                                                            .length;
                                                                    i++) {
                                                                  FirebaseFirestore
                                                                      .instance
                                                                      .collection(
                                                                          "Users")
                                                                      .doc(myuserlist[
                                                                              i]
                                                                          .id)
                                                                      .collection(
                                                                          "Recent")
                                                                      .doc(myfavlist[
                                                                              index]
                                                                          [
                                                                          "docid"])
                                                                      .delete();
                                                                  FirebaseFirestore
                                                                      .instance
                                                                      .collection(
                                                                          "Users")
                                                                      .doc(myuserlist[
                                                                              i]
                                                                          .id)
                                                                      .collection(
                                                                          "favorutes")
                                                                      .doc(myfavlist[
                                                                              index]
                                                                          [
                                                                          "docid"])
                                                                      .delete();

                                                                  Navigator.pushReplacement(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder: (context) =>
                                                                              const Mylastpost()));
                                                                }
                                                              },
                                                              icon: Icon(
                                                                  color: Colors
                                                                      .white,
                                                                  size: 15,
                                                                  Icons
                                                                      .delete)),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      : SizedBox.shrink();
                                }),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(top: 300, left: 95),
                            child: Text(
                              "Myposts is empty",
                              style: GoogleFonts.openSans(
                                  fontSize: 24, color: Colors.grey[600]),
                            ),
                          );
                  }
                }))
          ],
        ),
      ),
    );
  }
}
