import 'dart:convert';

import 'package:focal3/core/servies/my_services.dart';

import 'package:flutter/material.dart';
import 'package:focal3/view/splash_screen/view/splash_screen.dart';
import 'package:get/get.dart';

import '../../../core/class/crud.dart';
import '../../../core/class/status_request.dart';
import '../../../core/const_data/const_data.dart';
import '../../../core/servies/link.dart';

class DrawerControllerX extends GetxController {
  String selectedMenu = 'Profile';
  StatusRequest statusRequest = StatusRequest.loading;
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  Crud crud = Crud();

  String fcm_token = '';
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool obscureText = false;

  void updateSelectedMenu(String menu) {
    selectedMenu = menu;
    update();
  }

Logout() async {
  isLoading = true;
  statusRequest = StatusRequest.loading;
  update();

  var result = await crud.postData(
      AppLink.logout,
      {},
      {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${ConstData.token}'
      },
      );

  result.fold((left) async{
    isLoading = false;
    statusRequest = left;
    update();

    Get.snackbar('Success', 'Logout successful');
    if (statusRequest == StatusRequest.success) {
      await MyServices.shared.clear();
      Get.off(SplashScreen());
      update();
    }
  }, (right) {
    isLoading = false;
    var errorMessage = _parseErrors(right);
    Get.snackbar('Error', errorMessage);
    update();
  });
}


  String _parseErrors(String responseBody) {
    try {
      print('Server response: $responseBody');

      var decoded = json.decode(responseBody);

      var errorMessage = decoded['message'] ?? 'Unknown error occurred';

      if (decoded['errors'] != null) {
        var errors = decoded['errors'];
        errorMessage += '\n';
        errors.forEach((field, messages) {
          errorMessage += '${field.toUpperCase()}: ${messages.join(", ")}\n';
        });
      }

      return errorMessage.trim();
    } catch (e) {
      print('Error parsing server response: $e');

      return responseBody.isNotEmpty
          ? responseBody
          : 'Error: Invalid server response';
    }
  }
}
