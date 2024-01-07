import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:smart_darzi/customer_profile/customer_profile.dart';
import 'package:smart_darzi/view_customers/view_customers.dart';
import 'package:smart_darzi/view_orders/viewOrdersPage.dart';

import '../add_customer/addCustomerPage.dart';
import '../app_theme/constants.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ResponsiveBreakpoints.of(context).largerThan(TABLET)
          ? MediaQuery.sizeOf(context).width * 0.2
          : double.infinity,
          height: ResponsiveBreakpoints.of(context).largerThan(TABLET)
          ? double.infinity
          : 100,
      color: primaryColor,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Flex(
        direction: ResponsiveBreakpoints.of(context).largerThan(TABLET) ? Axis.vertical : Axis.horizontal,
        mainAxisAlignment:  ResponsiveBreakpoints.of(context).largerThan(TABLET) ?MainAxisAlignment.start: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       
         const SizedBox(
          height: 20,
        ),
        drawerItem(context, 'images/home.png', 'Home'),
        const SizedBox(
          height: 20,
        ),
        drawerItem(context, 'images/customers.png', 'Customers'),
        const SizedBox(
          height: 20,
        ),
        drawerItem(context, 'images/workers.png', 'Workers'),
        const SizedBox(
          height: 20,
        ),
        drawerItem(context, 'images/workers.png', 'Orders'),
        const SizedBox(
          height: 20,
        ),
        drawerItem(context, 'images/settings.png', 'Profile Settings'),
        const SizedBox(
          height: 20,
        ),
        drawerItem(context, 'images/logout.png', 'Logout')
      ]),
    );
  }

  Widget drawerItem(BuildContext context, icon, String label) {
    return Row(
      children: [
        Image.asset(
          icon,
          height: 20,
          width: 20,
        ),
        const SizedBox(
          width: 15,
        ),
        InkWell(
            onTap: () {
              if(label == 'Home') {
                Navigator.push(context,MaterialPageRoute(builder: (context) => CustomerForm(),));
              }
              else if(label == 'Customers')
              {
                Navigator.push(context,MaterialPageRoute(builder: (context) => ViewCustomers(),));
              }
              else if(label == 'Orders'){
                 Navigator.push(context,MaterialPageRoute(builder: (context) => ViewOrdersPage(),));
              }
              else if(label == 'Profile Settings'){
                 Navigator.push(context,MaterialPageRoute(builder: (context) => CustomerProfile(phoneNo: '',),));
              }

            },
            child: Text(
              label,
              style: ResponsiveBreakpoints.of(context).largerThan(MOBILE)
                  ? Theme.of(context).textTheme.labelLarge
                  : Theme.of(context).textTheme.labelSmall,
            )),
      ],
    );
  }
}
