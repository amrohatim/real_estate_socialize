import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Mychatlistcontainer extends StatelessWidget {
  const Mychatlistcontainer({
    super.key,
    required this.nametext,
    required this.ontap,
    this.widgets,
    required this.lastmessage,
    this.lastdate,
    this.givepic,
    this.onlongpress,
  });
  final String nametext;
  final lastmessage;
  final lastdate;
  final givepic;
  final onlongpress;

  final Function() ontap;
  final widgets;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      onLongPress: onlongpress,
      child: Container(
        width: 200,
        height: 70,
        margin: EdgeInsets.only(bottom: 5),
        padding: EdgeInsets.only(left: 5),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(offset: Offset(0.1, 0.1), color: Colors.blueAccent)
            ],
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Stack(
                children: [givepic, Container(child: widgets)],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18, top: 23),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nametext,
                      style: GoogleFonts.notoSansAdlam(
                          fontSize: 16, color: Colors.grey[750]),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 160,
                          child: lastmessage,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: 130,
                          child: lastdate,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
