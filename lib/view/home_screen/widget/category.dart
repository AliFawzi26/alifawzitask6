import 'package:flutter/material.dart';


class Category extends StatelessWidget {
  final String title;
  final Color color;
  final Color colorTitle;
  final void Function()? onTap;
  const Category(
      {super.key,
      this.onTap,
      required this.color,
      required this.title,
      required this.colorTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(color: color,borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 3),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  color: colorTitle,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
