
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import '../../../core/const_data/app_color.dart';
import '../../../core/const_data/app_image.dart';
import '../../my cart_screen/my cart/mycart_screen.dart';
import '../controller/bottom_navigation_bar_controller.dart';

class  BottomNavigationBarScreen extends StatelessWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavigationBarController>(
      init: BottomNavigationBarController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColor.background_color,
          body: controller.screens[controller.bottomNavIndex],
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              onPressed: () {
             Get.to(CartPage());
              },
              backgroundColor: AppColor.primarycolor,
              child: SvgPicture.asset(AppImage.bag),
              shape: CircleBorder(),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
                color: AppColor.background_color,
                image: DecorationImage(
                  image: AssetImage(
                    'assets/s.png',
                  ),
                  fit: BoxFit.fill,
                )),
            height: 100,
            child: AnimatedBottomNavigationBar.builder(
              backgroundColor: AppColor.background_color,
              height: 10,
              itemCount:controller.imageList.length,
              tabBuilder: (int index, bool isActive) {
                final color = isActive ? AppColor.primarycolor : Colors.grey;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 35),
                  child: SvgPicture.asset(
                    height: 5.h,
                    width: 10,
                  controller.imageList[index],
                    fit: BoxFit.contain,
                    color: color,
                  ),
                );
              },
              activeIndex: controller.bottomNavIndex,
              gapLocation: GapLocation.center,
              notchSmoothness: NotchSmoothness.verySmoothEdge,
              onTap: (p0) {
                controller.onTap(p0);
              },
            ),
          ),
        );
      }
    );
  }
}


