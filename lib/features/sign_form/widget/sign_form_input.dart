import 'package:flutter/material.dart';

class SignFormInput extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const SignFormInput({
    required this.label,
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          label: Text(label),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        controller: controller,
      ),
    );
  }
}
