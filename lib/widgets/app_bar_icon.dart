import 'package:flutter/material.dart';

class AppBarIcon extends StatelessWidget {
  final void Function()? onPressed;
  final icon;
  final Color? color;
  const AppBarIcon({super.key, this.onPressed, required this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color == null ? Colors.white : color),
        child: Center(child: IconButton(onPressed: onPressed, icon: icon)),
      ),
    );
  }
}
//Icons.arrow_back_ios
//Icon(
         //         Icons.arrow_back_ios,
           //       size: 15,
          //      )