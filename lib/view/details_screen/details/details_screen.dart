
import 'package:focal3/core/const_data/app_color.dart';
import 'package:focal3/core/const_data/app_image.dart';
import 'package:focal3/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../widgets/app_bar_icon.dart';
import '../../../widgets/favourite_button.dart';
import '../details_controller/details_controller.dart';
import '../widget/listimage.dart';
class DetailsPage extends StatelessWidget {
  final ProductModel productModel;
  const DetailsPage({super.key, required this.productModel});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background_color,
      appBar: AppBar(
        backgroundColor: AppColor.background_color,
        elevation: 0,
        leading: AppBarIcon(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 15,
          ),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
        title: Text(
          productModel.data.name,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,),),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
                onTap: () {},
                child:
                SvgPicture.asset(AppImage.cart,width: 40, height: 40)
            ),),],),
      body: GetBuilder<TShirtController>(
        init: TShirtController(),
        builder: (controller) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // إ
              children: [
                Text(
                  controller.title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),),
                SizedBox(height: 8),
                Text(
                  productModel.data.subCategory.category.name,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),),
                SizedBox(height: 8),
                Text(
                  '\$${productModel.data.price}',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),),
                SizedBox(height: 16),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Transform.translate(
                      offset: Offset(
                          0, 55),
                      child: Image.asset(
                        'assets/png/img_11.png',
                        height: 68,
                        width: 362,
                      ),),
                    Transform.translate(
                      offset: Offset(
                          0, -22),
                      child: Image.asset(
                        AppImage.t_shirt,
                        height:200.h,
                        width: 220,
                        fit: BoxFit.fill,
                      ),),],),
                SizedBox(height: 16),
                HorizontalImageScroll(),
                SizedBox(height: 16),
                Text(
                  controller.description,
                  style: TextStyle(
                      fontSize: 11,
                      fontFamily: 'Poppins',
                      color: AppColor.subTitleColor
                  ),),
                SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Read More',
                      style: TextStyle(
                          color: AppColor.primarycolor,
                          fontFamily: 'Poppins'),
                    ),),),
                SizedBox(height: 16),
                Row(
                  children: [
                    FavoriteButton(),
                    SizedBox(width: 49),
                    SizedBox(
                      width: 208,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          backgroundColor: AppColor.primarycolor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AppImage.bag,
                              width: 24,
                              // color: Colors.white,
                              height: 24,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Add To Cart',
                              style: TextStyle(
                                fontSize: 14,
                                color:AppColor.white,
                                fontFamily: 'Raleway-Bold',),),],),),),],),],
            ),);},),);
  }
}
