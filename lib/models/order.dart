import 'package:uuid/uuid.dart';
import 'vegetable.dart';

class Order {
  final String orderID;
  final Map<String, double> items;
  final double totalAmount;
  final DateTime timestamp;

  Order({
    String? orderID,
    required this.items,
    required this.totalAmount,
    DateTime? timestamp,
  }) : 
    orderID = orderID ?? const Uuid().v4(),
    timestamp = timestamp ?? DateTime.now();

  Map<String, dynamic> toJson() {
    return {
      'orderID': orderID,
      'items': items,
      'totalAmount': totalAmount,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      orderID: json['orderID'],
      items: Map<String, double>.from(json['items']),
      totalAmount: json['totalAmount'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  @override
  String toString() {
    return 'Order{id: $orderID, items: $items, total: $totalAmount, time: $timestamp}';
  }
}