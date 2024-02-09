import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_darzi/add_order/cubit/order_cubit.dart';

import '../../app_theme/constants.dart';
import '../../generated/locale_keys.g.dart';
import '../../models/order.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({super.key, required this.orders});
  
  final List<Order> orders ;


  @override
  Widget build(BuildContext context) {
    
  
    return  
    Container(
        decoration: BoxDecoration(border: Border.all(color: borderColor)),
        child: Column(children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 50,
            color: primaryColor,
            child: Text(
              LocaleKeys.OrderHistory.tr(),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
         Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child:orders.length == 0 ? Text(LocaleKeys.noOrders.tr(), style: Theme.of(context).textTheme.headlineSmall,) : DataTable(
                  border: const TableBorder(
                      horizontalInside: BorderSide(color: borderColor)),
                  columnSpacing: 30,
                  dataRowMaxHeight: 60,
                  columns: [
                    DataColumn(
                      label: Text(
                        LocaleKeys.Status.tr(),
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                    DataColumn(
                      label: Text(
                       LocaleKeys.OrderId.tr(),
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
                        LocaleKeys.OrderCategory.tr(),
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                    DataColumn(
                      label: Text(
                     LocaleKeys.OrderPlacedOn.tr(),
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        LocaleKeys.OrderCompletedOn.tr(),
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                  ],
                  rows: [
                    for (int i = 0; i < orders.length; i++)
                      DataRow(cells: [
                        DataCell(
                          Badge(
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
                        DataCell(Text(
                          orders[i].id.substring(1,6),
                          style: Theme.of(context).textTheme.labelLarge,
                        )),
                        DataCell(Text(
                          '${orders[i].orderType}',
                          style: Theme.of(context).textTheme.labelLarge,
                        )),
                        DataCell(Text(
                          '${orders[i].orderCategory}',
                          style: Theme.of(context).textTheme.labelLarge,
                        )),
                        DataCell(Text(
                          'Placed on Monday',
                          style: Theme.of(context).textTheme.labelLarge,
                        )),
                        DataCell(Text(
                          'Completed on Friday',
                          style: Theme.of(context).textTheme.labelLarge,
                        )),
                      ]),
                  ],
                )
          )
        ]));
  }
}
