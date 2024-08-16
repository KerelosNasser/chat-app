import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;

  const CustomTextField({
    super.key,
    required this.labelText,
    this.obscureText = false,
    this.validator,
    this.controller,
    this.prefixIcon,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.white),
        filled: true,
        fillColor: Colors.white.withOpacity(0.2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        prefixIcon: prefixIcon,
        contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }
}
