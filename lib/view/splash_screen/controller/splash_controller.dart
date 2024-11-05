
import 'package:focal3/view/home_screen/view/home_screen.dart';
import 'package:get/get.dart';
import '../../bottom_navigation_bar/view/bottom_navigation_bar.dart';
class SplashController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    Future.delayed(Duration(seconds: 3), () {
     Get.off (()=>BottomNavigationBarScreen());
    });
  }
}
