import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/const_data/app_color.dart';
import '../controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: AppColor.back_ground_black,
            body: Center(
              child: Text('Hello....',style: TextStyle(
                  color: AppColor.background_color,
                  fontSize: 25,
                  fontWeight: FontWeight.w600
                ),),
            )
          ),
        );
      }
    );
  }
}