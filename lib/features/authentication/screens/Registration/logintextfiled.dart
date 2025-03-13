import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Mylogintextfiled extends StatelessWidget {
  const Mylogintextfiled(
      {super.key,
      required this.prefxicon,
      required this.controller,
      required this.hinttext,
      required this.obscureText,
      this.validator,
      this.onchange});
  final String hinttext;
  final bool obscureText;
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  // ignore: prefer_typing_uninitialized_variables
  final prefxicon;
  final validator;
  final onchange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 25,
      ),
      child: TextFormField(
        onChanged: onchange,
        validator: validator,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueAccent)),
            hintText: hinttext,
            hintStyle: GoogleFonts.notoSansAdlam(),

            /* focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blueAccent))*/
            /*border:*/ /*OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blueAccent))*/

            prefixIcon: prefxicon),
      ),
    );
  }
}
