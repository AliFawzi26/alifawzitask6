import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../model/order.dart';
import '../controller/order_controller.dart';
class OrderPage extends StatelessWidget {
  final OrderController controller = Get.put(OrderController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Management'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () => controller.getOrders(),
              child: Text('Check Orders'),
            ),
          ),
          Expanded(
            child: GetBuilder<OrderController>(
              builder: (controller) {
                if (controller.loading) {
                  return Center(child: CircularProgressIndicator());
                }
                if (controller.orders.isEmpty) {
                  return Center(child: Text('No orders available.'));
                }
                return ListView.builder(
                  itemCount: controller.orders.length,
                  itemBuilder: (context, index) {
                    final order = controller.orders[index];
                    return Card(
                      child: ListTile(
                        title: Text(order.name),
                        subtitle: Text('Quantity: ${order.quantity}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit, color: Colors.blue),
                              onPressed: () {
                                showOrderDialog(context, order);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                   controller.deleteOrder(order.id!);
                              },),],),
                      ),);},);},),),],),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.postOrder("1", "10"), // Test values
        child: Icon(Icons.add),
        tooltip: 'Add Order',
      ),
    );}
  void showOrderDialog(BuildContext context, OrdersModel order) {
    final nameController = TextEditingController(text: order.name);
    final quantityController = TextEditingController(text: order.quantity.toString());
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Update Order'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'product_id'),
              ),
              TextField(
                controller: quantityController,
                decoration: InputDecoration(labelText: 'Quantity'),
                keyboardType: TextInputType.number,
              ),],),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                final quantity = int.tryParse(quantityController.text) ?? 0;
                controller.updateOrder(order.id, quantity);
                Navigator.of(context).pop();},
              child: Text('Update'),
            ),],);},);}
}
