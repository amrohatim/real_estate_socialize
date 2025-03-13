import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_2/features/shop/screens/Dashboard/detaildash1.dart';
import 'package:flutter_application_2/features/shop/screens/Dashboard/detaildash2.dart';
import 'package:flutter_application_2/features/shop/screens/Dashboard/detaildash3.dart';
import 'package:flutter_application_2/features/shop/screens/home/detailpageflat/detailflat3.dart';
import 'package:google_fonts/google_fonts.dart';

class Mydetaildash extends StatefulWidget {
  Mydetaildash({super.key, this.docsid, required this.mainsalerid});
  final docsid;
  String mainsalerid;
  @override
  State<Mydetaildash> createState() => _MydetaildashState(mainsalerid);
}

class _MydetaildashState extends State<Mydetaildash> {
  final currentuserid = FirebaseAuth.instance.currentUser!.uid;
  String mainsalerid;
  _MydetaildashState(this.mainsalerid);
  String? image;

  List<Tab> mytabs = [
    Tab(
      text: "Overview",
    ),
    Tab(
      text: "Images",
    ),
    Tab(
      text: "Chat Room",
    ),
    Tab(
      text: "Location",
    )
  ];
  List<Tab> alternativetabs = [
    Tab(
      text: "Overview",
    ),
    Tab(
      text: "Images",
    ),
    Tab(
      text: "Location",
    )
  ];

  fetchimage() async {
    await FirebaseFirestore.instance
        .collection('Admin')
        .doc("Sales")
        .collection("Outgoing")
        .doc(widget.docsid)
        .get()
        .then((value) => image = value['image']);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Stack(
            children: [
              FutureBuilder(
                  future: fetchimage(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState != ConnectionState.done) {
                      return const Padding(
                        padding: EdgeInsets.fromLTRB(180, 100, 0, 0),
                        child: CircularProgressIndicator(
                          color: Colors.blueAccent,
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 400),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 210, 0, 0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(137, 0, 0, 0),
                              ),
                              width: double.infinity,
                              height: 40,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 2, left: 20),
                                      child: Text(
                                        "A Luxery house with Pool And Four Storage",
                                        style: GoogleFonts.roboto(
                                            fontSize: 15, color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          width: double.infinity,
                          height: 240,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(image ?? ""),
                                  fit: BoxFit.fill)),
                        ),
                      );
                    }
                  }),
              Padding(
                padding: const EdgeInsets.only(top: 250),
                child: Column(
                  children: [
                    TabBar(
                      labelStyle: GoogleFonts.lato(),
                      indicatorColor: Colors.blueAccent,
                      labelColor: Colors.blueAccent,
                      tabs: mainsalerid != currentuserid
                          ? mytabs
                          : alternativetabs,
                    ),
                    Expanded(
                      child: TabBarView(children: [
                        mydashone(
                          docid: widget.docsid,
                          salerid: mainsalerid,
                        ),
                        Detaildash2(
                          imagedocid: widget.docsid,
                        ),
                        mainsalerid != currentuserid
                            ? Mythirdflatpage(
                                docssid: widget.docsid, salerid: mainsalerid)
                            : Magellandash(
                                mapdoc: widget.docsid,
                              ),
                        Magellandash(
                          mapdoc: widget.docsid,
                        )
                      ]),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
