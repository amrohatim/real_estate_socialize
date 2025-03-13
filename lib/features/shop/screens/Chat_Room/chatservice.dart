import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_2/features/shop/screens/Chat_Room/message.dart';

class chatservice {
  Future<void> sendmessage(String receiverid, message) async {
    final String currentuseremail = FirebaseAuth.instance.currentUser!.email!;
    final String senderid = FirebaseAuth.instance.currentUser!.uid;
    final Timestamp timestamp = Timestamp.now();

    Message newmessage = Message(
      message: message,
      senderid: senderid,
      receiverid: receiverid,
      senderemail: currentuseremail,
      timestamp: timestamp,
    );
    List<String> ids = [senderid, receiverid];
    ids.sort();
    String chatroomid = ids.join("_");
    await FirebaseFirestore.instance
        .collection("ChatRooms")
        .doc(chatroomid)
        .collection("Messages")
        .add(newmessage.toMap());

    await FirebaseFirestore.instance
        .collection("Users")
        .doc(senderid)
        .collection("ChatRoom")
        .doc(chatroomid)
        .set({
          "chatroom": chatroomid,
          "receiverid": receiverid,
          "senderid": senderid,
          "sendername": await FirebaseFirestore.instance
              .collection('Users')
              .doc(senderid)
              .get()
              .then((ds) {
                return ds["username"];
              }),
          "receivername": await FirebaseFirestore.instance
              .collection('Users')
              .doc(receiverid)
              .get()
              .then((ds) {
                return ds["username"];
              }),
        });
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(receiverid)
        .collection("ChatRoom")
        .doc(chatroomid)
        .set({
          "chatroom": chatroomid,
          "receiverid": receiverid,
          "senderid": senderid,
          "sendername": await FirebaseFirestore.instance
              .collection('Users')
              .doc(senderid)
              .get()
              .then((ds) {
                return ds["username"];
              }),
          "receivername": await FirebaseFirestore.instance
              .collection('Users')
              .doc(receiverid)
              .get()
              .then((ds) {
                return ds["username"];
              }),
        });
  }

  Stream<QuerySnapshot> getmessage(userid, otherid) {
    List<String> id = [userid, otherid];
    id.sort();
    String chatroomids = id.join("_");
    return FirebaseFirestore.instance
        .collection("ChatRooms")
        .doc(chatroomids)
        .collection("Messages")
        .orderBy("Timestamp", descending: true)
        .snapshots();
  }
}
