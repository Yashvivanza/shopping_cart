import 'cart_item_model.dart';

class OrderModel {
  final String id;
  final DateTime date;
  final List<CartItemModel> items;
  final double totalAmount;
  final String status;
  final String customerName;
  final String address;
  final String mobile;
  final String paymentMethod;

  const OrderModel({
    required this.id,
    required this.date,
    required this.items,
    required this.totalAmount,
    required this.status,
    required this.customerName,
    required this.address,
    required this.mobile,
    required this.paymentMethod,
  });

  String get formattedDate {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];
    final hour = date.hour % 12 == 0 ? 12 : date.hour % 12;
    final minute = date.minute.toString().padLeft(2, '0');
    final period = date.hour >= 12 ? 'PM' : 'AM';
    return '${date.day} ${months[date.month - 1]} ${date.year}, $hour:$minute $period';
  }
}
