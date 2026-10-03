import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFF5B5BD6);
  static const Color accent = Color(0xFFFF8A3D);
  static const Color background = Color(0xFFF6F7FB);
  static const Color textDark = Color(0xFF1F2330);
  static const Color textLight = Color(0xFF7A8094);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: primary),
      scaffoldBackgroundColor: background,
      appBarTheme: const AppBarTheme(
        backgroundColor: primary,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
    );
  }

  /// One shared style for every text field in the app.
  static InputDecoration inputDecoration({
    required String label,
    required IconData icon,
    String? hint,
    Widget? suffixIcon,
  }) {
    OutlineInputBorder border(Color color, [double width = 1]) {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: color, width: width),
      );
    }

    return InputDecoration(
      labelText: label,
      hintText: hint,
      prefixIcon: Icon(icon),
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: Colors.white,
      border: border(const Color(0xFFE3E5EE)),
      enabledBorder: border(const Color(0xFFE3E5EE)),
      focusedBorder: border(primary, 1.5),
      errorBorder: border(Colors.red),
      focusedErrorBorder: border(Colors.red, 1.5),
    );
  }
}
