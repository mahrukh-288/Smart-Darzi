import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:smart_darzi/Common%20Widgets/app_drawer.dart';
import 'package:smart_darzi/Common%20Widgets/customAppBar.dart';
import 'package:smart_darzi/Common%20Widgets/notification_btn.dart';
import 'package:smart_darzi/Common%20Widgets/search_customer_bar.dart';

import 'package:smart_darzi/app_theme/constants.dart';
import 'package:smart_darzi/customer_profile/customer_profile.dart';

import '../generated/locale_keys.g.dart';
import '../models/customer.dart';
import '../view_customers/view_customers.dart';
import 'cubit/customer_cubit.dart';
import 'data_form.dart';

class CustomerForm extends StatelessWidget {
  CustomerForm({super.key});

  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _familyController = TextEditingController();
  final TextEditingController _idController = TextEditingController();

  bool available = true;
  final _formKey = GlobalKey<FormState>();

  bool _addOrder = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CustomerCubit, CustomerState>(
      listener: (ctx, state) {
        if (state is CustomerRegistered) {
          
          context
              .read<CustomerCubit>()
              .getCustomerByPhone(int.parse(_phoneController.text));
              
        } else if (state is CustomerFetchedByPhone) {
          customerSavedDialog(context, state.customer);
        } 
        // else if (state is Failure) {
        //   showDialog(
        //     context: context,
        //     builder: (BuildContext context) {
        //       return AlertDialog(
        //         actionsPadding:
        //             EdgeInsets.only(bottom: 30, left: 20, right: 20),
        //         backgroundColor: Colors.white.withOpacity(0.8),
        //         content: Text(
        //           state.error,
        //           style: Theme.of(context).textTheme.labelLarge?.copyWith(
        //               color: primaryColor, fontWeight: FontWeight.w600),
        //         ),
        //       );
        //     },
        //   );
        // }
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
                  child: BlocBuilder<CustomerCubit, CustomerState>(
                    builder: (context, state) {
                      if (state is CustomerNotAvailable) {
                        available = false;
                      }
                      return Column(
                        children: [
                          CustomAppBar(),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            LocaleKeys.CustomerData,
                            style: Theme.of(context).textTheme.headlineLarge,
                          ).tr(),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 60, vertical: 40),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 60),
                              decoration: BoxDecoration(
                                  border: Border.all(color: borderColor),
                                  borderRadius: BorderRadius.circular(5),
                                  color: primaryColor.withOpacity(0.6)),
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              LocaleKeys.Phone.tr(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelLarge,
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            SizedBox(
                                              height: 40,
                                              width: 500,
                                              child: TextFormField(
                                                 inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                                validator: (value){

                                                  if(value == null || value.isEmpty){
                                                    return LocaleKeys.fieldRequired.tr();

                                                  }
                                                  if(value.length != 11){
                                                    return LocaleKeys.phoneDigitsLength.tr();
                                                  }
                                                  return null;
                                                }
                                        ,
                                                cursorColor: borderColor,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge,
                                                controller: _phoneController,
                                              ),
                                            ),
                                          ],
                                        ),
                                        TextButton(
                                            onPressed: () {
                                              
                                              context
                                                  .read<CustomerCubit>()
                                                  .getCustomerByPhone(int.parse(
                                                      _phoneController.text));
                                             
                                            },
                                            child: Text(
                                              LocaleKeys.CheckAvailability,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium
                                                  ?.copyWith(
                                                      color: Colors.red[900]),
                                            ).tr())
                                      ],
                                    ),
                                    if (!available)
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                LocaleKeys.Name.tr(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge,
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              SizedBox(
                                                height: 40,
                                                width: 500,
                                                child: TextFormField(
                                                   autovalidateMode: AutovalidateMode.onUserInteraction,
                                                  validator: (value) =>
                                                      _validate(value),
                                                  cursorColor: borderColor,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelLarge,
                                                  controller: _nameController,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                LocaleKeys.CustomerId.tr(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge,
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              SizedBox(
                                                height: 40,
                                                width: 500,
                                                child: TextFormField(
                                                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                                   autovalidateMode: AutovalidateMode.onUserInteraction,
                                                  validator: (value) =>
                                                      _validate(value),
                                                  cursorColor: borderColor,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelLarge,
                                                  controller: _idController,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                
                                                LocaleKeys.FamilyName.tr(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge,
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              SizedBox(
                                                height: 40,
                                                width: 500,
                                                child: TextFormField(
                                                   autovalidateMode: AutovalidateMode.onUserInteraction,
                                                  cursorColor: borderColor,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelLarge,
                                                  controller: _familyController,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                  ],
                                ),
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          BlocBuilder<CustomerCubit, CustomerState>(
                            builder: (context, state) {
                              if (state is LoadingCustomer) {
                                return CircularProgressIndicator();
                              }

                              if (!available) {
                                return ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                      Customer customer = Customer();
                                      customer.cid =
                                          int.parse(_idController.text);
                                      customer.name = _nameController.text;
                                      customer.phoneNumber =
                                          int.parse(_phoneController.text);
                                          if(_familyController.text.isNotEmpty) {
                                            customer.familyName =
                                          _familyController.text;
                                          }
                                      context
                                          .read<CustomerCubit>()
                                          .registerCustomer(customer);
                                     } },
                                    child: Text(
                                      LocaleKeys.AddCustomer,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall,
                                    ).tr());
                              } else {
                                return SizedBox.shrink();
                              }
                            },
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  customerSavedDialog(BuildContext context, Customer customer) {
    AlertDialog alert = AlertDialog(
      actionsPadding: EdgeInsets.only(bottom: 30, left: 20, right: 20),
      backgroundColor: Colors.white.withOpacity(0.8),
      content: Text(
        available? LocaleKeys.userExists.tr(): LocaleKeys.savedSuccessfully.tr(),
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
              // Navigator.pop(context);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ViewCustomers(),
                  ));
            },
            child: Text(
              LocaleKeys.CustomerView.tr(),
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
            //Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CustomerProfile(
                    customer: customer,
                  ),
                ));
          },
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(150, 60),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
          child: Text(
            LocaleKeys.CustomerProfile.tr(),
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
        OutlinedButton(
            style: OutlinedButton.styleFrom(
                fixedSize: const Size(150, 60),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                side: const BorderSide(color: primaryColor)),
            onPressed: () {
              // Navigator.pop(context);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CustomerForm(),
                  ));
            },
            child: Text(
              LocaleKeys.goToHome.tr(),
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(color: primaryColor),
            )),
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

  _validate(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.fieldRequired.tr();
    }
    return null;
  }
}
