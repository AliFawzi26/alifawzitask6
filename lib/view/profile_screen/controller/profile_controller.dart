import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../model/user_model.dart';

class ProfileController extends GetxController {
  UserModel user = UserModel(
    data: Data(
      user: User(
        name: 'Programmer',
        email: 'programmer.@gmail.com',
        fcmToken: '999',
      ),
      accessToken: '',
      tokenType: '',
    ),
    message: '',
  );

  File? profileImage;

  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      update();  // لتحديث الشاشة
    }
  }

  @override
  void onInit() {
    super.onInit();
    update();
  }
}
