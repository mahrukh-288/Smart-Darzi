import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:smart_darzi/app_theme/constants.dart';

class CustomDropdownSearch extends StatelessWidget {
  CustomDropdownSearch(
      {super.key, required this.dropdownItems, required this.isDefault});
  final bool isDefault;
  final List<String> dropdownItems;

  String _selectedItem = '';
  @override
  Widget build(BuildContext context) {
    return DropdownSearch(
      popupProps: PopupProps.menu(
 
        fit: FlexFit.loose,
       menuProps: MenuProps(backgroundColor: primaryColor.withOpacity(0.6), )
      ),
      
      enabled: !isDefault,
      selectedItem: _selectedItem,
      dropdownBuilder: (context, selectedItem) {
        if (isDefault) {
          return Center(child: Text('Default', style: Theme.of(context).textTheme.labelLarge,));
        }
        ;
        return Text(_selectedItem, style: Theme.of(context).textTheme.labelLarge,);
      },
      dropdownButtonProps: DropdownButtonProps(color: Colors.transparent),
      items: dropdownItems,
      onChanged: (value) {
        _selectedItem = value!;
      },
    );
  }
}
