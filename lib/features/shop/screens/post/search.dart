import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/shop/screens/home/detailpageflat/detailpageflat.dart';
import 'package:flutter_application_2/features/shop/screens/home/mynearhouse.dart';
import 'package:flutter_application_2/utils/constants/MytopmainBar.dart';
import 'package:google_fonts/google_fonts.dart';

class Search extends StatefulWidget {
  const Search({super.key, required this.comefrom});
  final comefrom;
  @override
  State<Search> createState() => _SearchState(comefrom);
}

class _SearchState extends State<Search> {
  final comefrom;
  _SearchState(this.comefrom);

  List<QueryDocumentSnapshot> myvillalist = [];
  getdata() async {
    final QuerySnapshot getflat = await FirebaseFirestore.instance
        .collection('Sale')
        .where("City", isEqualTo: "$comefrom")
        .get();

    myvillalist.addAll(getflat.docs);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 86),
          child: Text(
            "Search",
            style: GoogleFonts.notoSansAdlam(),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
                future: getdata(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return const Padding(
                      padding: EdgeInsets.only(top: 250, left: 180),
                      child: CircularProgressIndicator(
                        color: Colors.blueAccent,
                        strokeWidth: 1,
                      ),
                    );
                  } else {
                    return myvillalist.isNotEmpty
                        ? Container(
                            height: 750,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: myvillalist.length,
                              itemBuilder: (context, i) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: ((context) => MyDetailFlat(
                                                  mainsalerid: myvillalist[i]
                                                      ['Salerid'],
                                                  docsid: myvillalist[i].id,
                                                ))));
                                  },
                                  child: Nearhouseprime(
                                    postname: myvillalist[i]['Postname'],
                                    price: myvillalist[i]['YearlyRent'] ==
                                            "empty"
                                        ? Text(
                                            '\$' " " +
                                                myvillalist[i]['Price']
                                                    .toString(),
                                            style: GoogleFonts.mali(
                                                fontSize: 19,
                                                color: Color.fromARGB(
                                                    255, 81, 190, 163),
                                                fontWeight: FontWeight.w400),
                                          )
                                        : Text(
                                            '\$' " " +
                                                "Yearly${myvillalist[i]['Price'].toString()}/Monthly${myvillalist[i]['MonthlyRent'].toString()}",
                                            style: GoogleFonts.mali(
                                                fontSize: 12,
                                                color: Color.fromARGB(
                                                    255, 81, 190, 163),
                                                fontWeight: FontWeight.w400),
                                          ),
                                    rate: myvillalist[i]['Tag'] == "Flat"
                                        ? "House"
                                        : myvillalist[i]['Tag'],
                                    country: myvillalist[i]['Country'],
                                    state: myvillalist[i]['State'],
                                    city: myvillalist[i]['City'],
                                    bedroom:
                                        myvillalist[i]['BedRooms'].toString(),
                                    space: myvillalist[i]['Space'].toString(),
                                    myimage: myvillalist[i]['image'],
                                  ),
                                );
                              },
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(top: 250, left: 100),
                            child: Column(
                              children: [
                                Text(
                                  "No Search results",
                                  style: GoogleFonts.openSans(
                                      fontSize: 24, color: Colors.grey[600]),
                                ),
                                Text(
                                  "Or City not found",
                                  style: GoogleFonts.openSans(
                                      fontSize: 24, color: Colors.grey[600]),
                                ),
                              ],
                            ),
                          );
                  }
                })
          ],
        ),
      ),
    );
  }
}
