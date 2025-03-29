import 'package:app_custom/models/cart_model.dart';

class OrderModel {
  final List<CartItem> items;
  final DateTime date;

  OrderModel({required this.items, required this.date});
}