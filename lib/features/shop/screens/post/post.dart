import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/shop/screens/post/Flat.dart';
import 'package:flutter_application_2/features/shop/screens/post/Shop.dart';
import 'package:flutter_application_2/features/shop/screens/post/apartment.dart';
import 'package:flutter_application_2/features/shop/screens/post/villa.dart';
import 'package:flutter_application_2/utils/constants/MytopmainBar.dart';
import 'package:google_fonts/google_fonts.dart';

class MYPost extends StatefulWidget {
  MYPost({super.key, required this.index});

  int index;
  @override
  State<MYPost> createState() => _MYPostState(index);
}

PageController _controller = PageController();

class _MYPostState extends State<MYPost> {
  _MYPostState(this.index);
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Mytopmainbar(),
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: index == 0
                      ? 2660
                      : index == 1
                          ? 2760
                          : index == 2
                              ? 2400
                              : 2460,
                  color: const Color.fromARGB(255, 247, 246, 248),
                  child: PageView(
                    controller: _controller,
                    onPageChanged: (value) {
                      index = value;
                      setState(() {});
                    },
                    children: [MYFlat(), MyVilla(), MyApartment(), MyShop()],
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 35, 0, 0),
                          child: Text(
                              "Please select your buliding type to upload your post",
                              style: GoogleFonts.openSans(
                                  fontSize: 15, fontWeight: FontWeight.w500)),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 30, 0, 0),
                          child: GestureDetector(
                            onTap: () {
                              _controller.jumpToPage(0);
                            },
                            child: TextButton(
                              onPressed: null,
                              child: Text(
                                "House",
                                style: GoogleFonts.openSans(
                                    color: index == 0
                                        ? Colors.white
                                        : const Color(0xff252B5C),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                              style: TextButton.styleFrom(
                                  backgroundColor: index == 0
                                      ? Colors.blueAccent
                                      : const Color.fromARGB(
                                          255, 255, 255, 255),
                                  fixedSize: const Size.fromWidth(80)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                          child: GestureDetector(
                            onTap: () {
                              _controller.jumpToPage(1);
                            },
                            child: TextButton(
                              onPressed: null,
                              child: Text(
                                "Villa",
                                style: GoogleFonts.openSans(
                                    color: index == 1
                                        ? Colors.white
                                        : const Color(0xff252B5C),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                              style: TextButton.styleFrom(
                                  backgroundColor: index == 1
                                      ? Colors.blueAccent
                                      : const Color.fromARGB(
                                          255, 255, 255, 255),
                                  fixedSize: const Size.fromWidth(80)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: GestureDetector(
                            onTap: () {
                              _controller.jumpToPage(2);
                            },
                            child: TextButton(
                              onPressed: null,
                              child: Text(
                                "Apartment",
                                style: GoogleFonts.openSans(
                                    color: index == 2
                                        ? Colors.white
                                        : const Color(0xff252B5C),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                              style: TextButton.styleFrom(
                                  backgroundColor: index == 2
                                      ? Colors.blueAccent
                                      : const Color.fromARGB(
                                          255, 255, 255, 255),
                                  fixedSize: const Size.fromWidth(110)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: GestureDetector(
                            onTap: () {
                              _controller.jumpToPage(3);
                            },
                            child: TextButton(
                              onPressed: null,
                              child: Text(
                                "Shop",
                                style: GoogleFonts.openSans(
                                    color: index == 3
                                        ? Colors.white
                                        : const Color(0xff252B5C),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                              style: TextButton.styleFrom(
                                  backgroundColor: index == 3
                                      ? Colors.blueAccent
                                      : const Color.fromARGB(
                                          255, 255, 255, 255),
                                  fixedSize: const Size.fromWidth(80)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
