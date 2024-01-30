import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:smart_darzi/app_theme/constants.dart';

import '../../generated/locale_keys.g.dart';
import '../../models/customer.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({super.key, required this.customer});
final Customer customer;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: primaryColor,
                shape: BoxShape.rectangle,
                border: Border.all(color: borderColor),
              ),
              child: const Icon(
                Icons.person,
                color: iconColor,
                size: 80,
              ),
            ),
            SizedBox(width: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${customer.name} ${customer.familyName}',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: primaryColor,
                      size: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${customer.phoneNumber}',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.timer, color: primaryColor, size: 20),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Last Order at Monday',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.favorite,
                      color: primaryColor,
                      size: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Customer since 2018',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(fixedSize: Size(150, 40)),
            onPressed: () {},
            child: Text(
              LocaleKeys.EditCustomer.tr(),
              style: Theme.of(context).textTheme.labelLarge,
            ))
      ],
    );
  }
}
