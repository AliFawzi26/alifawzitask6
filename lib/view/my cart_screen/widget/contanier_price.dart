import 'package:focal3/core/const_data/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/cart_controller.dart';
import '../my cart/mycart_screen.dart';
class Contanierprice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CartController>();
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Subtotal',
                style: TextStyle(fontSize: 16,),),
              Text(
                '\$${controller.subtotal.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 16, ),),],),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Delivery',
                style: TextStyle(fontSize: 16, ),
              ),
              Text(
                '\$${controller.delivery.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 16, fontFamily: 'Raleway-Bold'),
              ),],),
          SizedBox(height: 16), 
          Container(
            height: 1, 
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.grey, // لون الخط
                  width: 1, // سمك الخط
                  style: BorderStyle.solid, // نمط الخط
                ),
              ),
            ),
            child: Divider(
              height: 1, // ارتفاع الـ Divider
              color: Colors.transparent, // إخفاء لون الـ Divider
            ),
          ),
          SizedBox(height: 16), // إضافة مساحة بعد الخط
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Cost',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Raleway-Bold',
                ),
              ),
              Text(
                '\$${controller.totalCost.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColor.primarycolor),),],),
          SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
             backgroundColor:AppColor.primarycolor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),),
              child: Text(
                'Checkout',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,),),),),],),);
  }
}
