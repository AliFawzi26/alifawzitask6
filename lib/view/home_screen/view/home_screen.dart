import 'package:focal3/core/const_data/app_color.dart';
import 'package:focal3/core/const_data/app_image.dart';
import 'package:focal3/view/details_screen/details/details_screen.dart';
import 'package:focal3/view/home_screen/view/see_all_product.dart';
import 'package:focal3/view/home_screen/widget/category.dart';
import 'package:focal3/widgets/app_bar_icon.dart';
import 'package:focal3/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../menu_screen/menu/menu_screen.dart';
import '../controller/home_controller.dart';
import '../widget/advertsememt.dart';
import '../widget/custom_row.dart';
import '../widget/search_row.dart';
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background_color,
      appBar: AppBar(
        centerTitle: true,
        title: Stack(
          alignment: Alignment.topLeft,
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -10,
              left: -12,
              child: SvgPicture.asset('assets/icon/abov_title.svg'),
            ),
            Text(
              'Explore',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
            ),
          ],
        ),
        actions: [
          AppBarIcon(

            icon: SvgPicture.asset(
              AppImage.bag,
              color: AppColor.text,
            ),
          ),
        ],
        backgroundColor: AppColor.background_color,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();

            },
            child: SvgPicture.asset(AppImage.menu, width: 25, height: 18),
          ),
        ),
      ),
      drawer: DrawerMenu(),
      drawerEdgeDragWidth: 100,
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                textDirection: TextDirection.ltr,
                children: [
                  SearchRow(),
                  SizedBox(height: 24),
                  CustomRow(
                    isCAtegoryRow: true,
                    onTap: () => Get.to(
                      SeeAllProduct(products: controller.filteredProducts),
                    ),
                  ),
                  SizedBox(height: 16),
                  // categories
                  controller.isLoading
                      ? Center(child: CircularProgressIndicator())
                      : Column(
                    children: [
                      Container(
                        height: 50,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Category(
                              color: controller.selectedCategoryId == null
                                  ? AppColor.primarycolor
                                  : AppColor.white,
                              title: 'All Products',
                              colorTitle:
                              controller.selectedCategoryId == null
                                  ? AppColor.white
                                  : AppColor.blacktext,
                              onTap: () =>
                                  controller.selectCategory(null),
                            ),
                            if (controller.categories != null &&
                                controller.categories!.data.isNotEmpty)
                              ...controller.categories!.data
                                  .map<Widget>((category) {
                                return Category(
                                  color: controller.selectedCategoryId ==
                                      category.id
                                      ? AppColor.primarycolor
                                      : AppColor.white,
                                  title: category.name,
                                  colorTitle:
                                  controller.selectedCategoryId ==
                                      category.id
                                      ? AppColor.white
                                      : AppColor.blacktext,
                                  onTap: () => controller
                                      .selectCategory(category.id),
                                );
                              }).toList(),
                          ],),),
                      SizedBox(height: 16),
                      // products
                      Container(
                        height:250.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.filteredProducts.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: ProductCard(
                              product: controller.filteredProducts[index],
                              onTap : () => Get.to(DetailsPage(
                                productModel:
                                controller.filteredProducts[index],
                              )),),),),),],),
                  SizedBox(height: 16),
                  CustomRow(isCAtegoryRow: false),
                  SizedBox(height: 5),
                  NewArrivalsBanner(),
                ],),),);},),);
  }
}
