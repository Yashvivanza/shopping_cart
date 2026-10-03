import 'package:flutter/foundation.dart';

import '../models/cart_item_model.dart';
import '../models/product_model.dart';

class CartProvider extends ChangeNotifier {
  // Key = product id, so the same product is never added twice.
  final Map<String, CartItemModel> _items = {};

  List<CartItemModel> get items => _items.values.toList();

  bool get isEmpty => _items.isEmpty;

  /// Total number of units in the cart (used for the badge).
  int get totalQuantity =>
      _items.values.fold(0, (sum, item) => sum + item.quantity);

  double get totalAmount =>
      _items.values.fold(0.0, (sum, item) => sum + item.subtotal);

  void addProduct(ProductModel product, {int quantity = 1}) {
    if (_items.containsKey(product.id)) {
      _items[product.id]!.quantity += quantity;
    } else {
      _items[product.id] = CartItemModel(product: product, quantity: quantity);
    }
    notifyListeners();
  }

  void removeProduct(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void increaseQuantity(String productId) {
    final item = _items[productId];
    if (item == null) return;
    item.quantity++;
    notifyListeners();
  }

  void decreaseQuantity(String productId) {
    final item = _items[productId];
    if (item == null) return;
    if (item.quantity > 1) {
      item.quantity--;
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
