
import 'package:flutter/rendering.dart';
import 'package:focal3/core/const_data/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../controller/cart_controller.dart';
import '../widget/contanier_price.dart';
class CartPage extends StatelessWidget {
@override
Widget build(BuildContext context) {
return Directionality(
textDirection: TextDirection.ltr,
child: Scaffold(
backgroundColor: AppColor.background_color,
appBar: AppBar(
backgroundColor: AppColor.background_color,
elevation: 0,
centerTitle: true,
title: Text(
'My Cart',
style: TextStyle(
fontFamily: 'Raleway-Bold',
fontSize: 16.sp,
color: Colors.black,
),),),
body: GetBuilder<CartController>(
init: CartController(),
builder: (controller) {
return Padding(
padding: EdgeInsets.all(20.w),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
'Items',
style: TextStyle(
fontSize: 16.sp,
fontWeight: FontWeight.bold,
),
),
SizedBox(height: 10.h),
Expanded(
child: ListView.builder(
itemCount: controller.items.length,
itemBuilder: (context, index) {
var item = controller.items[index];
return SizedBox(
width: double.infinity,
child: Slidable(
key: Key(item['name'] as String),
  startActionPane: ActionPane(
    motion: const StretchMotion(),
    extentRatio: 0.2,
    children: [
      Container(
        width: 50,
        height: 100,
        color: AppColor.primarycolor,
        child: Column(
          children: [
            Expanded(
              child: IconButton(
                onPressed: () {
                  controller.incrementQuantity(index);
                },
                icon: const Icon(Icons.add),
                iconSize: 18,
                color: AppColor.white,
              ),
            ),
            Obx(() => Text(
                controller.quantities[index].toString(),
                style: TextStyle(color: AppColor.white),
              ),),
            Expanded(
              child: IconButton(
                onPressed: () {
                  controller.decrementQuantity(index);
                },
                icon: const Icon(Icons.remove),
                iconSize: 18,
                color: AppColor.white,),),],),),],),
 endActionPane: ActionPane(
motion: const StretchMotion(),
extentRatio: 0.2,
children: [
Container(
width: 50,
height: 100,
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
IconButton(
onPressed: () async {
bool confirm = await showDialog(
context: context,
builder: (context) => AlertDialog(
title: Text('Confirm Delete'),
content: Text('Are you sure you want to delete this item?'),
actions: [
TextButton(
onPressed: () => Navigator.of(context).pop(false),
child: Text('Cancel'),
),
TextButton(
onPressed: () {
controller.removeItem(index);
Navigator.of(context).pop(true);
},
child: Text('Delete'),
),],),);},
icon: Icon(
Icons.delete_outline,
color: Colors.white,
),
),
],),
decoration: BoxDecoration(
color: AppColor.icondelete, // الخلفية
),),],),
child:
Container(
padding: EdgeInsets.all(10.w),
decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular(10),
),
child: Row(
children: [
Image.asset(
item['image'] as String,
width: 80.w,
height: 80.h,
),
SizedBox(width: 10.w),
Expanded(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
item['name'] as String,
style: TextStyle(
fontSize: 18.sp,
fontWeight: FontWeight.w500,
),
),
SizedBox(height: 5.h),
Text(
'\$${(item['price'] as double).toStringAsFixed(2)}',
style: TextStyle(
fontSize: 16.sp,
fontWeight: FontWeight.w400,
),
),
],
),
),
],),),),);},),),
SizedBox(height: 10.h),
Contanierprice(),],),);
 },
),),);
  }}
