import 'package:focal3/core/const_data/app_color.dart';
import 'package:focal3/core/const_data/app_image.dart';
import 'package:focal3/view/profile_screen/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../widgets/app_bar_icon.dart';
import '../widget/custome_title.dart';
import '../widget/custome_userinfo.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: AppBarIcon(
              color: AppColor.background_color,
              icon: Icon(
                Icons.arrow_back_ios,
                size: 15,
              ),
              onPressed: () {},
            ),
            title: const Text(
              'Profile',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: GestureDetector(
                    onTap: () => controller.pickImage(),
                    child: ClipOval(
                      child: controller.profileImage != null
                          ? Image.file(
                        controller.profileImage!,
                        fit: BoxFit.cover,
                        width: 100,
                        height: 100,
                      )
                          : Image.asset(
                        AppImage.profile,
                        fit: BoxFit.cover,
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                ),
                CustomTitle('Your Name'),
                CustomUserInfo(controller.user.data.user.name ?? ''),
                CustomTitle('Email Address'),
                CustomUserInfo(controller.user.data.user.email ?? ''),
                CustomTitle('Password'),
                CustomUserInfo('********'),
                SizedBox(height: 5),
                Row(
                  children: [
                    Expanded(child: SizedBox()),
                    Text(
                      'Recover Password',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: 'Poppins',
                        color: AppColor.subTitleColor,
                        fontWeight: FontWeight.w600,),),],),
                SizedBox(height: 25.h),
                Container(
                  width: double.infinity,
                  height: 55.h,
                  decoration: BoxDecoration(
                    color: AppColor.primarycolor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Save Now',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                    ),),),],),),);},);
  }
}