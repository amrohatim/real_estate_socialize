import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Mytopcities extends StatelessWidget {
  Mytopcities({super.key, required this.cityname, required this.cityimage});
  final String cityname;
  final String cityimage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(6.sp),
          child: Container(
            width: 140.w,
            height: 180.h,
            decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Color(0xfff5f5f3),
                      blurRadius: 10,
                      offset: Offset(0, 3))
                ],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                color: Color(0xffF5F4F8)),
            child: Column(
              children: [
                Container(
                  width: 140.w,
                  height: 140.h,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    image: DecorationImage(
                        image: AssetImage(cityimage), fit: BoxFit.fill),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  cityname,
                  style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[800]),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
