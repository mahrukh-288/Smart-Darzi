import 'package:flutter/material.dart';
import 'package:smart_darzi/Common%20Widgets/custom_dropdown_search.dart';

import '../app_theme/constants.dart';

class OrderDetailsForm extends StatelessWidget {
   OrderDetailsForm({super.key});

  final TextEditingController _nameController= TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
      margin: const EdgeInsets.symmetric(horizontal: 60),
      decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(5),
          color: primaryColor.withOpacity(0.6)),
      child: Wrap(
        runSpacing: 20,
        spacing: 60,
        children: [
          sizeTextField(context, 'Order Name', true, []),
          sizeTextField(context, 'Order Id', true, []),
          sizeTextField(context,'Order Category', 
          false, ['Male /مردانہ', 'Female /زنانہ']),
          sizeTextField(context,'Order Type', false,['Shalwar Qamees /شلوار قمیص', 'Shirt /شرٹ', 'Kurta Shalwar /کُرتا پاجامہ','Waist Coat / ویس کوٹ','Trouser / ٹراؤزر']),         
        ],
      ),
    );
  }
  Widget sizeTextField(BuildContext context, label, bool isDefault, List<String> dropdownItems) {
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
          child: CustomDropdownSearch(dropdownItems: dropdownItems, isDefault: isDefault,)
        )
      ],
    );
  }
}