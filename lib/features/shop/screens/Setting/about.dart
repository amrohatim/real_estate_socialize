import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/authentication/screens/Registration/signup.dart';
import 'package:google_fonts/google_fonts.dart';

class Aboutus extends StatelessWidget {
  const Aboutus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 75),
          child: Text(
            "About Us",
            style: GoogleFonts.notoSansAdlam(),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20, top: 40),
              width: 350,
              height: 1135,
              color: const Color.fromARGB(1, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome to Magellan",
                    style: GoogleFonts.lato(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Real estate application where finding your dream home is made simple and efficient.                           we are dedicated to transforming the real estate market (traditional and electronic) to another level where the process of buying , selling and renting the real estate is more simple , transparent and fast.",
                    style: GoogleFonts.openSans(),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                      "Our journey began with a simple idea : to create an advanced app for the clients to remove the stress , complexity and uncertainty from the real estate process by providing a user friendly app that connects you with best listing houses and make selling your properity more easier and accessible to wide number of people."),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "What make us different from other apps",
                    style: GoogleFonts.lato(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "First of all why choosing us rather than the other apps ? , to address this question properly we built this app in a very socialized way by providing to both parties of real estate process a direct chatroom which enable them to communicate privately and without any intrruption along side with other features like google map location API.",
                    style: GoogleFonts.openSans(),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Our Vision",
                    style: GoogleFonts.lato(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "We aim to make a huge impact in the real estate market, nowadays since  a large number of real estate apps have been released , usually owned by a particular agency.",
                    style: GoogleFonts.openSans(),
                  ),
                  Text(
                    "Our vision is to help the users and save their time from been wasted in  the previously mentioned apps because they make the real estate process more complicated and delayed.                                              To resolve this problem we purpose more features and tools to our app in the near future.",
                    style: GoogleFonts.openSans(),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Afterwards",
                    style: GoogleFonts.lato(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "What are you waiting for , create an account now",
                    style: GoogleFonts.openSans(),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Mysignup()));
                    },
                    child: Text(
                      "and become a member of Magellan community",
                      style: GoogleFonts.openSans(color: Colors.blueAccent),
                    ),
                  ),
                  Text(
                    "where finding your dream home comes easier wherever you are.",
                    style: GoogleFonts.openSans(),
                  ),
                  const SizedBox(
                    height: 140,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 79),
                    child: Text(
                      "All rights reserved to Magellan",
                      style: GoogleFonts.lato(fontSize: 12),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 90, top: 5),
                    child: Text(
                      "Issued on 5 September 2024",
                      style: GoogleFonts.lato(fontSize: 11),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
