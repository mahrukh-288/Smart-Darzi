import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:smart_darzi/Common%20Widgets/pop_up_menu.dart';
import 'package:smart_darzi/app_theme/constants.dart';
import 'package:smart_darzi/generated/locale_keys.g.dart';

import '../models/customer.dart';

class CustomerList extends StatelessWidget {
   CustomerList({super.key, required this.customers});
   final List<Customer> customers;

   String selectedValue = 'Home';

  var values = ['User', 'Edit'];

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(5),
            color: primaryColor.withOpacity(0.6)),
        child:customers.length == 0 ? Text(LocaleKeys.noDataFound.tr(), style: Theme.of(context).textTheme.headlineSmall,): DataTable(
          border: const TableBorder(
              horizontalInside: BorderSide(color: borderColor)),
          columnSpacing: 100,
          dataRowMaxHeight: 60,
          columns: [
            DataColumn(
              label: Text(
                LocaleKeys.Picture.tr(),
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            DataColumn(
              label: Text(
                LocaleKeys.CustomerId.tr(),
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            DataColumn(
              label: Text(
                LocaleKeys.Name.tr(),
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            DataColumn(
              label: Text(
                LocaleKeys.Phone.tr(),
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            DataColumn(
              label: Text(
               LocaleKeys.FamilyName.tr(),
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            DataColumn(
              label: Text(
                LocaleKeys.Action.tr(),
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          ],
          rows: [
            for(int i=0; i<customers.length; i++)
            DataRow(cells: [
              DataCell(Container(
                decoration: BoxDecoration(
                  color: primaryColor,
                  shape: BoxShape.circle,
                  border: Border.all(color: borderColor),
                ),
                child: const Icon(
                  Icons.person,
                  color: iconColor,
                  size: 40,
                ),
              )),
              DataCell(Text(
               ' ${customers[i].cid}',
                style: Theme.of(context).textTheme.labelLarge,
              )),
              DataCell(Text(
                customers[i].name,
                style: Theme.of(context).textTheme.labelLarge,
              )),
              DataCell(Text(
                '${customers[i].phoneNumber}',
                style: Theme.of(context).textTheme.labelLarge,
              )),
              DataCell(Text(
                customers[i].familyName == null ? 'family name not found': customers[i].familyName!,
                style: Theme.of(context).textTheme.labelLarge,
              )),
              DataCell(Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.edit,
                      color: iconColor,
                    ),
                  ),
                   PopUpMenu(customer: customers[i])
                ],
              )),
            ]),
            
        
          ],
        ));
  }
}
