import 'package:flutter/material.dart';
import 'package:smart_darzi/customer_form/sizing.dart';
import 'package:smart_darzi/app_theme/constants.dart';

class DataForm extends StatefulWidget {
  const DataForm({super.key});

  @override
  State<DataForm> createState() => _DataFormState();
}

class _DataFormState extends State<DataForm> {
  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _familyController = TextEditingController();

  final TextEditingController _idController = TextEditingController();

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
          spacing: 20,
          children: [
            customerDataField(
                context, 'Phone # /فون نمبر', _phoneController, true),
            customerDataField(
                context, 'Id- Number / آئی - ڈی نمبر', _idController, false),
            customerDataField(context, ' Name / نام', _nameController, false),
            customerDataField(
                context,
                'Family Nme / Nick Name/ خاندان کا نام/ مشہور نام',
                _familyController,
                false),

            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Text(
            //       'Id No.',
            //       style: Theme.of(context).textTheme.labelLarge,
            //     ),
            //     const SizedBox(
            //       height: 5,
            //     ),
            //     SizedBox(
            //       height: 40,
            //       width: 430,
            //       child: TextField(
            //         cursorColor: Colors.white,
            //         decoration: InputDecoration(
            //             hintText: 'Default',
            //             hintStyle: Theme.of(context).textTheme.labelLarge),
            //       ),
            //     )
            //   ],
            // ),
          ],
        ));
  }

  Widget customerDataField(BuildContext context, String label,
      TextEditingController controller, bool enabled) {
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
          width: 450,
          child: TextField(
            enabled: enabled,
            cursorColor: borderColor,
            style: Theme.of(context).textTheme.labelLarge,
            controller: controller,
          ),
        ),
        if (enabled) 
          TextButton(
              onPressed: () {},
              child: Text(
                'Check Availability',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(color: Colors.red[900]),
              ))
        
      ],
    );
  }
}
