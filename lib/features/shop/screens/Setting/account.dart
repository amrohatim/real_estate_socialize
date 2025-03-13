import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:path/path.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccount();
}

class _MyAccount extends State<MyAccount> {
  var usernameconroller = TextEditingController();
  final countrycontroller = TextEditingController();
  final phonenumbercontroller = TextEditingController();

  final myauth = FirebaseAuth.instance.currentUser!.uid;
  String? myusername;
  String? mycountry;
  String? myphone;
  String? useruid;
  String? Pimage;
  fetchuser() async {
    final cuser = FirebaseAuth.instance.currentUser;
    if (cuser != null) {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(myauth)
          .get()
          .then((ds) {
        myusername = ds["username"];
        mycountry = ds['country'];
        myphone = ds['phone'];
        Pimage = ds['profile'];
      });
    }
  }

  File? changeprofile;
  selectimage() async {
    final ImagePicker _imagepick = ImagePicker();
    final XFile? image =
        await _imagepick.pickImage(source: ImageSource.gallery);
    changeprofile = File(image!.path);

    setState(() {});
  }

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: Text(
              "Account",
              style: GoogleFonts.notoSansAdlam(),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(children: [
                SizedBox(
                  height: 10,
                ),

                //////////// User Name ////////////////
                FutureBuilder(
                    future: fetchuser(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState != ConnectionState.done) {
                        return const CircularProgressIndicator(
                          color: Colors.blueAccent,
                          strokeWidth: 1,
                        );
                      }
                      return Form(
                        key: formkey,
                        child: Column(
                          children: [
                            Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 55, 20, 0),
                                child: Column(children: [
                                  Pimage != "empty"
                                      ? Stack(children: [
                                          Container(
                                              child: changeprofile == null
                                                  ? CircleAvatar(
                                                      backgroundImage:
                                                          NetworkImage(Pimage!),
                                                      radius: 55,
                                                    )
                                                  : CircleAvatar(
                                                      backgroundImage:
                                                          FileImage(File(
                                                              changeprofile!
                                                                  .path)),
                                                      backgroundColor:
                                                          Color.fromARGB(255,
                                                              234, 236, 236),
                                                      radius: 50,
                                                    )),
                                          Positioned(
                                            bottom: 0,
                                            right: 0,
                                            child: InkWell(
                                              onTap: selectimage,
                                              child: Container(
                                                  padding: EdgeInsets.all(9),
                                                  decoration: BoxDecoration(
                                                      color: Colors.blueAccent,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  30))),
                                                  child: Icon(
                                                    Icons.camera_alt_outlined,
                                                    color: Colors.white,
                                                    size: 15,
                                                  )),
                                            ),
                                          )
                                        ])
                                      : Stack(children: [
                                          Container(
                                              child: changeprofile == null
                                                  ? CircleAvatar(
                                                      child: Image.asset(
                                                          "assets/images/user.png"),
                                                      backgroundColor:
                                                          Color.fromARGB(255,
                                                              234, 236, 236),
                                                      radius: 50,
                                                    )
                                                  : CircleAvatar(
                                                      backgroundImage:
                                                          FileImage(File(
                                                              changeprofile!
                                                                  .path)),
                                                      backgroundColor:
                                                          Color.fromARGB(255,
                                                              234, 236, 236),
                                                      radius: 50,
                                                    )),
                                          Positioned(
                                            bottom: 0,
                                            right: 0,
                                            child: InkWell(
                                              onTap: selectimage,
                                              child: Container(
                                                  padding: EdgeInsets.all(9),
                                                  decoration: BoxDecoration(
                                                      color: Colors.blueAccent,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  30))),
                                                  child: Icon(
                                                    Icons.camera_alt_outlined,
                                                    color: Colors.white,
                                                    size: 15,
                                                  )),
                                            ),
                                          )
                                        ])
                                ])),

                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 1, 19, 10),
                              child: Text(
                                myusername ?? "John Doe",
                                style: GoogleFonts.mali(
                                    fontSize: 20, color: Color(0xff000000)),
                              ),
                            ),

                            SizedBox(height: 30),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: TextFormField(
                                  controller: usernameconroller,
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.blueAccent)),
                                      hintText: myusername ?? "User name",
                                      hintStyle: GoogleFonts.notoSansAdlam(
                                          color:
                                              Color.fromARGB(255, 54, 53, 53)),
                                      prefixIcon: Icon(
                                        color: Colors.blueAccent,
                                        Icons.person_outlined,
                                        size: 30,
                                      ))),
                            ),
                            SizedBox(height: 45),

                            //////////   Phone Number //////////////////

                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: IntlPhoneField(
                                controller: phonenumbercontroller,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blueAccent)),
                                    hintText: myphone ?? "Phone number",
                                    hintStyle: GoogleFonts.notoSansAdlam(
                                        color: Color.fromARGB(255, 54, 53, 53)),

                                    /* focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blueAccent))*/
                                    /*border:*/ /*OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blueAccent))*/

                                    prefixIcon: Icon(
                                      color: Colors.blueAccent,
                                      Icons.person_outlined,
                                      size: 30,
                                    )),
                                initialCountryCode: 'SD',
                                onChanged: (phone) {
                                  print(phone.completeNumber);
                                },
                              ),
                            ),

                            SizedBox(height: 25),

                            ///////// ////Your Country //////////////

                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: TextFormField(
                                  controller: countrycontroller,
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.blueAccent)),
                                      hintText: mycountry ?? "City",
                                      hintStyle: GoogleFonts.notoSansAdlam(
                                          color:
                                              Color.fromARGB(255, 54, 53, 53)),
                                      prefixIcon: Icon(
                                        color: Colors.blueAccent,
                                        Icons.location_city,
                                        size: 30,
                                      ))),
                            ),
                            SizedBox(
                              height: 60,
                            ),
                          ],
                        ),
                      );
                    }),

                SizedBox(
                  height: 30,
                ),

                ///////////////// I am here for //////////////////

                /////////////// Buy and Sale avatar ///////////////////

                SizedBox(
                  height: 70,
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(110, 0, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          style: TextButton.styleFrom(
                              fixedSize: Size(170, 50),
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          onPressed: () async {
                            final User myuser =
                                FirebaseAuth.instance.currentUser!;
                            useruid = myuser.uid;
                            usernameconroller.text.trim() == ""
                                ? null
                                : await FirebaseFirestore.instance
                                    .collection("Users")
                                    .doc(useruid)
                                    .update({
                                    'username': usernameconroller.text.trim()
                                  });
                            countrycontroller.text.trim() == ""
                                ? null
                                : await FirebaseFirestore.instance
                                    .collection("Users")
                                    .doc(useruid)
                                    .update({
                                    'country': countrycontroller.text.trim()
                                  });
                            phonenumbercontroller.text.trim() == ""
                                ? null
                                : await FirebaseFirestore.instance
                                    .collection("Users")
                                    .doc(useruid)
                                    .update({
                                    'phone': phonenumbercontroller.text.trim()
                                  });

                            if (changeprofile != null) {
                              firebase_storage.Reference? refss;
                              String? urls;
                              refss = firebase_storage.FirebaseStorage.instance
                                  .ref()
                                  .child(
                                      "/Mainimage/$useruid/${basename(changeprofile!.path)}");
                              await refss.putFile(changeprofile!);
                              urls = await refss.getDownloadURL();
                              await FirebaseFirestore.instance
                                  .collection("Users")
                                  .doc(useruid)
                                  .update({'profile': urls});
                            }

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MyAccount(),
                                ));
                          },
                          child: Text(
                            "Update",
                            style: GoogleFonts.notoSansAdlam(
                                fontSize: 20,
                                color: Color.fromARGB(255, 245, 243, 243)),
                          )),
                    ],
                  ),
                ),
                SizedBox(height: 20)
              ]),
            ],
          ),
        ));
  }
}
