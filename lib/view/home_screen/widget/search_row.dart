
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


import '../../../core/const_data/app_color.dart';
import '../../../core/const_data/app_image.dart';

class SearchRow extends StatelessWidget {
  const SearchRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: InkWell(
            onTap: () {
             
            },
            child: Container(
            height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: SvgPicture.asset(
                        AppImage.search,
                      ),
                    ),
                    Text('Looking for..'),
                    SizedBox()
                  ],
                ),
              ),
            ),
          ),
        )
        
        ,
          SizedBox(width:10),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColor.primarycolor,
          ),
          child: IconButton(
            icon: Icon(Icons.tune, color: Colors.white),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
