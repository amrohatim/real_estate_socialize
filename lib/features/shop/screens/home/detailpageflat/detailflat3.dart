import 'dart:convert';
import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;
import 'package:googleapis_auth/auth_io.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/features/shop/screens/Chat_Room/chatservice.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:path/path.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

class Mythirdflatpage extends StatefulWidget {
  const Mythirdflatpage({super.key, this.docssid, this.salerid});
  final docssid;
  final salerid;
  @override
  State<Mythirdflatpage> createState() => _MyWidgetState(docssid, salerid);
}

class _MyWidgetState extends State<Mythirdflatpage> {
  chatservice _chatservice = chatservice();
  TextEditingController messagecontroller = TextEditingController();
  bool ismesempty = false;

  final docssid;
  final salerid;
  final String Senderid = FirebaseAuth.instance.currentUser!.uid;

  _MyWidgetState(this.docssid, this.salerid);
  String? salername;
  String? imagesaler;
  getsalername() async {
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(salerid)
        .get()
        .then((ds) {
      salername = ds["username"];
      imagesaler = ds["profile"];
    });
  }

  String? url;

  @override
  void initState() {
    super.initState();
    getAccessToken();
  }

  String? accessToken;
  Future<void> getAccessToken() async {
    try {
      final serviceAccountJson = await rootBundle.loadString(
          'assets/mageauth-320b1-firebase-adminsdk-oa699-e0709fee01.json');

      final accountCredentials = ServiceAccountCredentials.fromJson(
        json.decode(serviceAccountJson),
      );

      const scopes = ['https://www.googleapis.com/auth/firebase.messaging'];

      final client = http.Client();
      try {
        final accessCredentials =
            await obtainAccessCredentialsViaServiceAccount(
          accountCredentials,
          scopes,
          client,
        );

        setState(() {
          accessToken = accessCredentials.accessToken.data;
        });

        print('Access Token: $accessToken');
      } catch (e) {
        print('Error obtaining access token: $e');
      } finally {
        client.close();
      }
    } catch (e) {
      print('Error loading service account JSON: $e');
    }
  }

  List<XFile> _manyimages = [];
  final ImagePicker _imagepick = ImagePicker();
  firebase_storage.Reference? _ref;

  bool ismessagwsend = false;
  bool ismessagempty = true;
  File? _single;
  _selectimage() async {
    final ImagePicker imagepick = ImagePicker();
    final XFile? image = await imagepick.pickImage(source: ImageSource.gallery);
    _single = File(image!.path);
    ismessagwsend = true;
    setState(() {});
  }

  bool _ismessagempty = false;

  String senderid = FirebaseAuth.instance.currentUser!.uid;

  sendmessage() {
    _chatservice.sendmessage(salerid, messagecontroller.text);
    messagecontroller.clear();
  }

  String hint = "Write message ..";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.only(left: 10.w),
                width: double.infinity,
                height: 50.h,
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 0.1, color: Colors.blueAccent)),
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
                child: FutureBuilder(
                    future: getsalername(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return Row(
                          children: [
                            CircleAvatar(
                              backgroundColor:
                                  Color.fromARGB(255, 234, 236, 236),
                              radius: 23.sp,
                              backgroundImage: NetworkImage(imagesaler!),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(8.w, 6.h, 8.w, 8.h),
                                  child: Text(
                                    salername!,
                                    style: GoogleFonts.mali(
                                        color: Colors.black, fontSize: 16.sp),
                                  ),
                                )
                              ],
                            )
                          ],
                        );
                      } else {
                        return Text("Loading info ... ");
                      }
                    })),
            Container(
              width: double.infinity,
              height: 440.h,
              color: Color.fromARGB(117, 255, 255, 255),
              child: Column(
                children: [Expanded(child: buildmessage())],
              ),
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 5.h),
                  margin: EdgeInsets.only(left: 20.w, bottom: 7.h),
                  width: 300.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                      color: Color(0xffEFF6FC),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          _selectimage();
                        },
                        icon: Icon(Iconsax.gallery_add),
                      ),
                      ismessagwsend == false
                          ? Expanded(
                              child: Padding(
                                  padding: EdgeInsets.only(left: 8.w),
                                  child: TextFormField(
                                    controller: messagecontroller,
                                    onTap: () {
                                      hint = "";
                                      setState(() {});
                                    },
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: hint,
                                        hintStyle: GoogleFonts.roboto()),
                                  )))
                          : Container(
                              width: 40.w,
                              height: 40.h,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: FileImage(File(_single!.path)))),
                            )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10.w, bottom: 5.h),
                  height: 47.h,
                  width: 47.w,
                  decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: IconButton(
                      onPressed: () async {
                        ismessagwsend = false;
                        setState(() {});
                        if (_single != null) {
                          _ref = firebase_storage.FirebaseStorage.instance
                              .ref()
                              .child(
                                  "/messageimage/$Senderid/${basename(_single!.path)}");
                          await _ref!.putFile(_single!);
                          url = await _ref!.getDownloadURL();
                          _chatservice.sendmessage(salerid, url);
                          setState(() {
                            _single = null;
                          });
                        } else if (messagecontroller.text.isNotEmpty) {
                          _chatservice.sendmessage(
                              salerid, messagecontroller.text);

                          sendnotification(messagecontroller.text);
                          messagecontroller.clear();
                        } else {
                          return null;
                        }
                      },
                      icon: Icon(
                        size: 27.sp,
                        Icons.send,
                        color: Colors.white,
                      )),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildmessage() {
    return StreamBuilder(
        stream: _chatservice.getmessage(salerid, senderid),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("there is error");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(
              strokeWidth: 1,
              color: Colors.blueAccent,
            );
          }
          return ListView(
            reverse: true,
            children: snapshot.data!.docs
                .map((doc) => buildrealmessage(doc))
                .toList(),
          );
        });
  }

  Widget buildrealmessage(DocumentSnapshot doc) {
    Map<String, dynamic> messagedata = doc.data() as Map<String, dynamic>;
    bool currentuser = messagedata["Senderid"] == Senderid;
    var alignment = currentuser ? Alignment.centerRight : Alignment.centerLeft;
    var paddingmessage =
        currentuser ? EdgeInsets.only(left: 150) : EdgeInsets.only(right: 150);
    String strmes = messagedata["Message"].toString();
    int strlenght = strmes.length;
    return Padding(
        padding: paddingmessage,
        child: strlenght > 185
            ? Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                messagedata["Message"],
                              ),
                              fit: BoxFit.fill),
                          color: Colors.grey.shade300,
                          borderRadius:
                              BorderRadius.all(const Radius.circular(15))),
                      padding: EdgeInsets.all(100.sp),
                      child: InstaImageViewer(
                          child: Image.network(messagedata["Message"])),
                    ),
                    Padding(
                      padding: currentuser
                          ? EdgeInsets.only(right: 10.w)
                          : EdgeInsets.only(left: 10.w),
                      child: Row(
                        mainAxisAlignment: currentuser
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                        children: [
                          Text(
                            currentuser ? "Sent" : salername!,
                            style: TextStyle(
                                fontSize: 13.sp, color: Colors.grey.shade600),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            : Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w),
                child: Column(
                  crossAxisAlignment: currentuser
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: currentuser
                              ? Colors.blueAccent
                              : Color.fromARGB(255, 75, 73, 73),
                          borderRadius:
                              BorderRadius.all(const Radius.circular(12))),
                      padding: EdgeInsets.all(16.sp),
                      child: Text(
                        messagedata["Message"],
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: currentuser
                          ? EdgeInsets.only(right: 10.w)
                          : EdgeInsets.only(left: 10.w),
                      child: Row(
                        mainAxisAlignment: currentuser
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                        children: [
                          Text(
                            currentuser ? "Sent" : salername!,
                            style: TextStyle(
                                fontSize: 13.sp, color: Colors.grey.shade600),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ));
  }

  sendnotification(String msg) async {
    var headersList = {
      'Accept': '*/*',
      'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
      'Content-Type': 'application/json',
      'Authorization': "$accessToken"
    };
    var url = Uri.parse(
        'https://fcm.googleapis.com/v1/projects/mageauth-320b1/messages:send');

    var body = {
      "message": {
        "token": await FirebaseFirestore.instance
            .collection("Users")
            .doc(salerid)
            .get()
            .then((value) => value['token']),
        "notification": {
          "title": await FirebaseFirestore.instance
              .collection("Users")
              .doc(Senderid)
              .get()
              .then((value) => value['username']),
          "body": msg
        },
        "data": {"story_id": "story_12345"}
      }
    };

    var req = http.Request('POST', url);
    req.headers.addAll(headersList);
    req.body = json.encode(body);

    var res = await req.send();
    final resBody = await res.stream.bytesToString();

    if (res.statusCode >= 200 && res.statusCode < 300) {
      print(resBody);
    } else {
      print(res.reasonPhrase);
    }
  }
}
