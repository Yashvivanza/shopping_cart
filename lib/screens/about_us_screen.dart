import 'package:flutter/material.dart';

import '../utils/app_theme.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: const Column(
              children: [
                CircleAvatar(
                  radius: 45,
                  backgroundColor: AppTheme.primary,
                  child: Icon(Icons.shopping_bag, size: 50, color: Colors.white),
                ),
                SizedBox(height: 16),
                Text(
                  'ShopEasy',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textDark,
                  ),
                ),
                Text(
                  'Shop smart. Shop easy.',
                  style: TextStyle(color: AppTheme.textLight),
                ),
                SizedBox(height: 24),
                Text(
                  'ShopEasy is a modern shopping application that brings your favourite products to your fingertips. '
                  'From the latest electronics and trending fashion to shoes, beauty essentials and accessories, '
                  'we make it simple to browse, compare and buy with confidence.\n\n'
                  'Our mission is to deliver a smooth, secure and enjoyable shopping experience with quality '
                  'products, transparent pricing and fast delivery.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    height: 1.6,
                    color: AppTheme.textLight,
                  ),
                ),
                SizedBox(height: 24),
                _FeatureTile(
                  icon: Icons.local_shipping_outlined,
                  title: 'Fast Delivery',
                  subtitle: 'Quick and reliable delivery to your doorstep.',
                ),
                _FeatureTile(
                  icon: Icons.verified_outlined,
                  title: 'Quality Products',
                  subtitle: 'Carefully selected items from trusted brands.',
                ),
                _FeatureTile(
                  icon: Icons.lock_outline,
                  title: 'Secure Shopping',
                  subtitle: 'Your details are kept safe and private.',
                ),
                _FeatureTile(
                  icon: Icons.support_agent,
                  title: 'Friendly Support',
                  subtitle: 'Our team is always ready to help you.',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FeatureTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _FeatureTile({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: AppTheme.primary, size: 30),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(subtitle),
      ),
    );
  }
}
