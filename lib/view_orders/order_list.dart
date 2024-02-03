import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../app_theme/constants.dart';
import '../generated/locale_keys.g.dart';
import '../models/order.dart';

class OrderList extends StatelessWidget {
  const OrderList({super.key, required this.orders});
  final List<Order> orders;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(5),
            color: primaryColor.withOpacity(0.6)),
        child:orders.length == 0 ? Text(LocaleKeys.noDataFound.tr(), style: Theme.of(context).textTheme.headlineSmall,): DataTable(
          border: const TableBorder(
              horizontalInside: BorderSide(color: borderColor)),
          columnSpacing: 80,
          dataRowMaxHeight: 60,
          columns: [
            DataColumn(
              label: Text(
                LocaleKeys.OrderId.tr(),
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            DataColumn(
              label: Text(
                LocaleKeys.CustomerName.tr(),
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
                LocaleKeys.OrderCategory.tr(),
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            DataColumn(
              label: Text(
                LocaleKeys.OrderType.tr(),
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            DataColumn(
              label: Text(
                LocaleKeys.Status.tr(),
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
            for(int i=0; i<orders.length; i++)
            DataRow(cells: [
              DataCell(Text(
                orders[i].id.substring(1,6),
                style: Theme.of(context).textTheme.labelLarge,
              )),
              DataCell(Text(
                orders[i].customerId.substring(1,6),
                style: Theme.of(context).textTheme.labelLarge,
              )),
              DataCell(Text(
                '${orders[i].bookNumber}',
                style: Theme.of(context).textTheme.labelLarge,
              )),
              DataCell(Text(
                '${orders[i].orderCategory}',
                style: Theme.of(context).textTheme.labelLarge,
              )),
              DataCell(Text(
                orders[i].orderType,
                style: Theme.of(context).textTheme.labelLarge,
              )),
              DataCell(Badge(
                alignment: Alignment.topLeft,
                child: Container(
                  alignment: Alignment.center,
                  height: 20,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(orders[i].orderStatus),
                ),
              )),
              DataCell(IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.fast_forward,
                  color: iconColor,
                ),
              )),
            ]),
          ],
        ));
  }
}
