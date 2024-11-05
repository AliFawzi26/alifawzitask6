import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/const_data/app_color.dart';

Widget CustomTitle(String title) {
  return Column(children: [
    Text(
      title,
      style: TextStyle(
          fontSize: 16.sp,
          fontFamily: 'Poppins',
          color: AppColor.subTitleColor,
          fontWeight: FontWeight.w600),
    ),
    SizedBox(
      height: 10,
    )
  ]);
}
