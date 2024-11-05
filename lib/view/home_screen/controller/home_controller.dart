import 'package:get/get.dart';

import '../../../core/class/crud.dart';
import '../../../core/class/status_request.dart';

import '../../../core/servies/link.dart';
import '../../../model/category_model.dart';

import '../../../model/product_model.dart';

class HomeController extends GetxController {
  var selectedCategoryId; 
  StatusRequest statusRequest = StatusRequest.loading;
  bool isLoading = false;
  List<ProductModel> products = [];
  CategoryModel? categories;

  @override
  void onInit() {
    super.onInit();
    getCategories();
    getProduct();
  }

  void selectCategory(int? categoryId) {
    selectedCategoryId = categoryId;
    update();
  }

  List<ProductModel> get filteredProducts {
    if (selectedCategoryId == null) {
      return products; 
    } else {
      return products.where((product) => product.data.subCategory.category.id == selectedCategoryId).toList();
    }
  }

  Future<void> getCategories() async {
    isLoading = true;
    statusRequest = StatusRequest.loading;
    update();

    Crud crud = Crud();
    var response = await crud.getData(AppLink.categories, {
      'Accept': 'application/json',
      'Authorization': 'Bearer 1169|zTWJrqMuv6zljQi6NtvG90OcPGEaDo3pEtLMsUh1d1b94383'
    });

    response.fold(
      (failure) {
        isLoading = false;
        statusRequest = StatusRequest.failure;
        update();
      },
      (data) {
        isLoading = false;
        if (data != null && data is Map<String, dynamic> && data.containsKey('data')) {
          var jsonData = data['data'];
          if (jsonData != null && jsonData is List) {
            categories = CategoryModel.fromJson({"data": jsonData, "message": data["message"]});
          }
          statusRequest = StatusRequest.success;
        } else {
          statusRequest = StatusRequest.failure;
        }
        update();
      },
    );
  }

  Future<void> getProduct() async {
    isLoading = true;
    statusRequest = StatusRequest.loading;
    update();

    Crud crud = Crud();
    var response = await crud.getData(AppLink.products, {
      'Accept': 'application/json',
      'Authorization': 'Bearer 1169|zTWJrqMuv6zljQi6NtvG90OcPGEaDo3pEtLMsUh1d1b94383'
    });

    response.fold(
      (failure) {
        isLoading = false;
        statusRequest = StatusRequest.failure;
        update();
      },
      (data) {
        isLoading = false;
        if (data != null && data is Map<String, dynamic> && data.containsKey('data')) {
          var jsonData = data['data'];
          if (jsonData != null && jsonData is List) {
            products = jsonData.map((item) => ProductModel.fromJson({"data": item, "message": data["message"]})).toList();
          } else {
            products = [];
          }
          statusRequest = StatusRequest.success;
        } else {
          statusRequest = StatusRequest.failure;
          products = [];
        }
        update();
      },
    );
  }
}
