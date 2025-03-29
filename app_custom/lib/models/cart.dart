import 'cart_model.dart';

class Cart {
  static final List<CartItem> items = [];

  static void addItem(CartItem item) {
    items.add(item);
  }

  static void removeItem(int index) {
    items.removeAt(index);
  }

  static void clear() {
    items.clear();
  }
}
