
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../../Core/class/status_request.dart';
import '../../../core/class/crud.dart';
import '../../../model/order.dart';
class OrderController extends GetxController {
  Crud crud = Crud();
  List<OrdersModel> orders = [];
  StatusRequest response = StatusRequest.none;
  bool loading = false;
  String? id;
  @override
  void onInit() {
    super.onInit();
    getOrders();
  }
  Future<void> getOrders() async {
    response = StatusRequest.loading;
    loading = true;
    update();
    var result = await crud.getData(
      'https://task.focal-x.com/api/orders',
      {
        'Authorization': 'Bearer 1169|zTWJrqMuv6zljQi6NtvG90OcPGEaDo3pEtLMsUh1d1b94383',
        'Accept': 'application/json',
      },
    );
    result.fold(
          (failure) {
        loading = false;
        response = StatusRequest.failure;
        Get.snackbar('Error', 'Failed to load orders');
        update();
      },
          (data) {
        loading = false;
        if (data != null && data is Map<String, dynamic> &&
            data.containsKey('data')) {
          List jsonData = data['data'];
          orders = jsonData.map((item) => OrdersModel.fromJson(item)).toList();
          response = StatusRequest.success;
        } else {
          orders = [];
          response = StatusRequest.failure;
          Get.snackbar('Error', 'Unexpected data format');
        }
        update();
      },
    );
  }
  Future<void> postOrder(String product_id,String quantity) async {
    response = StatusRequest.loading;
    loading = true;
    update();
    var result = await crud.postData(
      'https://task.focal-x.com/api/orders',
      {'product_id':product_id,
        'quantity': quantity,},
      {
        'Authorization': 'Bearer 1169|zTWJrqMuv6zljQi6NtvG90OcPGEaDo3pEtLMsUh1d1b94383',
        'Accept': 'application/json',
      },
    );
    result.fold(
          (failure) {
        loading = false;
        response = StatusRequest.failure;
        Get.snackbar('Error', 'Failed to add order');
        update();},
          (data) {
        loading = false;
        response = StatusRequest.success;
        getOrders();
        Get.snackbar('Success', 'Order added successfully');
        update();
      },
    );}
  Future<void> updateOrder(String product_id, int quantity) async {
    response = StatusRequest.loading;
    loading = true;
    update();
    var result = await crud.putData(
        'https://task.focal-x.com/api/orders/$id',
        {
          'product_id': product_id,
          'quantity': quantity,
        }, {
          'Authorization': 'Bearer 1169|zTWJrqMuv6zljQi6NtvG90OcPGEaDo3pEtLMsUh1d1b94383',
          'Accept': 'application/json',
        }
    );
    result.fold(
          (failure) {
        loading = false;
        response = StatusRequest.failure;
        Get.snackbar('Error', 'Failed to update order');
        update();},
          (data) {
        loading = false;
        response = StatusRequest.success;
        getOrders(); // استرجاع الطلبات بعد التحديث
        Get.snackbar('Success', 'Order updated successfully');
        update();
      },);}
  Future<void> deleteOrder(String id) async {
    var result = await crud.deleteData(
      'https://task.focal-x.com/api/orders/$id',
       {
        'Authorization': 'Bearer 1169|zTWJrqMuv6zljQi6NtvG90OcPGEaDo3pEtLMsUh1d1b94383',
        'Accept': 'application/json',},
    );
    result.fold(
          (failure) => Get.snackbar('Error', 'Failed to delete order'),
          (data) {
        getOrders();
        Get.snackbar('Success', 'Order deleted successfully');
      },);}
}


