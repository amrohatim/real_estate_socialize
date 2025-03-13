import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/authentication/screens/Registration/signup.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Contactus extends StatelessWidget {
  const Contactus({super.key});

  @override
  Widget build(BuildContext context) {
    text(givetxt, {color}) {
      return Text(
        givetxt,
        style: GoogleFonts.notoSansAdlam(color: color),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 64),
          child: Text(
            "Contact Us",
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
              height: 600,
              color: const Color.fromARGB(1, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Support",
                    style: GoogleFonts.lato(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
                  text(
                      "We do love to hear from you! Whether you have a question, feedback, or need assistance, our team is here to help."),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "General Inquiries",
                    style: GoogleFonts.lato(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  text(
                      "For general questions about the app, features, or anything else, please reach out to us at:"),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      text(
                        "Email: ",
                      ),
                      InkWell(
                        onTap: () {
                          launch("mailto:gogoh3296@gmail.com");
                        },
                        child: text(" gogoh3296@gmail.com",
                            color: Color.fromARGB(234, 59, 107, 180)),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      text(
                        "Phone: ",
                      ),
                      InkWell(
                        onTap: () {
                          launch("tel:+249125351867");
                        },
                        child: text(" +249125351867",
                            color: Color.fromARGB(234, 59, 107, 180)),
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "Technical Support",
                    style: GoogleFonts.lato(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
                  text(
                      "If you are experiencing issues with the app or need technical support, please contact our support team:"),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      text(
                        "Email: ",
                      ),
                      InkWell(
                        onTap: () {
                          launch("mailto:Shoraihomer@gmail.com");
                        },
                        child: text(" Shoraihomer@gmail.com",
                            color: Color.fromARGB(234, 59, 107, 180)),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      text(
                        "Phone: ",
                      ),
                      InkWell(
                        onTap: () {
                          launch("tel:+249121054504");
                        },
                        child: text(" +249121054504",
                            color: Color.fromARGB(234, 59, 107, 180)),
                      )
                    ],
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Feedback",
                    style: GoogleFonts.lato(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
                  text(
                      "We value your feedback and suggestions. Share your thoughts with us at:"),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      text(
                        "Email: ",
                      ),
                      InkWell(
                        onTap: () {
                          launch("mailto:Alinabil@gmail.com");
                        },
                        child: text(" Alinabil@gmail.com",
                            color: Color.fromARGB(234, 59, 107, 180)),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
