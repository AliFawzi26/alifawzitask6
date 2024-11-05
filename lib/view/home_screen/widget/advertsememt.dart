/*

import 'package:flutter/material.dart';
class NewArrivalsBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: 380, // Adjust the width
        height: 120, // Adjust the height for the banner
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), // Rounded corners
          color: Colors.white, // Background color
        ),
        child: Stack(
          children: [
            Positioned(
              left: 12,
              top: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Summer Sale",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff3B3B3B), // Dark text color
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    " OFF 15% ",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff674DC5), // Purple color for the discount
                    ),
                  ),
                ],
              ),
            ),
            Image.asset('assets/png/img_1.png',width: 16,height: 15,),
            //
            // "NEW!" text and T-shirt image on the right
            Positioned(
              top: 10,
              left: 10,
              right: 0,
              bottom: 0,
              child: Stack(
                children: [

                  Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      'assets/png/new.png',
                      width: 25, // حجم الصورة
                      height: 25,
                    ),
                  ),

                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Image.asset(
                      'assets/png/adverst.png',
                      width: 150,
                      height: 125,
                    ),
                  ),
                ],
              ),
            ),

          ],
            ),

      ),
    );
  }
}
*/
import 'package:flutter/material.dart';

class NewArrivalsBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: 380, // Adjust the width
        height: 120, // Adjust the height for the banner
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), // Rounded corners
          color: Colors.white, // Background color
        ),
        child: Stack(
          children: [
            // نص "Summer Sale" و "OFF 15%"
            Positioned(
              left: 12,
              top: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Summer Sale",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff3B3B3B), // Dark text color
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "OFF 15%",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff674DC5), // Purple color for the discount
                    ),
                  ),
                ],
              ),
            ),

            Positioned(
              top: 15,
              left: 130,
              child: Image.asset(
                'assets/png/new.png',
                width: 25,
                height: 25,
              ),
            ),
            // صورة تيشيرت في أسفل يمين
            Positioned(
              right: 0,
              bottom: 0,
              child: Image.asset(
                'assets/png/adverst.png',
                width: 150,
                height: 125,
              ),
            ),
            // النجمة في أسفل يسار الكونتينر
            Positioned(
              left: 10,
              bottom: 10,
              child: Image.asset(
                'assets/png/img_1.png',
                width: 16,
                height: 15,
              ),
            ),
            // النجمة في أعلى يمين الكونتينر
            Positioned(
              right: 10,
              top: 10,
              child: Image.asset(
                'assets/png/img_1.png',
                width: 16,
                height: 15,
              ),
            ),
            // النجمة في منتصف أسفل الكونتينر
            Positioned(
              left: 0,
              right: 0,
              bottom: 10,
              child: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/png/img_1.png',
                  width: 16,
                  height: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

