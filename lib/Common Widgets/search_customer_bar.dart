import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../add_customer/cubit/customer_cubit.dart';
import '../app_theme/constants.dart';
import '../generated/locale_keys.g.dart';

class SearchCustomerBar extends StatefulWidget {
  SearchCustomerBar({super.key});

  @override
  State<SearchCustomerBar> createState() => _SearchCustomerBarState();
}

class _SearchCustomerBarState extends State<SearchCustomerBar> {
  final TextEditingController _searchController = TextEditingController();

  List<String> dropdownValues = [LocaleKeys.all.tr(),LocaleKeys.byName.tr(), LocaleKeys.byId.tr(), LocaleKeys.byPhone.tr()];

  int searchBy = 0;

  late String selectedValue;
  @override
  void initState() {
    // TODO: implement initState
    selectedValue = dropdownValues.first;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            height: 40,
            width: 40,
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 1),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                border: Border.all(color: borderColor)),
            child: const Icon(
              Icons.menu,
              color: iconColor,
            )),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          width: 500,
          height: 40,
          child: TextField(
            style: Theme.of(context).textTheme.labelLarge,
            onSubmitted: (value) {},
            controller: _searchController,
            decoration: InputDecoration(
                prefixIcon: IconButton(
                  onPressed: () {
                    if (searchBy == 1) {
                      context
                          .read<CustomerCubit>()
                          .getCustomerByName(_searchController.text);
                    } else if (searchBy == 2) {
                      context
                          .read<CustomerCubit>()
                          .getCustomerById(int.parse(_searchController.text));
                    } else if(searchBy == 3){
                      context.read<CustomerCubit>().getCustomerByPhone(
                          int.parse(_searchController.text));
                    }
                  },
                  icon: Icon(
                    Icons.search,
                    color: iconColor,
                  ),
                ),
                hintText: LocaleKeys.search.tr(),
                hintStyle: Theme.of(context).textTheme.labelLarge),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Container(
          height: 40,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              border: Border.all(color: borderColor),
              borderRadius: BorderRadius.circular(5)),
          child: Row(
            children: [
               Image.asset(
                 'images/filterIcon.png',
                 width: 30,
                 height: 20,
               ),
              DropdownButton<String>(
                focusColor: Colors.transparent,
               
                dropdownColor: primaryColor,
              
                iconEnabledColor: Colors.transparent,
                padding: EdgeInsets.only(right:5),
                style: Theme.of(context).textTheme.labelLarge,
                value: selectedValue,
                
                items: dropdownValues
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                 
                  if (value == LocaleKeys.byName.tr()) {
                    searchBy = 1;
                  } else if (value == LocaleKeys.byId.tr()) {
                    searchBy = 2;
                  } else {
                    searchBy = 3;
                  }
                  setState(() {
                     selectedValue = value!;
                  });
                },
              ),

            
              const SizedBox(
                width: 10,
              ),
              CloseButton(color: iconColor, onPressed: () {
                setState(() {
                  context.read<CustomerCubit>().getAllCustomers();
                _searchController.clear();
                selectedValue = dropdownValues.first;
                searchBy = 0;
                });
                
              },)
              // Text(
              //   LocaleKeys.FilterBy.tr(),
              //   style: Theme.of(context).textTheme.labelLarge,
              // )
            ],
          ),
        ),
      ],
    );
  }
}
