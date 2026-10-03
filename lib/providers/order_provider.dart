import 'package:flutter/foundation.dart';

import '../models/cart_item_model.dart';
import '../models/order_model.dart';

class OrderProvider extends ChangeNotifier {
  final List<OrderModel> _orders = [];

  /// Newest order first.
  List<OrderModel> get orders => _orders.reversed.toList();

  void placeOrder({
    required List<CartItemModel> items,
    required double totalAmount,
    required String customerName,
    required String address,
    required String mobile,
    required String paymentMethod,
  }) {
    final order = OrderModel(
      id: 'ORD${1001 + _orders.length}',
      date: DateTime.now(),
      // Copy the items so clearing the cart does not affect the order.
      items: items
          .map((i) => CartItemModel(product: i.product, quantity: i.quantity))
          .toList(),
      totalAmount: totalAmount,
      status: 'Processing',
      customerName: customerName,
      address: address,
      mobile: mobile,
      paymentMethod: paymentMethod,
    );
    _orders.add(order);
    notifyListeners();
  }
}
