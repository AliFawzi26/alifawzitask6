import 'package:flutter/material.dart';
import 'package:focal3/core/const_data/app_color.dart';
import 'package:focal3/widgets/app_bar_icon.dart';
import 'package:get/get.dart';
import '../../../widgets/product_card.dart';
import '../controller/favourite_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final favoriteController = Get.find<FavoriteController>();
    return Scaffold(
      backgroundColor: AppColor.background_color,
      appBar: AppBar(
        backgroundColor: AppColor.background_color,
        elevation: 0,
        leading: AppBarIcon(
          icon: Icon(Icons.arrow_back, size: 15, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },),
        centerTitle: true,
        title: Text(
          'Favourite',
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),),
      body:
      GetBuilder<FavoriteController>(
        builder: (controller) {
          if (controller.favorites.isEmpty) {
            return Center(child: Text("No favourites yet."));
          }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 250.h,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: controller.favorites.length,
              itemBuilder: (BuildContext context, int index) {
                var item = controller.favorites[index];
                return ProductCard(product: item,showAddIcon: false, );
              },
            ),
          );
        },
      ),
       );
  }
}