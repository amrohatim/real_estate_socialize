// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter_application_2/features/shop/screens/Chat_Room/accesstoken.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/services.dart' show rootBundle;
// import 'package:googleapis_auth/auth_io.dart';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_application_2/features/shop/screens/Chat_Room/chatservice.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// import 'package:insta_image_viewer/insta_image_viewer.dart';
// import 'package:path/path.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:image_picker/image_picker.dart';

// class Room extends StatefulWidget {
//   const Room({
//     super.key,
//     this.receiveruid,
//     this.receivername,
//   });
//   final receiveruid;
//   final receivername;

//   @override
//   State<Room> createState() => _RoomState(receiveruid, receivername);
// }

// class _RoomState extends State<Room> {
//   final receiveruid;
//   final receivername;
//   final String Senderid = FirebaseAuth.instance.currentUser!.uid;
//   _RoomState(this.receiveruid, this.receivername);
//   chatservice _chatservice = chatservice();
//   TextEditingController _messagecontroller = TextEditingController();
//   String? url;
//   firebase_storage.Reference? _ref;

//   File? _single;

//   _selectimage() async {
//     final ImagePicker imagepick = ImagePicker();
//     final XFile? image = await imagepick.pickImage(source: ImageSource.gallery);
//     _single = File(image!.path);
//     ismessagwsend = true;
//     setState(() {});
//   }

//   String? receprofile;
//   getrecimage() async {
//     await FirebaseFirestore.instance
//         .collection("Users")
//         .doc(receiveruid)
//         .get()
//         .then((value) {
//       receprofile = value["profile"];
//     });
//   }

//   bool ismessagwsend = false;
//   bool ismessagempty = true;
//   String hint = "Write message ..";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Row(
//             children: [
//               FutureBuilder(
//                   future: getrecimage(),
//                   builder: (context, snaoshot) {
//                     if (snaoshot.connectionState == ConnectionState.waiting) {
//                       return CircularProgressIndicator(
//                           color: Colors.blueAccent, strokeWidth: 1);
//                     }
//                     return CircleAvatar(
//                       radius: 25,
//                       backgroundImage: NetworkImage(receprofile!),
//                     );
//                   }),
//               Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(8, 0, 8, 15),
//                     child: Text(
//                       receivername,
//                       style:
//                           GoogleFonts.mali(color: Colors.white, fontSize: 18),
//                     ),
//                   )
//                 ],
//               )
//             ],
//           ),
//           backgroundColor: Colors.blueAccent,
//           foregroundColor: Colors.white,
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 width: double.infinity,
//                 height: 675,
//                 color: Color.fromARGB(117, 255, 255, 255),
//                 child: Column(
//                   children: [Expanded(child: buildmessage())],
//                 ),
//               ),
//               Row(
//                 children: [
//                   Container(
//                     padding: EdgeInsets.only(left: 5),
//                     margin: EdgeInsets.only(left: 20, bottom: 7),
//                     width: 300,
//                     height: 50,
//                     decoration: BoxDecoration(
//                         color: Color(0xffEFF6FC),
//                         borderRadius: BorderRadius.all(Radius.circular(10))),
//                     child: Row(
//                       children: [
//                         IconButton(
//                           onPressed: () {
//                             _selectimage();
//                           },
//                           icon: Icon(Iconsax.gallery_add),
//                         ),
//                         ismessagwsend == false
//                             ? Expanded(
//                                 child: Padding(
//                                     padding: const EdgeInsets.only(left: 8),
//                                     child: TextFormField(
//                                       controller: _messagecontroller,
//                                       onTap: () {
//                                         hint = "";
//                                         setState(() {});
//                                       },
//                                       decoration: InputDecoration(
//                                           border: InputBorder.none,
//                                           hintText: hint,
//                                           hintStyle: GoogleFonts.roboto()),
//                                     )))
//                             : Container(
//                                 width: 40,
//                                 height: 40,
//                                 decoration: BoxDecoration(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(10)),
//                                     image: DecorationImage(
//                                         fit: BoxFit.fill,
//                                         image: FileImage(File(_single!.path)))),
//                               )
//                       ],
//                     ),
//                   ),
//                   Container(
//                     margin: EdgeInsets.only(left: 10, bottom: 5),
//                     height: 47,
//                     width: 47,
//                     decoration: BoxDecoration(
//                         color: Colors.blueAccent,
//                         borderRadius: BorderRadius.all(Radius.circular(10))),
//                     child: IconButton(
//                         onPressed: () async {
//                           ismessagwsend = false;
//                           setState(() {});
//                           if (_single != null) {
//                             _ref = firebase_storage.FirebaseStorage.instance
//                                 .ref()
//                                 .child(
//                                     "/messageimage/$Senderid/${basename(_single!.path)}");
//                             await _ref!.putFile(_single!);
//                             url = await _ref!.getDownloadURL();
//                             _chatservice.sendmessage(receiveruid, url);
//                             setState(() {
//                               _single = null;
//                             });
//                           } else if (_messagecontroller.text.isNotEmpty) {
//                             _chatservice.sendmessage(
//                                 receiveruid, _messagecontroller.text);

//                             sendnotification(_messagecontroller.text);
//                             _messagecontroller.clear();
//                           } else {
//                             return null;
//                           }
//                         },
//                         icon: Icon(
//                           size: 27,
//                           Icons.send,
//                           color: Colors.white,
//                         )),
//                   )
//                 ],
//               )
//             ],
//           ),
//         ));
//   }

//   Widget buildmessage() {
//     return StreamBuilder(
//         stream: _chatservice.getmessage(receiveruid, Senderid),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return Text("there is error");
//           }
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Text("Loading..");
//           }
//           return ListView(
//             reverse: true,
//             children: snapshot.data!.docs
//                 .map((doc) => buildrealmessage(doc))
//                 .toList(),
//           );
//         });
//   }

//   Widget buildrealmessage(DocumentSnapshot doc) {
//     Map<String, dynamic> messagedata = doc.data() as Map<String, dynamic>;
//     bool currentuser = messagedata["Senderid"] == Senderid;
//     var alignment = currentuser ? Alignment.centerRight : Alignment.centerLeft;
//     var paddingmessage =
//         currentuser ? EdgeInsets.only(left: 150) : EdgeInsets.only(right: 150);
//     String strmes = messagedata["Message"].toString();
//     int strlenght = strmes.length;
//     return Padding(
//         padding: paddingmessage,
//         child: strlenght > 185
//             ? Padding(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
//                 child: Column(
//                   children: [
//                     Container(
//                       decoration: BoxDecoration(
//                           image: DecorationImage(
//                               image: NetworkImage(
//                                 messagedata["Message"],
//                               ),
//                               fit: BoxFit.fill),
//                           color: Colors.grey.shade300,
//                           borderRadius:
//                               BorderRadius.all(const Radius.circular(15))),
//                       padding: const EdgeInsets.all(100),
//                       child: InstaImageViewer(
//                           child: Image.network(messagedata["Message"])),
//                     ),
//                     Padding(
//                       padding: currentuser
//                           ? const EdgeInsets.only(right: 10)
//                           : const EdgeInsets.only(left: 10),
//                       child: Row(
//                         mainAxisAlignment: currentuser
//                             ? MainAxisAlignment.end
//                             : MainAxisAlignment.start,
//                         children: [
//                           Text(
//                             currentuser ? "Sent" : receivername,
//                             style: TextStyle(
//                                 fontSize: 13, color: Colors.grey.shade600),
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               )
//             : Padding(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
//                 child: Column(
//                   crossAxisAlignment: currentuser
//                       ? CrossAxisAlignment.end
//                       : CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       decoration: BoxDecoration(
//                           color: currentuser
//                               ? Colors.blueAccent
//                               : Color.fromARGB(255, 75, 73, 73),
//                           borderRadius:
//                               BorderRadius.all(const Radius.circular(12))),
//                       padding: const EdgeInsets.all(16),
//                       child: Text(
//                         messagedata["Message"],
//                         style: const TextStyle(color: Colors.white),
//                       ),
//                     ),
//                     Padding(
//                       padding: currentuser
//                           ? const EdgeInsets.only(right: 10)
//                           : const EdgeInsets.only(left: 10),
//                       child: Row(
//                         mainAxisAlignment: currentuser
//                             ? MainAxisAlignment.end
//                             : MainAxisAlignment.start,
//                         children: [
//                           Text(
//                             currentuser ? "Sent" : receivername,
//                             style: TextStyle(
//                                 fontSize: 13, color: Colors.grey.shade600),
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ));
//   }

//   sendnotification(String msg) async {
//     var accesstoken;
//     String firebasemesgscope =
//         "https://www.googleapis.com/auth/firebasemessaging";

//     // final client = await clientViaServiceAccount(
//     //     ServiceAccountCredentials.fromJson({
//     //       "type": "service_account",
//     //       "project_id": "mageauth-320b1",
//     //       "private_key_id": "7a21114fe7b97790a8f83d95fb6a56780f67da2f",
//     //       "private_key":
//     //           "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDJp3ulJjO0QbLh\nCEI1f+42obr1PW9ak/LV2PSRORPVJowm5DuJsi7UDhv6V9KkL2UexRWtQNLm0/JW\nGlXfdjankHSXtGe+Zg+v9s2JUaFbAubvnOaqK8nb8HI45NtnUjDhKPzAefx4WfmC\nJDCAxiahMTabPSXaI0vdZPTecjKMoFf2oRibjMK6psGtR6FUcZ97WBD98X4L7VoE\niGxG70zlJI1kCWo8xGS/XH5KwRJG7Y62M7LJV88Joeau8p1IvMdFNmlrLWt7K6xD\np2JaiJfJL5K0WEUEJqk7SBCLJ5Wp/TQ7zOC6c55RqYN51lfP9SoSAQ8XJeztouwf\nHXYLnfj7AgMBAAECggEACTB3K3r2rzexOZ0BO2PljJrJJMTUbrnAPquA1Z9Wvodf\nqqQK7IbwqFwuPTXEVRQN1R2hE8CY+8jbyb2wfRrrea5VCdbARYZsH5YtHp1YL4gN\n0wyA3G9bZwjpg5s2PlqZ/KC8B99nOGrNOneAuFWPTBgsh119fJfQLLodiIeGsy7E\nqdMEsaY7KpEpfxymgOagpr2C7OCgdj9tOmh/JQQZ1da2esnnuEZ0gyosI6kj40Hn\n0QKDLswwGlFlmm2py59k47VxJ+fqyqDT6mab/NFjkbwyg2t+PH8KkDeDgCRi9e40\nEnvCEk4RwYghlLS3udnARSb3OW5obI8kp1hcF2uoIQKBgQDsnhiewlMtpuSiVtUa\nsiTu5xBjN3bDq0vLie6LtDGtUqt12WXOr5ZRYo3yFqViJMnnys6FJlHTnzfDqsqp\nizd2mtK1++gdQ2KCdZyE4IHzMrhKrdIp0xE9Ynmd2pW26eMCZZIp4oJcmnn02fVH\nJeNHB71bDt1WbIpap0bGRxijmwKBgQDaLDNl8oS7HGNE0PhdyNGtrRTrPtMTR2V4\nNMN9RD5t0UITbUpJoabfPCzFDLI/2aN+5V3gKb3xmbBN+fm6+EPTHwZSU/aDRi0m\nnRg/M+AfMsB20WubCuo2uMiksYW7aC7wPugpfMSie9XBuiBf3Oc7NeAQvxFwqYG6\nL4iPIKXGIQKBgQCZhfJ/f6Isaq7JzgEy8wcXowB0/5WlW00wYOxP5LietpbdPhLa\nSf8ECygCPUNNLIV8SZA5wCUzY4jxAa3A171CzS2OOkXeRsxxzRGi/XATdYMxoRpN\nXM9AvtYd36doKNTLx09QsdDXeLtMbObCJQkUGyd3H2vpGT+jlglLuPF5pQKBgQCq\ncrfhIPyDtmTzwZMYqijuV/es5lM/j5r9s7M67ZMcdsz5onvUVL+rTjbn58hmy+DI\n5edWlyX3WAv+j5qEcSuECIwGy+QeoTfrH/ZuglfJ5/unmGtKINfk0q6mxK5nQLjT\nJ0J4DysMilTw2joqysm4X5njW3MDotpgHHzC3U3GIQKBgFaEnNOG2abgci17Jds+\n4wKpLuFSfr3vzEFPjgBZQPIaUhiMZzIYMzBZCfzWiGyejSTKJ/fJe9hUQt/1WR3f\ngfI9z66s+UYXd0448Pn19f9pk4woIx3gXE1cjYFSAkoZdrV7YzV2C8SbTM9dcb3C\nLiTaw2XU0nhBFuyPpiJXq2MR\n-----END PRIVATE KEY-----\n",
//     //       "client_email":
//     //           "firebase-adminsdk-oa699@mageauth-320b1.iam.gserviceaccount.com",
//     //       "client_id": "105888779084850957465",
//     //       "auth_uri": "https://accounts.google.com/o/oauth2/auth",
//     //       "token_uri": "https://oauth2.googleapis.com/token",
//     //       "auth_provider_x509_cert_url":
//     //           "https://www.googleapis.com/oauth2/v1/certs",
//     //       "client_x509_cert_url":
//     //           "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-oa699%40mageauth-320b1.iam.gserviceaccount.com",
//     //       "universe_domain": "googleapis.com"
//     //     }),
//         [firebasemesgscope]);
//     accesstoken = client.credentials.accessToken.data;
//     print(accesstoken);
//     var headersList = {
//       'Accept': '*/*',
//       'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
//       'Content-Type': 'application/json',
//       'Authorization': "Bearer $accesstoken"
//     };
//     var url = Uri.parse(
//         'https://fcm.googleapis.com/v1/projects/mageauth-320b1/messages:send');

//     var body = {
//       "message": {
//         "token": await FirebaseFirestore.instance
//             .collection("Users")
//             .doc(receiveruid)
//             .get()
//             .then((value) => value['token']),
//         "notification": {
//           "title": await FirebaseFirestore.instance
//               .collection("Users")
//               .doc(Senderid)
//               .get()
//               .then((value) => value['username']),
//           "body": msg
//         },
//         "data": {"story_id": "story_12345"}
//       }
//     };

//     var req = http.Request('POST', url);
//     req.headers.addAll(headersList);
//     req.body = json.encode(body);

//     var res = await req.send();
//     final resBody = await res.stream.bytesToString();

//     if (res.statusCode >= 200 && res.statusCode < 300) {
//       print(resBody);
//     } else {
//       print(res.reasonPhrase);
//     }
//   }
// }
