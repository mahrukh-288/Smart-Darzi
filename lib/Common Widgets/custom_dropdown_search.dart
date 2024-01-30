import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:smart_darzi/app_theme/constants.dart';

class CustomDropdownSearch extends StatelessWidget {
  CustomDropdownSearch(
      {super.key, required this.dropdownItems, required this.isDefault, required this.onValueChanged});
  final bool isDefault;
  final List<String> dropdownItems;
  final Function(String) onValueChanged;

  String _selectedItem = '';
  @override
  Widget build(BuildContext context) {
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
          menuProps: MenuProps(
            backgroundColor: primaryColor,
          )),
      enabled: !isDefault,
      selectedItem: _selectedItem,
      dropdownBuilder: (context, selectedItem) {
     
        return Text(
          _selectedItem,
          style: Theme.of(context).textTheme.labelLarge,
        );
      },
      dropdownButtonProps: DropdownButtonProps(color: Colors.transparent),
      items: dropdownItems,
      onChanged: (value) {
        _selectedItem = value as String ;
        onValueChanged(value);
      },
    );
  }
}
