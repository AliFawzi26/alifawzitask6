
import 'package:get/get.dart';
import '../core/class/crud.dart';
import '../view/details_screen/details_controller/details_controller.dart';
import '../view/favourite_screen/controller/favourite_controller.dart';
class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
    Get.put(TShirtController());
    Get.put(FavoriteController());
  }
}