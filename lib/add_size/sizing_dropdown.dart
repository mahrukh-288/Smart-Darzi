import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../app_theme/constants.dart';

class SizingDropdown extends StatelessWidget {
  SizingDropdown(
      {super.key,
      required this.startValue,
      required this.lastValue,
      required this.onTapped,
      required this.selectedValue});
  final Function(String) onTapped;
  final int startValue;
  final String? selectedValue;
  final int lastValue;
  late String _selectedItem;

  @override
  Widget build(BuildContext context) {
    _selectedItem = selectedValue!;
    return DropdownSearch(
      popupProps: PopupProps.menu(
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
      selectedItem: selectedValue,
      dropdownBuilder: (context, selectedItem) {
        if(selectedValue != null) {
          return Center(
            child: Text(
          _selectedItem,
          style: Theme.of(context).textTheme.labelLarge,
        ));
        }
        return Placeholder();
      },
      dropdownButtonProps: DropdownButtonProps(color: Colors.transparent),
      items: itemList(),
      onChanged: (value) {
        _selectedItem = value!;

        onTapped(_selectedItem);
      },
      dropdownDecoratorProps: DropDownDecoratorProps(
        baseStyle: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }

  List itemList() {
    List<String> items = [];
    for (int i = startValue; i <= lastValue; i++) {
      items.add('$i');
      items.add('$i  1 / 2 (آدھا)');
      items.add('$i  1 / 4 (سوا)');
      items.add('$i  3 / 4 (پونا)');
    }
    return items;
  }
}
