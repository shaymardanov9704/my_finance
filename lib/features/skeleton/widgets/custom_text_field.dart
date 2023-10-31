import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String? Function(String? value)? validator;
  final void Function()? onTap;
  final TextInputType? keyboardType;
  final bool readOnly;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.title,
    required this.validator,
    this.keyboardType,
    this.readOnly = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 60,
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            hintText: title,
          ),
          onTap: onTap,
          readOnly: readOnly,
          cursorWidth: 0,
          validator: validator,
        ),
      ),
    );
  }
}
