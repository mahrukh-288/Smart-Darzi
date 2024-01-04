import 'package:flutter/material.dart';
import 'package:smart_darzi/add_size/sizing.dart';
import 'package:smart_darzi/app_theme/constants.dart';

class CustomerFormField extends StatelessWidget {
  const CustomerFormField(
      {super.key, required this.label, required this.controller});
  final String label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 40,
          width: 500,
          child: TextField(
            cursorColor: borderColor,
            style: Theme.of(context).textTheme.labelLarge,
            controller: controller,
          ),
        ),
      ],
    );
  }
}
