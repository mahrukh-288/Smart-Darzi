import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:smart_darzi/Common%20Widgets/app_drawer.dart';
import 'package:smart_darzi/Common%20Widgets/customAppBar.dart';
import 'package:smart_darzi/order_details/embroidoryForm.dart';
import 'package:smart_darzi/order_details/order_details_form.dart';
import 'package:smart_darzi/order_details/stylingForm.dart';

import '../Common Widgets/notification_btn.dart';
import '../app_theme/constants.dart';
import '../view_customers/view_customers.dart';

class SaveOrderPage extends StatelessWidget {
  const SaveOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: primaryColor.withOpacity(0.3),
      body: Flex(
        direction: ResponsiveBreakpoints.of(context).largerThan(TABLET)
            ? Axis.horizontal
            : Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppDrawer(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                   CustomAppBar(),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Order Details',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    OrderDetailsForm(),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Sizing / Maap',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    StylingForm(),
                     const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Embroidary Details',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    EmbroidaryFom(),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          orderSavedDialog(context);
                        },
                        child: Text(
                          'Save Order',
                          style: Theme.of(context).textTheme.headlineSmall,
                        )),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
   orderSavedDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      actionsPadding: EdgeInsets.only(bottom: 30, left: 20, right: 20),
      backgroundColor: Colors.white.withOpacity(0.8),
      content: Text(
        "Order Saved Successfully!",
        style: Theme.of(context)
            .textTheme
            .labelLarge
            ?.copyWith(color: primaryColor, fontWeight: FontWeight.w600),
      ),
      actions: [
        OutlinedButton(
            style: OutlinedButton.styleFrom(
                fixedSize: const Size(150, 60), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                side: const BorderSide(color: primaryColor)),
            onPressed: ()  {
            Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ViewCustomers(),
                ));
          },
            child: Text(
              'Go to main page',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(color: primaryColor),
            )),
        const SizedBox(
          width: 30,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ViewCustomers(),
                ));
          },
          style: ElevatedButton.styleFrom(fixedSize: const Size(150, 60), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),),
          child: Text(
            'Customer View',
            style: Theme.of(context).textTheme.labelLarge,
          ),
        )
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}