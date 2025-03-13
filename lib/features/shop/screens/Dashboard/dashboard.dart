import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/features/authentication/screens/Registration/registration.dart';
import 'package:flutter_application_2/features/shop/screens/Dashboard/dashboardblockpost.dart';
import 'package:flutter_application_2/features/shop/screens/Dashboard/outgoing.dart';
import 'package:flutter_application_2/features/shop/screens/Dashboard/reports.dart';
import 'package:flutter_application_2/features/shop/screens/Dashboard/userdash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class Adminpanel extends StatefulWidget {
  const Adminpanel({super.key, this.outgoing});
  final outgoing;

  @override
  State<Adminpanel> createState() => _AdminpanelState(outgoing);
}

class _AdminpanelState extends State<Adminpanel> {
  String? outgoing;
  _AdminpanelState(this.outgoing);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(188, 0, 0, 0),
          foregroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Text(
              "Admin Panel",
              style: GoogleFonts.notoSansAdlam(),
            ),
          ),
        ),
        drawer: Padding(
          padding: const EdgeInsets.only(top: 90, right: 200),
          child: Drawer(
            backgroundColor: const Color.fromARGB(188, 0, 0, 0),
            child: Column(
              children: [
                const SizedBox(height: 40),
                InkWell(
                  onTap: () {
                    outgoing = "user";
                    setState(() {});
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.deepPurpleAccent,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                    child: Text("Users",
                        style: GoogleFonts.notoSansAdlam(color: Colors.white)),
                  ),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    outgoing = "outgoing";
                    setState(() {});
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.deepPurpleAccent,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    child: Text("Ougoing Posts",
                        style: GoogleFonts.notoSansAdlam(color: Colors.white)),
                  ),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    outgoing = "Blocked";
                    setState(() {});
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.deepPurpleAccent,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    child: Text("Blocked Posts",
                        style: GoogleFonts.notoSansAdlam(color: Colors.white)),
                  ),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    outgoing = "reports";
                    setState(() {});
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.deepPurpleAccent,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    child: Text(
                      "Reports",
                      style: GoogleFonts.notoSansAdlam(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 350),
                InkWell(
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyregPage()));
                  },
                  child: const Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Iconsax.logout,
                        color: Colors.white,
                        size: 40,
                      ),
                      Text(
                        "Logout",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        body: outgoing == "outgoing"
            ? Outgoing()
            : outgoing == "Blocked"
                ? Blocked()
                : outgoing == "user"
                    ? Userdash()
                    : Report());
  }
}
