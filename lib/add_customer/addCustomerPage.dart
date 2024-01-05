import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:smart_darzi/Common%20Widgets/app_drawer.dart';
import 'package:smart_darzi/Common%20Widgets/customAppBar.dart';
import 'package:smart_darzi/Common%20Widgets/notification_btn.dart';
import 'package:smart_darzi/Common%20Widgets/search_customer_bar.dart';

import 'package:smart_darzi/app_theme/constants.dart';


import '../models/customer.dart';
import '../view_customers/view_customers.dart';
import '../add_size/sizing.dart';
import 'cubit/customer_cubit.dart';
import 'data_form.dart';

class CustomerForm extends StatelessWidget {
  CustomerForm({super.key});

  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _familyController = TextEditingController();



  bool sizeSaved = false;

  bool _addOrder = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CustomerCubit, CustomerState>(
      listener: (ctx, state) {
        if (state is CustomerRegistered) {
          customerSavedDialog(context);
        }
        else if(state is Failure){
             showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                actionsPadding:
                    EdgeInsets.only(bottom: 30, left: 20, right: 20),
                backgroundColor: Colors.white.withOpacity(0.8),
                content: Text(
                  "Something went wrong!",
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: primaryColor, fontWeight: FontWeight.w600),
                ),
              );
            },
          );
        }
      },
      child: Scaffold(
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
                      Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 60, vertical: 40),
                          margin: const EdgeInsets.symmetric(horizontal: 60),
                          decoration: BoxDecoration(
                              border: Border.all(color: borderColor),
                              borderRadius: BorderRadius.circular(5),
                              color: primaryColor.withOpacity(0.6)),
                          child: Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomerFormField(
                                      label: 'Phone # /فون نمبر',
                                      controller: _phoneController),
                                  TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Check Availability',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium
                                            ?.copyWith(color: Colors.red[900]),
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              CustomerFormField(
                                  label: ' Name / نام',
                                  controller: _nameController),
                              SizedBox(
                                height: 20,
                              ),
                              CustomerFormField(
                                label:
                                    'Family Nme / Nick Name/ خاندان کا نام/ مشہور نام',
                                controller: _familyController,
                              ),
                            ],
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      BlocBuilder<CustomerCubit, CustomerState>(
                        builder: (context, state) {
                          if(state is LoadingCustomer){
                            return CircularProgressIndicator();
                          }
                          return ElevatedButton(
                              onPressed: () {
                                Customer customer = Customer(
                                    name: _nameController.text,
                                
                                    phoneNumber: int.parse(_phoneController.text),
                                    familyName: _familyController.text);
                                context
                                    .read<CustomerCubit>()
                                    .registerCustomer(customer);
                              },
                              child: Text(
                                'Add Customer/ کسٹمر کا اندراج کريں',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ));
                        },
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
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
                fixedSize: const Size(150, 60),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                side: const BorderSide(color: primaryColor)),
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CustomerForm(),
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
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(150, 60),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
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
