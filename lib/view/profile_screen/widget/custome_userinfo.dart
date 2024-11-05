import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/const_data/app_color.dart';

Widget CustomUserInfo(String title) {
  return Column(children: [
    Container(
        width: double.infinity,
        height: 55.h,
        decoration: BoxDecoration(
            color: AppColor.background_color,
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins'),
            ))),
    SizedBox(
      height: 10,
    ),
  ]);
}
