import 'package:flutter/material.dart';
import 'package:focal3/model/product_model.dart';
import 'package:get/get.dart';
import '../view/details_screen/details_controller/details_controller.dart';

class FavoriteButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TShirtController>(
      init: TShirtController(),
      builder: (controller) {
        return Obx(() => CircleAvatar(
          backgroundColor: Colors.grey[200],
          radius: 24, // حجم الدائرة
          child: IconButton(

            icon: Icon(
              controller.isFavorite.value
                  ? Icons.favorite
                  : Icons.favorite_border,
              color:
              controller.isFavorite.value ? Colors.red : Colors.grey,
            ),
            onPressed: () {
              controller.toggleFavorite();

            },
          ),));},);}}
