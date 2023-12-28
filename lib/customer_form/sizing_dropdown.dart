import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../app_theme/constants.dart';

class SizingDropdown extends StatelessWidget {
  SizingDropdown(
      {super.key, required this.startValue, required this.lastValue});
  final int startValue;
  final int lastValue;
  String _selectedItem = '';
  @override
  Widget build(BuildContext context) {
    return DropdownSearch(
      popupProps: PopupProps.menu(
          title: Text(
            'Please Select',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          fit: FlexFit.loose,
          itemBuilder: (context, item, isSelected) {
            return Padding(
                padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
                child: Text(
                  '$item',
                  style: Theme.of(context).textTheme.labelLarge,
                ));
          },
          menuProps: MenuProps(backgroundColor: primaryColor)),

      selectedItem: _selectedItem,

      dropdownButtonProps: DropdownButtonProps(color: Colors.transparent),
      items: itemList(),
      // onChanged: (value) {
      //   _selectedItem = value!;
      // },

      dropdownDecoratorProps: DropDownDecoratorProps(
        baseStyle: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }

  List itemList() {
    List<String> items = [];
    for (int i = startValue; i <= lastValue; i++) {
      items.add('$i');
      items.add('$i  1 / 2');
      items.add('$i  1 / 4');
      items.add('$i  3 / 4');
    }
    return items;
  }
}
