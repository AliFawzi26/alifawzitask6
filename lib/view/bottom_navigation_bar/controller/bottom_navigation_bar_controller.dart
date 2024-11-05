import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../core/const_data/app_image.dart';
import '../../favourite_screen/favourite/favourite_screen.dart';
import '../../home_screen/view/home_screen.dart';

import '../../profile_screen/view/profile_screen.dart';

class BottomNavigationBarController extends GetxController {
  int bottomNavIndex = 0;
  final List<String> imageList = [
    AppImage.home,
    AppImage.favorite,
    AppImage.notf_icon,
    AppImage.profile_icon,
  ];

  final List<Widget> screens = [
    HomeScreen(),
    FavoriteScreen(),
    Center(
      child: Text('notification'),
    ),
    ProfileScreen(),
  ];
  onTap(int index) {
    bottomNavIndex = index;
    update();
  }
}
