
import 'package:focal3/core/servies/my_services.dart';
import 'package:focal3/main.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../model/product_model.dart';
class FavoriteController extends GetxController {
  List<ProductModel> favorites = [];
  @override
  void onInit() async {
    await loadFavorites();
    super.onInit();
  }
  Future<void> loadFavorites() async {
    favorites = await MyServices().getFavorites();
    update();
  }

  void addToFavorites(ProductModel product) {
    if (!isFavorite(product.data.id)) {
      favorites.add(product);
      MyServices().saveFavorites(favorites);
      update();
    }
  }

  void removeFromFavorites(ProductModel product) {
    favorites.removeWhere((p) => p.data.id == product.data.id);
    MyServices().saveFavorites(favorites);
    update();
  }

  bool isFavorite(int id) {
    return favorites.any((product) => product.data.id == id);
  }
}