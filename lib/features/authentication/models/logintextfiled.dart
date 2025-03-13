import 'package:flutter/material.dart';

class Mylogintextfiled extends StatelessWidget {
  const Mylogintextfiled(
      {super.key,
      required this.controller,
      required this.hinttext,
      required this.obscureText,
      required String? Function(dynamic value) validator,
      required Icon prefxicon});
  final String hinttext;
  final bool obscureText;
  final controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 25,
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            hintText: hinttext,
            hintStyle: TextStyle(color: Colors.grey[500]),
            fillColor: Colors.white,
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 206, 205, 205))),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
      ),
    );
  }
}
