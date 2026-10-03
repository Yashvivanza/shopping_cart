import 'package:flutter/material.dart';

import '../screens/about_us_screen.dart';
import '../screens/cart_screen.dart';
import '../screens/contact_us_screen.dart';
import '../screens/login_screen.dart';
import '../screens/view_orders_screen.dart';
import '../utils/app_theme.dart';

/// Side menu used on the Home (Category) screen.
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  /// Close the drawer first (pop), then open the new screen (push).
  void _open(BuildContext context, Widget screen) {
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  void _logout(BuildContext context) {
    // Remove every previous screen so Back cannot return to the app.
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 60, 20, 24),
            color: AppTheme.primary,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 36, color: AppTheme.primary),
                ),
                SizedBox(height: 12),
                Text(
                  'Welcome, Shopper!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('ShopEasy', style: TextStyle(color: Colors.white70)),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            // Already on Home, so just close the drawer.
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart_outlined),
            title: const Text('Cart'),
            onTap: () => _open(context, const CartScreen()),
          ),
          ListTile(
            leading: const Icon(Icons.receipt_long_outlined),
            title: const Text('View Orders'),
            onTap: () => _open(context, const ViewOrdersScreen()),
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('About Us'),
            onTap: () => _open(context, const AboutUsScreen()),
          ),
          ListTile(
            leading: const Icon(Icons.contact_support_outlined),
            title: const Text('Contact Us'),
            onTap: () => _open(context, const ContactUsScreen()),
          ),
          const Spacer(),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Logout', style: TextStyle(color: Colors.red)),
            onTap: () => _logout(context),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
