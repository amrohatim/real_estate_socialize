import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:url_launcher/url_launcher.dart';

class Myfirstdetailpage extends StatefulWidget {
  Myfirstdetailpage({super.key, this.docid, required this.salerid});
  final docid;
  String salerid;

  @override
  State<Myfirstdetailpage> createState() =>
      _MyfirstdetailpageState(docid, salerid);
}

class _MyfirstdetailpageState extends State<Myfirstdetailpage> {
  String? price;
  String? space;
  String? bedrooms;
  String? bathrooms;
  String? kitchen;
  String? elavator;
  String? storage;
  String? storagespace;
  String? garage;
  String? backyard;
  String? basement;
  String? basemnetspace;
  String? pool;
  int? floor;
  String? numofaprt;
  String? monthrent;
  String? yearrent;
  String? country;
  String? state;
  String? city;
  String? floorlev;
  String? image;
  String? favcheck;
  String salerid;
  // ignore: prefer_typing_uninitialized_variables
  final docid;
  _MyfirstdetailpageState(this.docid, this.salerid);

  fetchuser() async {
    {
      await FirebaseFirestore.instance
          .collection('Sale')
          .doc(docid)
          .get()
          .then((ds) {
        image = ds["image"];
        country = ds["Country"];
        city = ds["City"];
        state = ds["State"];
        price = ds["Price"].toString();
        space = ds["Space"].toString();
        bedrooms = ds["BedRooms"].toString();
        bathrooms = ds["Bath"].toString();
        kitchen = ds["Kitchen"].toString();
        elavator = ds["Elevator"];
        storage = ds["Storage"];
        storagespace = ds["Storagemeter"];
        garage = ds["Garage"];
        backyard = ds["Backyard"];
        basement = ds["Basement"];
        basemnetspace = ds["asementmeter"];
        pool = ds["Pool"].toString();
        floor = ds["Floors"];
        numofaprt = ds["Numberofapartments"].toString();
        monthrent = ds["MonthlyRent"].toString();
        yearrent = ds["YearlyRent"];
        floorlev = ds["Floorlevel"];
      });
    }
  }

  String uid = FirebaseAuth.instance.currentUser!.uid;
  favchecker() async {
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(uid)
        .collection("favorutes")
        .doc(docid)
        .get()
        .then((value) {
      favcheck = value["Price"];
      fav = true;
    });
  }

  bool fav = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  offset: const Offset(4.0, 4.0),
                  color: Colors.grey.shade200,
                  blurRadius: 10,
                  spreadRadius: 1)
            ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.only(left: 5.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Properties",
                        style: GoogleFonts.mali(fontSize: 18.sp),
                      ),
                      FutureBuilder(
                          future: favchecker(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState !=
                                ConnectionState.done) {
                              return Padding(
                                padding: EdgeInsets.only(right: 20.w),
                                child: const CircularProgressIndicator(
                                  color: Colors.blueAccent,
                                  strokeWidth: 1,
                                ),
                              );
                            } else {
                              return Padding(
                                padding: EdgeInsets.only(right: 18.w),
                                child: Container(
                                    width: 40.w,
                                    height: 40.h,
                                    decoration: const BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        boxShadow: [
                                          BoxShadow(
                                              offset: Offset(0.4, 0.4),
                                              color: Colors.blueAccent)
                                        ],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    child: IconButton(
                                        onPressed: () async {
                                          if (fav == false) {
                                            fav = true;
                                            await FirebaseFirestore.instance
                                                .collection("Users")
                                                .doc(uid)
                                                .collection("favorutes")
                                                .doc(docid)
                                                .set({
                                              "Price": price,
                                              "Country": country,
                                              "State": state,
                                              "City": city,
                                              "image": image,
                                              "docid": docid,
                                              'Salerid': salerid
                                            });

                                            setState(() {});
                                          } else if (fav == true) {
                                            fav = false;
                                            setState(() {});
                                            await FirebaseFirestore.instance
                                                .collection("Users")
                                                .doc(uid)
                                                .collection("favorutes")
                                                .doc(docid)
                                                .delete();
                                          }
                                          setState(() {});
                                        },
                                        icon: Icon(
                                          Icons.favorite_rounded,
                                          size: 30.r,
                                          color: fav == true
                                              ? Colors.redAccent
                                              : const Color.fromARGB(
                                                  255, 194, 190, 190),
                                        ))),
                              );
                            }
                          }),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                FutureBuilder(
                    future: fetchuser(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState != ConnectionState.done) {
                        return Padding(
                          padding: EdgeInsets.only(left: 200.w),
                          child: const CircularProgressIndicator(
                            color: Colors.blueAccent,
                            strokeWidth: 1,
                          ),
                        );
                      } else {
                        return Padding(
                          padding: EdgeInsets.only(left: 15.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  yearrent != null && yearrent != "empty"
                                      ? Text(
                                          "YearlyRent :",
                                          style: GoogleFonts.mali(
                                              fontSize: 15.sp,
                                              color: const Color(0xff000000)),
                                        )
                                      : Text(
                                          "Price :",
                                          style: GoogleFonts.mali(
                                              fontSize: 15.sp,
                                              color: const Color(0xff000000)),
                                        ),
                                  const SizedBox(width: 10),
                                  Text(
                                    price ?? "",
                                    style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 47, 146, 51)),
                                  ),
                                  SizedBox(width: 10.w),
                                  Icon(
                                    Iconsax.dollar_square,
                                    size: 18.sp,
                                    color:
                                        const Color.fromARGB(255, 47, 146, 51),
                                  ),
                                ],
                              ),
                              SizedBox(
                                  height:
                                      monthrent != null && monthrent != "empty"
                                          ? 7.h
                                          : 0.h),
                              monthrent != null && monthrent != "empty"
                                  ? Text(
                                      "Monthly Rent : ${monthrent} dollar",
                                      style: GoogleFonts.mali(
                                          fontSize: 15.sp,
                                          color: const Color(0xff000000)),
                                    )
                                  : const SizedBox.shrink(),
                              SizedBox(
                                height: 7.h,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Space :",
                                    style: GoogleFonts.mali(
                                        fontSize: 15.sp,
                                        color: const Color(0xff000000)),
                                  ),
                                  SizedBox(width: 10.w),
                                  Text(space ?? ""),
                                  SizedBox(width: 5.w),
                                  Text(
                                    "m",
                                    style: GoogleFonts.mali(
                                        fontSize: 15.sp,
                                        color: const Color(0xff000000)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 7.h,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "BedRooms :",
                                    style: GoogleFonts.mali(
                                        fontSize: 15.sp,
                                        color: const Color(0xff000000)),
                                  ),
                                  SizedBox(width: 10.w),
                                  Text(bedrooms ?? ''),
                                  SizedBox(width: 10.w),
                                  Text(
                                    "room",
                                    style: GoogleFonts.mali(
                                        fontSize: 15.sp,
                                        color: const Color(0xff000000)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 7.h,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "BathRooms :",
                                    style: GoogleFonts.mali(
                                        fontSize: 15.sp,
                                        color: const Color(0xff000000)),
                                  ),
                                  SizedBox(width: 10.w),
                                  Text(bathrooms.toString() ?? ""),
                                  SizedBox(width: 10.w),
                                  Text(
                                    "room",
                                    style: GoogleFonts.mali(
                                        fontSize: 15.sp,
                                        color: const Color(0xff000000)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 7.h,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Kitchen :",
                                    style: GoogleFonts.mali(
                                        fontSize: 15.sp,
                                        color: const Color(0xff000000)),
                                  ),
                                  SizedBox(width: 10.w),
                                  Text(kitchen.toString() ?? ""),
                                  SizedBox(width: 10.w),
                                  Text(
                                    "kitchen",
                                    style: GoogleFonts.mali(
                                        fontSize: 15.sp,
                                        color: const Color(0xff000000)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                  height: elavator != null && elavator != ""
                                      ? 7.h
                                      : 0.h),
                              elavator != null
                                  ? Row(
                                      children: [
                                        Text(
                                          "Elvator :",
                                          style: GoogleFonts.mali(
                                              fontSize: 15.sp,
                                              color: const Color(0xff000000)),
                                        ),
                                        SizedBox(width: 10.w),
                                        Row(
                                          children: [
                                            Text(elavator.toString() ?? ""),
                                            SizedBox(width: 10.w),
                                            Text(
                                              "elevator",
                                              style: GoogleFonts.mali(
                                                  fontSize: 15.sp,
                                                  color:
                                                      const Color(0xff000000)),
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  : const SizedBox.shrink(),
                              SizedBox(
                                  height: storage != null && storage != ""
                                      ? 7.h
                                      : 0.h),
                              storage != null && storage != ""
                                  ? Row(
                                      children: [
                                        Text(
                                          "Storage :",
                                          style: GoogleFonts.mali(
                                              fontSize: 15.sp,
                                              color: const Color(0xff000000)),
                                        ),
                                        SizedBox(width: 10.w),
                                        Row(
                                          children: [
                                            Text(storage.toString() ?? ""),
                                            SizedBox(width: 10.w),
                                            Text(
                                              "storage",
                                              style: GoogleFonts.mali(
                                                  fontSize: 15.sp,
                                                  color:
                                                      const Color(0xff000000)),
                                            ),
                                            SizedBox(width: 10.w),
                                            Text(
                                              ", space per one :",
                                              style: GoogleFonts.mali(
                                                  fontSize: 15.sp,
                                                  color:
                                                      const Color(0xff000000)),
                                            ),
                                            SizedBox(width: 5.w),
                                            Text(storagespace ?? "")
                                          ],
                                        )
                                      ],
                                    )
                                  : const SizedBox.shrink(),
                              SizedBox(
                                  height: garage != null && garage != ""
                                      ? 7.h
                                      : 0.h),
                              garage != null
                                  ? Row(
                                      children: [
                                        Text(
                                          "Garage :",
                                          style: GoogleFonts.mali(
                                              fontSize: 15.sp,
                                              color: const Color(0xff000000)),
                                        ),
                                        SizedBox(width: 10.w),
                                        Row(
                                          children: [
                                            Text(garage.toString() ?? ""),
                                            SizedBox(width: 10.w),
                                            Text(
                                              "garage",
                                              style: GoogleFonts.mali(
                                                  fontSize: 15.sp,
                                                  color:
                                                      const Color(0xff000000)),
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  : const SizedBox.shrink(),
                              SizedBox(
                                  height: backyard != null && backyard != ""
                                      ? 7.h
                                      : 0.h),
                              backyard != null && backyard != ""
                                  ? Row(
                                      children: [
                                        Text(
                                          "Backyard :",
                                          style: GoogleFonts.mali(
                                              fontSize: 15.sp,
                                              color: const Color(0xff000000)),
                                        ),
                                        SizedBox(width: 10.w),
                                        Row(
                                          children: [
                                            Text(backyard ?? ""),
                                            SizedBox(width: 10.w),
                                            Text(
                                              "meter",
                                              style: GoogleFonts.mali(
                                                  fontSize: 15.sp,
                                                  color:
                                                      const Color(0xff000000)),
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  : const SizedBox.shrink(),
                              SizedBox(
                                  height: basement != null && basement != ""
                                      ? 7.h
                                      : 0.h),
                              basement != null && basement != ""
                                  ? Row(
                                      children: [
                                        Text(
                                          "Basement :",
                                          style: GoogleFonts.mali(
                                              fontSize: 15.sp,
                                              color: const Color(0xff000000)),
                                        ),
                                        SizedBox(width: 10.w),
                                        Row(
                                          children: [
                                            Text(basement.toString() ?? ""),
                                            SizedBox(width: 10.w),
                                            Text(
                                              "basement",
                                              style: GoogleFonts.mali(
                                                  fontSize: 15.sp,
                                                  color:
                                                      const Color(0xff000000)),
                                            ),
                                            SizedBox(width: 5.w),
                                            Text(
                                              ", space per one :",
                                              style: GoogleFonts.mali(
                                                  fontSize: 15.sp,
                                                  color:
                                                      const Color(0xff000000)),
                                            ),
                                            Text(basemnetspace ?? "")
                                          ],
                                        )
                                      ],
                                    )
                                  : const SizedBox.shrink(),
                              SizedBox(
                                  height:
                                      pool != null && pool != "" ? 7.h : 0.h),
                              pool != null && pool != ""
                                  ? Text(
                                      "Pool: ${pool} m",
                                      style: GoogleFonts.mali(
                                          fontSize: 15.sp,
                                          color: const Color(0xff000000)),
                                    )
                                  : const SizedBox.shrink(),
                              SizedBox(height: floor != null ? 7.h : 0.h),
                              floor != null
                                  ? Text(
                                      "Floor number: ${floor.toString()} ${floor! > 1 ? "floors" : "floor"}",
                                      style: GoogleFonts.mali(
                                          fontSize: 15.sp,
                                          color: const Color(0xff000000)),
                                    )
                                  : const SizedBox.shrink(),
                              SizedBox(
                                  height: numofaprt != null && numofaprt != ""
                                      ? 7.h
                                      : 0.h),
                              numofaprt != null && numofaprt != ""
                                  ? Text(
                                      "Number of apartments : ${numofaprt} apartment",
                                      style: GoogleFonts.mali(
                                          fontSize: 15.sp,
                                          color: const Color(0xff000000)),
                                    )
                                  : const SizedBox.shrink(),
                              SizedBox(
                                  height: floorlev != null && floorlev != ""
                                      ? 7.h
                                      : 0.h),
                              floorlev != null && floorlev != ""
                                  ? Text(
                                      "Apartment at : ${floorlev}",
                                      style: GoogleFonts.mali(
                                          fontSize: 15.sp,
                                          color: const Color(0xff000000)),
                                    )
                                  : const SizedBox.shrink(),
                              SizedBox(
                                height: 1.h,
                              )
                            ],
                          ),
                        );
                      }
                    }),
              ],
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  offset: const Offset(4.0, 4.0),
                  color: Colors.grey.shade200,
                  blurRadius: 10,
                  spreadRadius: 1)
            ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12.h),
                Padding(
                  padding: EdgeInsets.only(left: 5.w),
                  child: Text(
                    "Description",
                    style: GoogleFonts.mali(fontSize: 18.sp),
                  ),
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: const Text(
                    "This charming house blends classic elegance with modern comfort, making it a perfect haven for any family. The exterior features a welcoming facade with a combination of brick and siding, complemented by a cozy front porch with room for a couple of rocking chairs. Large, well-maintained windows allow natural light to flood the interior, while a neatly manicured lawn and flower beds enhance the home's curb appeal",
                  ),
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
          SizedBox(height: 3.h),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  offset: const Offset(4.0, 4.0),
                  color: Colors.grey.shade200,
                  blurRadius: 10,
                  spreadRadius: 1)
            ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12.h),
                Padding(
                  padding: EdgeInsets.only(left: 5.w),
                  child: Text(
                    "Owner info",
                    style: GoogleFonts.mali(fontSize: 18.sp),
                  ),
                ),
                SizedBox(height: 10.h),
                ownerinfo(sid: salerid)
              ],
            ),
          )
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class ownerinfo extends StatefulWidget {
  ownerinfo({super.key, required this.sid});

  String sid;

  @override
  State<ownerinfo> createState() => _ownerinfoState(sid);
}

class _ownerinfoState extends State<ownerinfo> {
  String? salername;
  String? saleremail;
  String? salercity;
  String? salernum;
  String? salerimg;
  String sid;
  _ownerinfoState(this.sid);
  getownerinfo() async {
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(sid)
        .get()
        .then((value) {
      salername = value["username"];
      saleremail = value["email"];
      salercity = value["country"];
      salernum = value["phone"];
      salerimg = value["profile"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getownerinfo(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(
                color: Colors.blueAccent, strokeWidth: 1);
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              salerimg != "empty"
                  ? CircleAvatar(
                      backgroundImage: NetworkImage(salerimg!),
                      backgroundColor: const Color.fromARGB(255, 234, 236, 236),
                      radius: 50.sp,
                    )
                  : CircleAvatar(
                      child: Image.asset("assets/images/user.png"),
                      backgroundColor: const Color.fromARGB(255, 234, 236, 236),
                      radius: 50.sp,
                    ),
              SizedBox(height: 15.h),
              Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "UserName : $salername",
                      style: GoogleFonts.mali(
                          fontSize: 15.sp, color: const Color(0xff000000)),
                    ),
                    SizedBox(height: 7.h),
                    Row(
                      children: [
                        Text(
                          "Phone Number : ",
                          style: GoogleFonts.mali(
                              fontSize: 15.sp, color: const Color(0xff000000)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 4.h),
                          child: InkWell(
                              onTap: () async {
                                launch("tel:0$salernum");
                              },
                              child: Text(
                                salernum ?? "",
                                style: GoogleFonts.notoSansAdlam(
                                    color: Colors.blueAccent),
                              )),
                        )
                      ],
                    ),
                    SizedBox(height: 7.h),
                    Text(
                      "E-Mail : $saleremail",
                      style: GoogleFonts.mali(
                          fontSize: 15.sp, color: const Color(0xff000000)),
                    ),
                    SizedBox(height: 7.h),
                    Text(
                      "City : $salercity",
                      style: GoogleFonts.mali(
                          fontSize: 15.sp, color: const Color(0xff000000)),
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ],
          );
        });
  }
}
