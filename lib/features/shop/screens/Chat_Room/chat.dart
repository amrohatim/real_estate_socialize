import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/features/shop/screens/Chat_Room/Room.dart';
import 'package:flutter_application_2/features/shop/screens/Chat_Room/chatlist.dart';
import 'package:badges/badges.dart' as badges;

import 'package:flutter_application_2/utils/constants/MytopmainBar.dart';
import 'package:flutter_application_2/utils/constants/deletechatbottom.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});
  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> with WidgetsBindingObserver {
  gettokens() async {
    String? tokenupdate = await FirebaseMessaging.instance.getToken();
    FirebaseFirestore.instance
        .collection("Users")
        .doc(cuid)
        .update({'token': tokenupdate});
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    gettokens();
    super.initState();
  }

  String cuid = FirebaseAuth.instance.currentUser!.uid;

  void setStat(String status) async {
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(cuid)
        .update({"status": status});
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      setStat("Online");
    } else {
      setStat("Offline");
    }
  }

  List getchat = [];
  List blockuserlist = [];
  bool online = false;

  var uid = FirebaseAuth.instance.currentUser!.uid;

  getchats() async {
    var initialget = await FirebaseFirestore.instance
        .collection("Users")
        .doc(uid)
        .collection("ChatRoom")
        .get();

    getchat.addAll(initialget.docs);
  }

  String? checkimg;
  getpic(i) {
    FirebaseFirestore.instance.collection('Users').doc(i).snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Mytopmainbar(),
            FutureBuilder(
                future: getchats(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Container(
                      height: 550,
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: ListView.builder(
                          itemCount: getchat.length,
                          itemBuilder: (context, index) {
                            return Mychatlistcontainer(
                              onlongpress: () => showModalBottomSheet(
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (context) => Chatdelete(
                                        getdeletedchat: getchat[index]
                                            ["chatroom"],
                                      )),
                              givepic: buildprofile(index),
                              widgets: buildstreamer(
                                  getchat[index]["receiverid"] == uid
                                      ? getchat[index]["senderid"]
                                      : getchat[index]["receiverid"]),
                              ontap: () {
                                Navigator.push(
                                    context,
                                    (MaterialPageRoute(
                                        builder: (context) => Room(
                                              receivername: getchat[index]
                                                          ["senderid"] ==
                                                      uid
                                                  ? getchat[index]
                                                      ["receivername"]
                                                  : getchat[index]
                                                      ["sendername"],
                                              receiveruid: getchat[index]
                                                          ["receiverid"] ==
                                                      uid
                                                  ? getchat[index]["senderid"]
                                                  : getchat[index]
                                                      ["receiverid"],
                                            ))));
                              },
                              nametext: getchat[index]["senderid"] == uid
                                  ? getchat[index]["receivername"]
                                  : getchat[index]["sendername"],
                              lastmessage:
                                  getlastmessage(getchat[index]["chatroom"]),
                              lastdate:
                                  getlastdates(getchat[index]["chatroom"]),
                            );
                          }),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.only(top: 240),
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.blueAccent,
                      ),
                    );
                  }
                })
          ],
        ),
      ),
    );
  }

  Widget buildstreamer(uuid) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("Users")
            .doc(uuid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("error");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(
                color: Colors.blueAccent, strokeWidth: 1);
          }
          return Padding(
            padding: const EdgeInsets.only(top: 44, left: 44),
            child: badges.Badge(
              badgeStyle: badges.BadgeStyle(
                  padding: EdgeInsets.all(7),
                  badgeColor: snapshot!.data!['status'] == "Online"
                      ? const Color.fromARGB(255, 70, 201, 74)
                      : Colors.redAccent,
                  borderRadius: BorderRadius.circular(4)),
            ),
          );
        });
  }

  Widget getlastmessage(chatid) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("ChatRooms")
            .doc(chatid)
            .collection("Messages")
            .orderBy("Timestamp")
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("there is error");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading..");
          }
          return Container(
            width: 10,
            height: 20,
            child: SingleChildScrollView(
              child: ListBody(
                reverse: true,
                children: snapshot.data!.docs
                    .map((doc) => buildlastmsg(doc))
                    .toList(),
              ),
            ),
          );
        });
  }

  Widget getlastdates(chatid) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("ChatRooms")
            .doc(chatid)
            .collection("Messages")
            .orderBy("Timestamp")
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("there is error");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading..");
          }
          return Container(
            width: 10,
            height: 20,
            child: SingleChildScrollView(
              child: ListBody(
                reverse: true,
                children: snapshot.data!.docs
                    .map((doc) => buildlastdate(doc))
                    .toList(),
              ),
            ),
          );
        });
  }

  Widget buildlastmsg(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    bool currentuid = uid == data['Senderid'];

    return Text(
      currentuid ? "You:${data["Message"]}" : "${data['Message']}",
      style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: Colors.grey.shade700),
    );
  }

  Widget buildlastdate(DocumentSnapshot doc) {
    var numtomonth = {
      1: "Jun",
      2: "Feb",
      3: "Mar",
      4: "Apr",
      5: "May",
      6: "Jun",
      7: "Jul",
      8: "Aug",
      9: "Sep",
      10: "Oct",
      11: "Nov",
      12: "Dec"
    };
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    Timestamp t = data["Timestamp"] as Timestamp;
    DateTime date = t.toDate();

    return Text(
      "${"at ${date.hour}:${date.minute} on ${date.day} ${numtomonth[date.month]}"}",
      style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: Color.fromARGB(255, 105, 193, 252)),
    );
  }

  Widget buildprofile(i) {
    String userpro = getchat[i]["senderid"] == uid
        ? getchat[i]["receiverid"]
        : getchat[i]["senderid"];
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("Users")
            .doc(userpro)
            .snapshots(),
        builder: (context, snapshot) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(
              strokeWidth: 1,
              color: Colors.blueAccent,
            );
          }
          return data["profile"] != "empty"
              ? CircleAvatar(
                  backgroundImage: NetworkImage(data["profile"]),
                  backgroundColor: Color.fromARGB(255, 234, 236, 236),
                  radius: 30,
                )
              : CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 248, 246, 246),
                  radius: 30,
                  child: Image.asset("assets/images/user.png"));
        });
  }
}
