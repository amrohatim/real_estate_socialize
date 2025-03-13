import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/shop/screens/Dashboard/dashboard.dart';
import 'package:flutter_application_2/features/shop/screens/Dashboard/detaildash.dart';
import 'package:flutter_application_2/features/shop/screens/home/detailpageflat/detailpageflat.dart';
import 'package:google_fonts/google_fonts.dart';

class Outgoing extends StatefulWidget {
  const Outgoing({super.key});

  @override
  State<Outgoing> createState() => _OutgoingState();
}

class _OutgoingState extends State<Outgoing> {
  List<QueryDocumentSnapshot> myoutgoinglist = [];
  getdata() async {
    final QuerySnapshot getflat = await FirebaseFirestore.instance
        .collection('Admin')
        .doc("Sales")
        .collection("Outgoing")
        .get();

    myoutgoinglist.addAll(getflat.docs);
  }

  String email = FirebaseAuth.instance.currentUser!.email!;
  String uid = FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: const Color.fromARGB(166, 0, 0, 0),
          child: Padding(
            padding: const EdgeInsets.only(top: 8, left: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 45,
                      backgroundImage:
                          AssetImage("assets/images/software-engineer.png"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Uid: ${uid.characters.skip(18)}",
                            style: GoogleFonts.lato(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Email: ${email}",
                            style: GoogleFonts.lato(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 142, 91, 231),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.cloud_upload_rounded,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "Outgoing Posts",
                                  style: GoogleFonts.lato(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          color: const Color.fromARGB(160, 0, 0, 0),
          child: FutureBuilder(
            future: getdata(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text("Error");
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                  width: double.infinity,
                  height: 600,
                  padding: EdgeInsets.all(200),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: const CircularProgressIndicator(
                      color: Colors.blueAccent,
                      strokeWidth: 1,
                    ),
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  padding: const EdgeInsets.only(right: 140),
                  height: 608,
                  child: ListView.builder(
                      itemCount: myoutgoinglist.length,
                      itemBuilder: ((context, index) {
                        return Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(136, 39, 38, 38),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            width: 300,
                            height: 230,
                            margin: EdgeInsets.only(bottom: 10, top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    margin: EdgeInsets.only(top: 5, bottom: 5),
                                    width: 230,
                                    height: 130,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(
                                                myoutgoinglist[index]
                                                    ["image"])))),
                                Text(myoutgoinglist[index]["Postname"],
                                    style: GoogleFonts.openSans(
                                        fontSize: 11,
                                        color: const Color.fromARGB(
                                            206, 255, 255, 255))),
                                SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        Text(myoutgoinglist[index]["Country"],
                                            style: GoogleFonts.openSans(
                                                fontSize: 11,
                                                color: const Color.fromARGB(
                                                    206, 255, 255, 255))),
                                        Text(
                                            ".${myoutgoinglist[index]["State"]}",
                                            style: GoogleFonts.openSans(
                                                fontSize: 11,
                                                color: const Color.fromARGB(
                                                    206, 255, 255, 255))),
                                        Text(
                                          ".${myoutgoinglist[index]["City"]}",
                                          style: GoogleFonts.openSans(
                                              fontSize: 11,
                                              color: const Color.fromARGB(
                                                  206, 255, 255, 255)),
                                        )
                                      ],
                                    )),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  Mydetaildash(
                                                docsid:
                                                    myoutgoinglist[index].id,
                                                mainsalerid:
                                                    myoutgoinglist[index]
                                                        ["Salerid"],
                                              ),
                                            ));
                                      },
                                      child: Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: const BoxDecoration(
                                              color: Colors.blueAccent,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8))),
                                          child: Text(
                                            "Review",
                                            style: GoogleFonts.lato(
                                                color: Colors.white),
                                          )),
                                    ),
                                    const SizedBox(width: 10),
                                    InkWell(
                                      onTap: () async {
                                        List<QueryDocumentSnapshot> imgelist =
                                            [];
                                        DocumentSnapshot ref =
                                            await FirebaseFirestore.instance
                                                .collection('Admin')
                                                .doc("Sales")
                                                .collection("Outgoing")
                                                .doc(myoutgoinglist[index].id)
                                                .get();
                                        //////// add to block////////
                                        Map<String, dynamic> data =
                                            ref.data() as Map<String, dynamic>;

                                        await FirebaseFirestore.instance
                                            .collection("Admin")
                                            .doc("Sales")
                                            .collection("Blocked")
                                            .doc(myoutgoinglist[index].id)
                                            .set(data);
                                        ///////////add images to block//////////
                                        QuerySnapshot refs =
                                            await FirebaseFirestore.instance
                                                .collection('Admin')
                                                .doc("Sales")
                                                .collection("Outgoing")
                                                .doc(myoutgoinglist[index].id)
                                                .collection("imagelist")
                                                .get();
                                        imgelist.addAll(refs.docs);

                                        for (var i = 0;
                                            i <= imgelist.length;
                                            i++) {
                                          Map<String, dynamic> images =
                                              imgelist[i].data()
                                                  as Map<String, dynamic>;
                                          await FirebaseFirestore.instance
                                              .collection("Admin")
                                              .doc("Sales")
                                              .collection("Blocked")
                                              .doc(myoutgoinglist[index].id)
                                              .collection("imagelist")
                                              .doc(imgelist[i].id)
                                              .set(images)
                                              .whenComplete(() async {
                                            await FirebaseFirestore.instance
                                                .collection('Admin')
                                                .doc("Sales")
                                                .collection("Outgoing")
                                                .doc(myoutgoinglist[index].id)
                                                .delete();
                                            for (var i = 0;
                                                i <= imgelist.length;
                                                i++) {
                                              await FirebaseFirestore.instance
                                                  .collection('Admin')
                                                  .doc("Sales")
                                                  .collection("Outgoing")
                                                  .doc(myoutgoinglist[index].id)
                                                  .collection("imagelist")
                                                  .doc(imgelist[i].id)
                                                  .delete();
                                            }
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Adminpanel(
                                                          outgoing: "outgoing",
                                                        )));
                                          });
                                        }
                                        //////////delete from outgoing//////
                                      },
                                      child: Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: const BoxDecoration(
                                              color: Colors.redAccent,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8))),
                                          child: Text(
                                            "Block",
                                            style: GoogleFonts.lato(
                                                color: Colors.white),
                                          )),
                                    ),
                                    const SizedBox(width: 10),
                                    InkWell(
                                      onTap: () async {
                                        List<QueryDocumentSnapshot> imgelist =
                                            [];
                                        DocumentSnapshot ref =
                                            await FirebaseFirestore.instance
                                                .collection('Admin')
                                                .doc("Sales")
                                                .collection("Outgoing")
                                                .doc(myoutgoinglist[index].id)
                                                .get();
                                        QuerySnapshot refs =
                                            await FirebaseFirestore.instance
                                                .collection('Admin')
                                                .doc("Sales")
                                                .collection("Outgoing")
                                                .doc(myoutgoinglist[index].id)
                                                .collection("imagelist")
                                                .get();
                                        imgelist.addAll(refs.docs);
                                        Map<String, dynamic> data =
                                            ref.data() as Map<String, dynamic>;
                                        await FirebaseFirestore.instance
                                            .collection("Sale")
                                            .doc(myoutgoinglist[index].id)
                                            .set(data);
                                        for (var i = 0;
                                            i <= imgelist.length;
                                            i++) {
                                          Map<String, dynamic> images =
                                              imgelist[i].data()
                                                  as Map<String, dynamic>;
                                          await FirebaseFirestore.instance
                                              .collection("Sale")
                                              .doc(myoutgoinglist[index].id)
                                              .collection("imagelist")
                                              .doc(imgelist[i].id)
                                              .set(images)
                                              .whenComplete(() async {
                                            for (var i = 0;
                                                i < imgelist.length;
                                                i++) {
                                              await FirebaseFirestore.instance
                                                  .collection('Admin')
                                                  .doc("Sales")
                                                  .collection("Outgoing")
                                                  .doc(myoutgoinglist[index].id)
                                                  .collection("imagelist")
                                                  .doc(imgelist[i].id)
                                                  .delete();
                                            }
                                            await FirebaseFirestore.instance
                                                .collection('Admin')
                                                .doc("Sales")
                                                .collection("Outgoing")
                                                .doc(myoutgoinglist[index].id)
                                                .delete();

                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Adminpanel(
                                                          outgoing: "outgoing",
                                                        )));
                                          });
                                        }
                                      },
                                      child: Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: const BoxDecoration(
                                              color: Color.fromARGB(
                                                  218, 60, 248, 157),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8))),
                                          child: Text(
                                            "Accept",
                                            style: GoogleFonts.lato(
                                                color: Colors.white),
                                          )),
                                    ),
                                  ],
                                ),
                              ],
                            ));
                      })),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
