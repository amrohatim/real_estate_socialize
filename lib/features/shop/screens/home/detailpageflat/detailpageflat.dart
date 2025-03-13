import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/shop/screens/home/detailpageflat/detail1flat.dart';
import 'package:flutter_application_2/features/shop/screens/home/detailpageflat/detail2.dart';
import 'package:flutter_application_2/features/shop/screens/home/detailpageflat/detailflat3.dart';
import 'package:flutter_application_2/features/shop/screens/home/detailpageflat/detailpageflat4.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDetailFlat extends StatefulWidget {
  MyDetailFlat({super.key, this.docsid, required this.mainsalerid});
  final docsid;
  String mainsalerid;
  @override
  State<MyDetailFlat> createState() => _MyDetailFlatState(mainsalerid);
}

class _MyDetailFlatState extends State<MyDetailFlat> {
  final currentuserid = FirebaseAuth.instance.currentUser!.uid;
  String mainsalerid;
  _MyDetailFlatState(this.mainsalerid);
  String? image;
  String? postname;

  List<Tab> mytabs = [
    Tab(
      text: "overview",
    ),
    Tab(
      text: "images",
    ),
    Tab(
      text: "chatroom",
    ),
    Tab(
      text: "location",
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
        .collection('Sale')
        .doc(widget.docsid)
        .get()
        .then((value) {
      image = value['image'];
      postname = value["Postname"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: Stack(
          children: [
            FutureBuilder(
                future: fetchimage(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return Padding(
                      padding: EdgeInsets.fromLTRB(180.w, 100.h, 0, 0),
                      child: CircularProgressIndicator(
                          color: Colors.blueAccent, strokeWidth: 1),
                    );
                  } else {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 400.h),
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.only(top: 210.h),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(176, 16, 83, 138),
                            ),
                            width: double.infinity,
                            height: 40.h,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 2.h, left: 20.w),
                                    child: Text(
                                      postname!,
                                      style: GoogleFonts.breeSerif(
                                          fontSize: 16.sp,
                                          color: Color.fromARGB(
                                              255, 248, 247, 247)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        width: double.infinity,
                        height: 240.h,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(image ?? ""),
                                fit: BoxFit.fill)),
                      ),
                    );
                  }
                }),
            Padding(
              padding: EdgeInsets.only(top: 250.h),
              child: Column(
                children: [
                  TabBar(
                    labelStyle: GoogleFonts.roboto(),
                    indicatorColor: Colors.blueAccent,
                    labelColor: Colors.blueAccent,
                    tabs:
                        mainsalerid != currentuserid ? mytabs : alternativetabs,
                  ),
                  Expanded(
                    child: TabBarView(children: [
                      Myfirstdetailpage(
                        docid: widget.docsid,
                        salerid: mainsalerid,
                      ),
                      MYseconddetail(
                        imagedocid: widget.docsid,
                      ),
                      mainsalerid != currentuserid
                          ? Mythirdflatpage(
                              docssid: widget.docsid, salerid: mainsalerid)
                          : Magellanmap(
                              mapdoc: widget.docsid,
                            ),
                      Magellanmap(
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
    );
  }
}
