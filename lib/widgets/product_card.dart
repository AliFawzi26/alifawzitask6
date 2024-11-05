import 'package:focal3/core/const_data/app_color.dart';
import 'package:focal3/core/const_data/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../core/const_data/responsive.dart';
import '../model/product_model.dart';
import '../view/details_screen/details/details_screen.dart';
import '../view/favourite_screen/controller/favourite_controller.dart';
class ProductCard extends StatelessWidget {
  final ProductModel product;
  final bool showAddIcon;
  final void Function()? onTap;
  const ProductCard({
    Key? key,
    required this.product,
    this.showAddIcon = true,
    this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(DetailsPage(productModel: product)),
      child: Container(
        width: Responsive(context).screenWidth * 0.45,
        height: 250.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GetBuilder<FavoriteController>(
                    init: FavoriteController(),
                    builder: (controller) {
                      return IconButton(
                        onPressed: () {
                          controller.isFavorite(product.data.id)
                              ? controller.removeFromFavorites(product)
                              : controller.addToFavorites(product);
                        },
                        icon: Icon(
                          controller.isFavorite(product.data.id)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: controller.isFavorite(product.data.id)
                              ? Colors.red
                              : Colors.grey,
                        ),
                      );},),
                  Image.asset(
                    AppImage.t_shirt2,
                    height: Responsive(context).screenWidth * 0.25,
                    width: Responsive(context).screenWidth * 0.25,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                'Best Seller',
                style: TextStyle(
                  color: AppColor.primarycolor,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 13.sp,
                ),
              ),
              SizedBox(height: 5),
              Text(
                product.data.name,
                style: TextStyle(
                  color: AppColor.text,
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height: 7),
              Spacer(),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '\$ ${product.data.price}',
                  style: TextStyle(
                    color: AppColor.blacktext,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                  ),),),
              Spacer(),
              // عرض الدائرتين فقط عندما تكون صفحة المفضلة (showAddIcon == false)
              if (!showAddIcon) ...[
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: AppColor.str,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 4),
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: AppColor.str1,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
              if (showAddIcon)
                SizedBox(width: 8),
              if (showAddIcon)
                Container(
                  height: 35,
                  width: 34,
                  decoration: BoxDecoration(
                    color: AppColor.primarycolor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
            ],),],),
        ),),);
  }
}
