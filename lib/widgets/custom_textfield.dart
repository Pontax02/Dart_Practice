import 'package:flutter/material.dart';
import 'package:flutter_application_test/utils/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  const CustomTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: buttonColor, width: 2),
        ),
        labelText: "Email",
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: secondaryBackgroundColor, width: 2),
        ),
      ),
    );
  }
}
