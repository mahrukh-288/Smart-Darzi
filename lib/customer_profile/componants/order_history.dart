import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_darzi/add_order/cubit/order_cubit.dart';

import '../../app_theme/constants.dart';
import '../../models/order.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({super.key, required this.orders});
  
  final List<Order> orders;


  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(border: Border.all(color: borderColor)),
        child: Column(children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 50,
            color: primaryColor,
            child: Text(
              'Order History',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
            child: DataTable(
                  border: const TableBorder(
                      horizontalInside: BorderSide(color: borderColor)),
                  columnSpacing: 30,
                  dataRowMaxHeight: 60,
                  columns: [
                    DataColumn(
                      label: Text(
                        'Status',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Order Id',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Order Type',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Order Category',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Order Placed On',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Order Completed On',
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
                            child: Text('Status'),
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
