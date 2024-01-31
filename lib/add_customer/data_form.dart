import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:smart_darzi/app_theme/constants.dart';
import '../generated/locale_keys.g.dart';

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
          child: TextFormField(
           // validator: (value) => _validate(value),
            cursorColor: borderColor,
            style: Theme.of(context).textTheme.labelLarge,
            controller: controller,
          ),
        ),
      ],
    );
  }


}
