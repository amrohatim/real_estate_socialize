import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String message;
  final String senderid;
  final String senderemail;
  final String receiverid;
  final Timestamp timestamp;
  Message(
      {required this.message,
      required this.senderid,
      required this.receiverid,
      required this.senderemail,
      required this.timestamp});
  Map<String, dynamic> toMap() {
    return {
      "Message": message,
      "Senderid": senderid,
      "Senderemail": senderemail,
      "Receiverid": receiverid,
      "Timestamp": timestamp
    };
  }
}
