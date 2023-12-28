import 'package:flutter/material.dart';

import '../Common Widgets/custom_dropdown_search.dart';
import '../app_theme/constants.dart';

class StylingForm extends StatelessWidget {
   StylingForm({super.key});
 final TextEditingController _cuffController= TextEditingController();
  final TextEditingController _neckController = TextEditingController();
  final TextEditingController _pocketController = TextEditingController();
  final TextEditingController _elasticController = TextEditingController();

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
          sizeTextField(context,'Cuff Styling/کف '
, 
          false, ['Please Select','    Cuff / کف والے بازو', '    Simple /سادہ بازو']),
          sizeTextField(context,'Neck Styling/گلا',false,  ['Please Select','    Collar /کالر', '    Ban /بین ']),
          sizeTextField(context,'Button Styling/ بٹن', false , ['Please Select','    Fancy /فینسی بٹن', '    Simple /سادہ بٹن ', '    Metallic /میٹل بٹن  ']),
          sizeTextField(context,'Pocket Styling/جیب',false,  ['Please Select',' Front Pocket / سامنے والی جیب', ' 2 Side Pockets / سائڈ جیب   ']),
          sizeTextField(context,'Elastic/لاسٹک', false, ['Please Select','    Elastic / لاسٹک', 'Simple/الاسٹک']),
         
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
          width: 430,
          child: CustomDropdownSearch(dropdownItems: dropdownItems, isDefault: isDefault,)
        )
      ],
    );
  }
}