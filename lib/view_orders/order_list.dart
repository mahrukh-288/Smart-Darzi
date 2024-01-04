import 'package:flutter/material.dart';

import '../app_theme/constants.dart';
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
        child: DataTable(
          border: const TableBorder(
              horizontalInside: BorderSide(color: borderColor)),
          columnSpacing: 80,
          dataRowMaxHeight: 60,
          columns: [
            DataColumn(
              label: Text(
                'Order Id',
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            DataColumn(
              label: Text(
                'Customer Name',
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            DataColumn(
              label: Text(
                'Phone No',
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
                'Order Type',
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            DataColumn(
              label: Text(
                'Status',
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            DataColumn(
              label: Text(
                'Action',
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          ],
          rows: [
            for(int i=0; i<orders.length; i++)
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
                orders[i].customerId,
                style: Theme.of(context).textTheme.labelLarge,
              )),
              DataCell(Text(
                '${orders[i].bookNumber}',
                style: Theme.of(context).textTheme.labelLarge,
              )),
              DataCell(Text(
                '${orders[i].designNumber}',
                style: Theme.of(context).textTheme.labelLarge,
              )),
              DataCell(Text(
                orders[i].embroidery,
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
                  child: Text('Status'),
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
