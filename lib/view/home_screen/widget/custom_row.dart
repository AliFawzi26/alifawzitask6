import 'package:flutter/material.dart';

import '../../../core/const_data/app_color.dart';

class CustomRow extends StatelessWidget {
  final bool isCAtegoryRow;
  final void Function()? onTap;
  const CustomRow({super.key, required this.isCAtegoryRow, this.onTap});

  @override
  Widget build(BuildContext context) {
    return   Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                          Text(
                         isCAtegoryRow? 'Select Category':'New Arrivals',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                          textDirection: TextDirection.ltr,
                        ),
                        InkWell(
                          onTap: onTap,
                          child: Text(
                            'See all',
                            style: TextStyle(
                              color: AppColor.primarycolor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      
                      ],
                    );
  }
}