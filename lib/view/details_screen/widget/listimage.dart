import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/const_data/app_image.dart';

class HorizontalImageScroll extends StatelessWidget {
  final List<String> imageUrls = [
'assets/png/img_12.png',
 'assets/png/img_13.png',
  'assets/png/img_14.png',
'assets/png/img_15.png',
'assets/png/img_16.png',
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(5, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: GestureDetector(
              onTap: () {
              //  Get.to(() => FavoritesPage());
              },
              child: Image.asset(
                imageUrls[index],
                height: 60,
                width: 60,
              ),
            ),
          );
        }),
      ),
    );
  }
}