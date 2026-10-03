import 'package:flutter/material.dart';

import '../utils/app_theme.dart';
import '../utils/validators.dart';
import '../widgets/custom_button.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Thank you! Your message has been sent.'),
        ),
      );
      _nameController.clear();
      _emailController.clear();
      _messageController.clear();
      _formKey.currentState!.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Get in Touch',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textDark,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Have a question? Send us a message.',
                  style: TextStyle(color: AppTheme.textLight),
                ),
                const SizedBox(height: 20),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nameController,
                        textCapitalization: TextCapitalization.words,
                        decoration: AppTheme.inputDecoration(
                          label: 'Name',
                          icon: Icons.person_outline,
                        ),
                        validator: (v) => Validators.required(v, 'Name'),
                      ),
                      const SizedBox(height: 14),
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: AppTheme.inputDecoration(
                          label: 'Email',
                          icon: Icons.email_outlined,
                        ),
                        validator: Validators.email,
                      ),
                      const SizedBox(height: 14),
                      TextFormField(
                        controller: _messageController,
                        maxLines: 5,
                        decoration: AppTheme.inputDecoration(
                          label: 'Message',
                          icon: Icons.message_outlined,
                        ),
                        validator: (v) => Validators.required(v, 'Message'),
                      ),
                      const SizedBox(height: 20),
                      CustomButton(
                        label: 'Submit',
                        icon: Icons.send,
                        onPressed: _submit,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 28),
                const Text(
                  'Contact Information',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Card(
                  elevation: 0,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.email_outlined, color: AppTheme.primary),
                        title: Text('support@shopeasy.com'),
                      ),
                      ListTile(
                        leading: Icon(Icons.phone_outlined, color: AppTheme.primary),
                        title: Text('+91 98765 43210'),
                      ),
                      ListTile(
                        leading: Icon(Icons.location_on_outlined,
                            color: AppTheme.primary),
                        title: Text('123 Market Street, Business District'),
                      ),
                      ListTile(
                        leading: Icon(Icons.access_time, color: AppTheme.primary),
                        title: Text('Mon - Sat, 9:00 AM - 6:00 PM'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
