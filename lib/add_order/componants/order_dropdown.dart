import 'package:flutter/material.dart';

import '../../app_theme/constants.dart';

class OrderDropDown extends StatelessWidget {
  const OrderDropDown({super.key, required this.label, required this.controller, required this.dropdownItems, this.enabled = true});
final String label;
final TextEditingController controller;
final List<String> dropdownItems;
final bool? enabled;
  @override
  Widget build(BuildContext context) {
    print(controller.text);
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
            height: 50,
            width: 500,
            child: TextField(
              
              enabled: enabled,
              controller: controller,
              decoration: InputDecoration(
                  prefix: DropdownButtonFormField(
                decoration: InputDecoration(
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                ),
                iconEnabledColor: Colors.transparent,
                style: Theme.of(context).textTheme.labelLarge,
                dropdownColor: primaryColor,
                items: dropdownItems.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  controller.text = value!;
                },
              )),
            ))
      ],
    );
  }
}