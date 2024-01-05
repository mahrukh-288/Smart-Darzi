import 'package:flutter/material.dart';

import '../../Common Widgets/custom_dropdown_search.dart';
import '../../app_theme/constants.dart';

class StylingForm extends StatelessWidget {
  StylingForm({super.key});

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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Cuff Styling/کف ',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                  height: 40,
                  width: 250,
                  child: CustomDropdownSearch(
                    dropdownItems: ['Cuff / کف والے بازو', 'Simple /سادہ بازو'],
                    isDefault: false,
                    onValueChanged: (String) {},
                  ))
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Neck Styling/گلا',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                  height: 40,
                  width: 250,
                  child: CustomDropdownSearch(
                    dropdownItems: ['Collar /کالر', 'Ban /بین '],
                    isDefault: false,
                    onValueChanged: (String) {},
                  ))
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Button Styling/ بٹن',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                  height: 40,
                  width: 250,
                  child: CustomDropdownSearch(
                    dropdownItems: [
                      'Fancy /فینسی بٹن',
                      'Simple /سادہ بٹن ',
                      'Metallic /میٹل بٹن'
                    ],
                    isDefault: false,
                    onValueChanged: (String) {},
                  ))
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pocket Styling/جیب',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                  height: 40,
                  width: 250,
                  child: CustomDropdownSearch(
                    dropdownItems: [
                      'Front Pocket / سامنے والی جیب',
                      '2 Side Pockets / سائڈ جیب ',
                      'Trouser Pocket / ٹراؤزر جیب ',
                      ' 1 Front Pocket+2Side+1 Shalwar',
                      ' 0 Front Pocket+0 Side+0Shalwar',
                      ' 0 Front + 2 Side+ 1 Trouser Pocket',
                      ' 2 Front + 2 Side+ 1 Shalwar',
                      ' 0 Front + 1 Left Side+ 0 Shalwar',
                      ' 0 Front + 1 Right Side+ 0 Shalwar'
                    ],
                    isDefault: false,
                    onValueChanged: (String) {},
                  ))
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Elastic/لاسٹک',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                  height: 40,
                  width: 250,
                  child: CustomDropdownSearch(
                    dropdownItems: ['Elastic / لاسٹک', 'Simple/نالا'],
                    isDefault: false,
                    onValueChanged: (String) {},
                  ))
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Embroidery / کڑھائی',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                  height: 40,
                  width: 250,
                  child: CustomDropdownSearch(
                    dropdownItems: ['No / کوئی نہیں', 'Yes / جی ہاں'],
                    isDefault: false,
                    onValueChanged: (String) {},
                  ))
            ],
          ),
//           sizeTextField(context,'Cuff Styling/کف '
// ,
//           false, ['Cuff / کف والے بازو', 'Simple /سادہ بازو']),
//           sizeTextField(context,'Neck Styling/گلا',false,  ['Collar /کالر', 'Ban /بین ']),
//           sizeTextField(context,'Button Styling/ بٹن', false , ['Fancy /فینسی بٹن', 'Simple /سادہ بٹن ', 'Metallic /میٹل بٹن']),
//           sizeTextField(context,'Pocket Styling/جیب',false,  ['Front Pocket / سامنے والی جیب', '2 Side Pockets / سائڈ جیب ','Trouser Pocket / ٹراؤزر جیب ', ' 1 Front Pocket+2Side+1 Shalwar',' 0 Front Pocket+0 Side+0Shalwar', ' 0 Front + 2 Side+ 1 Trouser Pocket',' 2 Front + 2 Side+ 1 Shalwar',' 0 Front + 1 Left Side+ 0 Shalwar',' 0 Front + 1 Right Side+ 0 Shalwar']),
//           sizeTextField(context,'Elastic/لاسٹک', false, ['Elastic / لاسٹک', 'Simple/نالا']),
//           sizeTextField(context,'Embroidery / کڑھائی', false, ['No / کوئی نہیں','Yes / جی ہاں']),
        ],
      ),
    );
  }

  Widget sizeTextField(
      BuildContext context, label, bool isDefault, List<String> dropdownItems) {
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
            width: 250,
            child: CustomDropdownSearch(
              dropdownItems: dropdownItems,
              isDefault: isDefault,
              onValueChanged: (String) {},
            ))
      ],
    );
  }
}
