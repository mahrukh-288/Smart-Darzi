import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:smart_darzi/Common%20Widgets/app_drawer.dart';
import 'package:smart_darzi/Common%20Widgets/customAppBar.dart';
import 'package:smart_darzi/order_details/embroidoryForm.dart';
import 'package:smart_darzi/order_details/order_details_form.dart';
import 'package:smart_darzi/order_details/stylingForm.dart';

import '../Common Widgets/notification_btn.dart';
import '../app_theme/constants.dart';

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
                          // setState(() {
                          //   _addOrder = true;
                          // });
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
  
}