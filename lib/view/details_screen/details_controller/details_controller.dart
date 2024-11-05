
import 'package:get/get.dart';
import '../../../model/product_model.dart';
class TShirtController extends GetxController {
  var favoriteItems = <ProductModel>[].obs;
  final double price = 179.39;
  final String title = 'Programmer T-shirt';
  final String description = '''
  Programming And Software Engineering Are Your Passion? 
  Then This Is Made For You As A Developer. Perfect Surprise 
  For Any Programmer, Software Engineer, Developer, Coder, 
  Computer Nerd Out There ......
  ''';
  var isFavorite = false.obs;
  var isPressed = false.obs; //
  void toggleFavorite() {
    isFavorite.value = !isFavorite.value;
  }

  }
