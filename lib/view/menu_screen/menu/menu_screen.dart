import 'package:focal3/core/const_data/app_image.dart';
import 'package:focal3/view/favourite_screen/favourite/favourite_screen.dart';
import 'package:focal3/view/my%20cart_screen/my%20cart/mycart_screen.dart';
import 'package:focal3/view/order_screen/order/order_screen.dart';
import 'package:focal3/view/profile_screen/view/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../menu_controller/menu_controller.dart';

class DrawerMenu extends StatelessWidget {
  final DrawerControllerX controller = Get.put(DrawerControllerX());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Drawer(
        child: Container(
          color: Color(0xFF1E1E1E),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(
                  "Programmer X",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage(AppImage.profile),
                ),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                accountEmail: null,
              ),
              GetBuilder<DrawerControllerX>(
                builder: (_) {
                  return Column(
                    children: [
                      _buildMenuItem(
                        icon: SvgPicture.asset(AppImage.profile_icon,
                            width: 20, height: 24, color: Colors.white),
                        text: 'Profile',
                        isSelected: controller.selectedMenu == 'Profile',
                        onTap: () {
                          controller.updateSelectedMenu('Profile');
                          Get.to(ProfileScreen());
                        },
                      ),
                      _buildMenuItem(
                        icon: SvgPicture.asset(AppImage.bag,
                            width: 20, height: 24, color: Colors.white),
                        text: 'My Cart',
                        isSelected: controller.selectedMenu == 'My Cart',
                        onTap: () {
                          controller.updateSelectedMenu('My Cart');
                          Get.to(() => CartPage());
                        },
                      ),
                      _buildMenuItem(
                        icon: SvgPicture.asset(
                          AppImage.favorite,
                          width: 20,
                          height: 24,
                          color: Colors.white,
                        ),
                        text: 'Favorite',
                        isSelected: controller.selectedMenu == 'Favorite',
                        onTap: () {
                          controller.updateSelectedMenu('Favorite');
                         
                        },
                      ),
                      _buildMenuItem(
                        icon: SvgPicture.asset(AppImage.order,
                            width: 24, height: 24),
                        text: 'Orders',
                        isSelected: controller.selectedMenu == 'Orders',
                        onTap: () {
                          controller.updateSelectedMenu('Orders');
                          Get.to(() => OrderPage() );

                        },
                      ),
                      _buildMenuItem(
                        icon: SvgPicture.asset(AppImage.notf_icon,
                            width: 20, height: 24, color: Colors.white),
                        text: 'Notifications',
                        isSelected: controller.selectedMenu == 'Notifications',
                        onTap: () {
                          controller.updateSelectedMenu('Notifications');
                             
                        },
                      ),
                      _buildMenuItem(
                        icon: Icon(
                          Icons.settings,
                          color: Colors.white,
                        ),
                        text: 'Settings',
                        isSelected: controller.selectedMenu == 'Settings',
                        onTap: () {
                          controller.updateSelectedMenu('Settings');
                        },
                      ),
                      Divider(color: Colors.white),
                      _buildMenuItem(
                        icon: SvgPicture.asset(AppImage.logout,
                            color: Colors.white, width: 20, height: 24),
                        text: 'Sign Out',
                        isSelected: controller.selectedMenu == 'Sign Out',
                        onTap: () {
                          controller.Logout();
                          controller.updateSelectedMenu('Sign Out');
                        },
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required Widget icon, // تعديل لقبول Widget بدلاً من IconData
    required String text,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: icon, // استخدام الصورة هنا
      title: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.green : Colors.white,
          fontSize: 16,
          // اللون الأخضر عند التحديد
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
      selected: isSelected,
      onTap: onTap,
    );
  }
}
