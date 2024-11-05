class OrdersModel {
  final String id; // يجب أن يكون id من نوع String
  final String name;
  final int quantity;

  OrdersModel({
    required this.id,
    required this.name,
    required this.quantity,
  });

  factory OrdersModel.fromJson(Map<String, dynamic> json) {
    return OrdersModel(
      id: json['id'].toString(),  // تحويل id إلى String
      name: json['name'] ?? '',
      quantity: json['quantity'] ?? 0,
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'id': id, // تضمين id في JSON
      'name': name,
      'quantity': quantity,
    };
  }
}


