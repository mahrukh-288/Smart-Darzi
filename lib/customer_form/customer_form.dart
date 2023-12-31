import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:smart_darzi/Common%20Widgets/app_drawer.dart';
import 'package:smart_darzi/Common%20Widgets/customAppBar.dart';
import 'package:smart_darzi/Common%20Widgets/notification_btn.dart';
import 'package:smart_darzi/Common%20Widgets/search_customer_bar.dart';
import 'package:smart_darzi/customer_form/data_form.dart';
import 'package:smart_darzi/app_theme/constants.dart';
import 'package:smart_darzi/order_details/SaveOrderPage.dart';

import '../view_customers/view_customers.dart';
import 'sizing.dart';

class CustomerForm extends StatefulWidget {
  const CustomerForm({super.key});

  @override
  State<CustomerForm> createState() => _CustomerFormState();
}

class _CustomerFormState extends State<CustomerForm> {
  bool sizeSaved = false;
  bool _addOrder = false;
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
                      'Customer Data/ کسٹمر ڈیٹا',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DataForm(),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(onPressed: (){
                      customerSavedDialog(context);
                    }, child: Text('Add Customer/ کسٹمر کا اندراج کريں',  style: Theme.of(context).textTheme.headlineSmall,))
                  //   Text(
                  //     'Sizing / Maap',
                  //     style: Theme.of(context).textTheme.headlineLarge,
                  //   ),
                  //   const SizedBox(
                  //     height: 20,
                  //   ),
                  //   const Sizing(),
                  //   const SizedBox(
                  //     height: 20,
                  //   ),
                  //  ElevatedButton(
                  //   style: ElevatedButton.styleFrom(
                  //     backgroundColor: sizeSaved ? primaryColor : Colors.white.withOpacity(0.5)
                  //   ),
                  //       onPressed: () {
                  //         setState(() {sizeSaved=true;
                            
                  //         });
                  //       },
                  //       child: sizeSaved ? Row(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: [Text('Saved', style: Theme.of(context).textTheme.headlineSmall),SizedBox(width: 5,),
                  //       Container(
                  //         padding: EdgeInsets.all(3),
                  //         decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white.withOpacity(0.9)),child: Icon(Icons.check,color: primaryColor,),)],):Text(
                  //         'Save Size',
                  //         style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: primaryColor),
                  //       )),
                  // Align(
                  //   alignment: Alignment.bottomRight,
                  //   child: TextButton(onPressed: (){
                  //     Navigator.push(context, MaterialPageRoute(builder: (context) => SaveOrderPage(),));
                  //   }, child: Text('Next', style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: primaryColor),)),
                  // )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  customerSavedDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      actionsPadding: EdgeInsets.only(bottom: 30, left: 20, right: 20),
      backgroundColor: Colors.white.withOpacity(0.8),
      content: Text(
        "Customer Saved Successfully!",
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
                  builder: (context) => const CustomerForm(),
                ));
          },
            child: Text(
              'Main Page',
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
