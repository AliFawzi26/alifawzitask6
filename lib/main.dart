import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:focal3/view/splash_screen/view/splash_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'binding/initial_binding.dart';
import 'core/servies/my_services.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await MyServices().initialize;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return GetMaterialApp(
            theme: ThemeData(
              textTheme: TextTheme(
                bodyMedium: TextStyle(
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            initialBinding: InitialBinding(),
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          );
        });
  }
}



