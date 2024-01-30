import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_darzi/add_customer/cubit/customer_cubit.dart';
import 'package:smart_darzi/add_size/add_size.dart';
import 'package:smart_darzi/customer_profile/customer_profile.dart';
import '../add_order/SaveOrderPage.dart';
import '../app_theme/constants.dart';
import '../generated/locale_keys.g.dart';
import '../models/customer.dart';

class PopUpMenu extends StatelessWidget {
  const PopUpMenu({super.key, required this.customer});
  final Customer customer;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      icon: const Icon(
        Icons.menu,
        color: iconColor,
      ),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          // row has two child icon and text.
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset('images/user.png'),
                  const SizedBox(
                    width: 8,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CustomerProfile(
                                customer: customer,
                              ),
                            ));
                      },
                      child: Text(
                        LocaleKeys.CustomerProfile.tr(),
                        style: Theme.of(context).textTheme.labelLarge,
                      ))
                ],
              ),
              const Divider(
                color: borderColor,
              )
            ],
          ),
        ),
        PopupMenuItem(
          value: 2,
          // row has two child icon and text.
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset('images/editDetail.png'),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    LocaleKeys.EditDetails.tr(),
                    style: Theme.of(context).textTheme.labelLarge,
                  )
                ],
              ),
              const Divider(
                color: borderColor,
              )
            ],
          ),
        ),
        // PopupMenuItem(
        //   value: 1,
        //   // row has two child icon and text.
        //   child: Column(
        //     children: [
        //       Row(
        //         children: [
        //           Image.asset('images/editSize.png'),
        //           const SizedBox(
        //             width: 8,
        //           ),
        //           Text(
        //            LocaleKeys.EditSize.tr(),
        //             style: Theme.of(context).textTheme.labelLarge,
        //           )
        //         ],
        //       ),
        //       const Divider(
        //         color: borderColor,
        //       )
        //     ],
        //   ),
        // ),
        PopupMenuItem(
          value: 1,
          // row has two child icon and text.
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset('images/editSize.png'),
                  const SizedBox(
                    width: 8,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddSize(
                                customer: customer
                              ),
                            ));
                      },
                      child: Text(
                       LocaleKeys.EditSize.tr(),
                        style: Theme.of(context).textTheme.labelLarge,
                      ))
                ],
              ),
              const Divider(
                color: borderColor,
              )
            ],
          ),
        ),
        PopupMenuItem(
          value: 1,
          // row has two child icon and text.
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset('images/addOrder.png'),
                  const SizedBox(
                    width: 8,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SaveOrderPage(
                                customer: customer,
                              ),
                            ));
                      },
                      child: Text(
                        LocaleKeys.AddOrder.tr(),
                        style: Theme.of(context).textTheme.labelLarge,
                      ))
                ],
              ),
              const Divider(
                color: borderColor,
              )
            ],
          ),
        ),
        PopupMenuItem(
          value: 1,
          // row has two child icon and text.
          child: Row(
            children: [
              Image.asset('images/delete.png'),
              const SizedBox(
                width: 8,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    context
                        .read<CustomerCubit>()
                        .deleteCustomer(customer.phoneNumber);
                  },
                  child: Text(
                  LocaleKeys.DeleteCustomer.tr(),
                    style: Theme.of(context).textTheme.labelLarge,
                  ))
            ],
          ),
        ),
      ],
      // offset: Offset(0, 100),
      color: primaryColor,
      elevation: 2,
    );
  }
}
