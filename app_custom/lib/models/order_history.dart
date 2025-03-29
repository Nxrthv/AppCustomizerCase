import 'order_model.dart';

class OrderHistory {
  static final List<OrderModel> orders = [];

  static void addOrder(OrderModel order) {
    orders.add(order);
  }

  static void clear() {
    orders.clear();
  }
}