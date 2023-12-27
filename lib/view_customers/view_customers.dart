import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:smart_darzi/Common%20Widgets/app_drawer.dart';
import 'package:smart_darzi/Common%20Widgets/notification_btn.dart';
import 'package:smart_darzi/Common%20Widgets/search_customer_bar.dart';
import 'package:smart_darzi/view_customers/customer_list.dart';
import 'package:smart_darzi/app_theme/constants.dart';

class ViewCustomers extends StatelessWidget {
  const ViewCustomers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor.withOpacity(0.3),
      body: Flex(
           direction: ResponsiveBreakpoints.of(context).largerThan(TABLET) ? Axis.horizontal : Axis.vertical,
           crossAxisAlignment: CrossAxisAlignment.start ,
        children: [
        const AppDrawer(),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SearchCustomerBar(),
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
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Filter By',
                              style: Theme.of(context).textTheme.labelLarge,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                     NotificationBtn()
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Active Customer List',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomerList()
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
