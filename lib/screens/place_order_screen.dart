import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart_item_model.dart';
import '../providers/cart_provider.dart';
import '../providers/order_provider.dart';
import '../utils/app_theme.dart';
import '../utils/validators.dart';
import '../widgets/custom_button.dart';
import 'view_orders_screen.dart';

class PlaceOrderScreen extends StatefulWidget {
  const PlaceOrderScreen({super.key});

  @override
  State<PlaceOrderScreen> createState() => _PlaceOrderScreenState();
}

class _PlaceOrderScreenState extends State<PlaceOrderScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _mobileController = TextEditingController();

  static const List<Map<String, dynamic>> _paymentMethods = [
    {'name': 'Cash on Delivery', 'icon': Icons.money},
    {'name': 'UPI', 'icon': Icons.qr_code},
    {'name': 'Credit / Debit Card', 'icon': Icons.credit_card},
  ];

  String _selectedPayment = 'Cash on Delivery';

  // Snapshot of the cart taken when this screen opens, so the order
  // summary stays the same even after the cart is cleared.
  late final List<CartItemModel> _items;
  late final double _total;

  @override
  void initState() {
    super.initState();
    final cart = context.read<CartProvider>();
    _items = cart.items;
    _total = cart.totalAmount;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _mobileController.dispose();
    super.dispose();
  }

  void _placeOrder() {
    if (!_formKey.currentState!.validate()) return;

    context.read<OrderProvider>().placeOrder(
          items: _items,
          totalAmount: _total,
          customerName: _nameController.text.trim(),
          address: _addressController.text.trim(),
          mobile: _mobileController.text.trim(),
          paymentMethod: _selectedPayment,
        );
    context.read<CartProvider>().clearCart();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          icon: const Icon(Icons.check_circle, color: Colors.green, size: 64),
          title: const Text('Order Placed!'),
          content: const Text(
            'Thank you for shopping with us. Your order has been placed successfully.',
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              onPressed: () {
                // pop: close the dialog.
                Navigator.pop(dialogContext);
                // pushReplacement: View Orders replaces the Place Order screen.
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const ViewOrdersScreen()),
                );
              },
              child: const Text('View My Orders'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Place Order'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _SectionTitle('Delivery Details'),
                  TextFormField(
                    controller: _nameController,
                    textCapitalization: TextCapitalization.words,
                    decoration: AppTheme.inputDecoration(
                      label: 'Customer Name',
                      icon: Icons.person_outline,
                    ),
                    validator: (v) => Validators.required(v, 'Name'),
                  ),
                  const SizedBox(height: 14),
                  TextFormField(
                    controller: _addressController,
                    maxLines: 3,
                    decoration: AppTheme.inputDecoration(
                      label: 'Delivery Address',
                      icon: Icons.location_on_outlined,
                    ),
                    validator: (v) => Validators.required(v, 'Address'),
                  ),
                  const SizedBox(height: 14),
                  TextFormField(
                    controller: _mobileController,
                    keyboardType: TextInputType.phone,
                    maxLength: 10,
                    decoration: AppTheme.inputDecoration(
                      label: 'Mobile Number',
                      icon: Icons.phone_outlined,
                    ).copyWith(counterText: ''),
                    validator: Validators.mobile,
                  ),
                  const SizedBox(height: 20),
                  const _SectionTitle('Payment Method'),
                  ..._paymentMethods.map((method) {
                    final name = method['name'] as String;
                    final selected = name == _selectedPayment;
                    return Card(
                      margin: const EdgeInsets.only(bottom: 8),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: selected
                              ? AppTheme.primary
                              : const Color(0xFFE3E5EE),
                          width: selected ? 1.5 : 1,
                        ),
                      ),
                      child: ListTile(
                        leading: Icon(method['icon'] as IconData,
                            color: AppTheme.primary),
                        title: Text(name),
                        trailing: Icon(
                          selected
                              ? Icons.radio_button_checked
                              : Icons.radio_button_unchecked,
                          color: selected ? AppTheme.primary : Colors.grey,
                        ),
                        onTap: () => setState(() => _selectedPayment = name),
                      ),
                    );
                  }),
                  const SizedBox(height: 12),
                  const _SectionTitle('Order Summary'),
                  Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Column(
                        children: [
                          ..._items.map((item) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      '${item.product.name} x ${item.quantity}',
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Text('₹${item.subtotal.toStringAsFixed(0)}'),
                                ],
                              ),
                            );
                          }),
                          const Divider(height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Total Amount',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                              Text(
                                '₹${_total.toStringAsFixed(0)}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: AppTheme.primary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    label: 'Place Order',
                    icon: Icons.check,
                    onPressed: _placeOrder,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;

  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppTheme.textDark,
        ),
      ),
    );
  }
}
