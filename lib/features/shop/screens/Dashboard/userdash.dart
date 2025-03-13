import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class Userdash extends StatefulWidget {
  const Userdash({super.key});

  @override
  State<Userdash> createState() => _UserdashState();
}

class _UserdashState extends State<Userdash> {
  String email = FirebaseAuth.instance.currentUser!.email!;
  String uid = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(166, 0, 0, 0),
      child: Padding(
        padding: const EdgeInsets.only(top: 8, left: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 45,
                  backgroundImage:
                      AssetImage("assets/images/software-engineer.png"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Uid: ${uid.characters.skip(18)}",
                        style: GoogleFonts.lato(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Email: ${email}",
                        style: GoogleFonts.lato(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 51, 171, 240),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Icon(
                              Iconsax.user,
                              color: Colors.white,
                            ),
                            SizedBox(width: 5),
                            Text(
                              "Users",
                              style: GoogleFonts.lato(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
