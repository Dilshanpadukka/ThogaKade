import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

enum VegetableCategory {
  leafy,
  root,
  fruit,
  vegetables,
  other
}

class Vegetable {
  final String id;
  final String name;
  final double pricePerKg;
  double availableQuantity;
  final VegetableCategory category;
  final DateTime expiryDate;

  Vegetable({
    String? id,
    required this.name,
    required this.pricePerKg,
    required this.availableQuantity,
    required this.category,
    required this.expiryDate,
  }) : id = id ?? const Uuid().v4();

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'pricePerKg': pricePerKg,
      'availableQuantity': availableQuantity,
      'category': category.toString().split('.').last,
      'expiryDate': DateFormat('yyyy-MM-dd').format(expiryDate),
    };
  }
  
  factory Vegetable.fromJson(Map<String, dynamic> json) {
    return Vegetable(
      id: json['id'],
      name: json['name'],
      pricePerKg: json['pricePerKg'],
      availableQuantity: json['availableQuantity'],
      category: VegetableCategory.values.firstWhere(
        (e) => e.toString().split('.').last == json['category']
      ),
      expiryDate: DateFormat('yyyy-MM-dd').parse(json['expiryDate']),
    );
  }

  @override
  String toString() {
    return 'Vegetable{id: $id, name: $name, price: $pricePerKg, quantity: $availableQuantity, category: $category, expiry: $expiryDate}';
  }
}