import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:smart_darzi/add_customer/cubit/customer_cubit.dart';
import 'package:smart_darzi/add_order/SaveOrderPage.dart';
import 'package:smart_darzi/add_order/cubit/order_cubit.dart';
import 'package:smart_darzi/customer_profile/componants/order_history.dart';
import 'package:smart_darzi/customer_profile/componants/size_table.dart';
import 'package:smart_darzi/customer_profile/componants/uder_details.dart';
import 'package:smart_darzi/models/customer_profile.dart';
import 'package:smart_darzi/models/order.dart';
import 'package:smart_darzi/models/size.dart';
import 'package:smart_darzi/view_customers/view_customers.dart';

import '../Common Widgets/app_drawer.dart';
import '../app_theme/constants.dart';
import '../generated/locale_keys.g.dart';
import '../models/customer.dart';

class CustomerProfile extends StatefulWidget {
  const CustomerProfile({super.key, required this.customer});
  final Customer customer;
  @override
  State<CustomerProfile> createState() => _CustomerProfileState();
}

class _CustomerProfileState extends State<CustomerProfile> {
  SizeModel size = SizeModel();
  List<Order> orders = [];
  CustomerProfileModel profile = CustomerProfileModel();

  @override
  void initState() {
    context.read<CustomerCubit>().getCustomerProfile(widget.customer.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CustomerCubit, CustomerState>(
      listener: (context, state) {
        if (state is CustomerDeleted) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ViewCustomers(),
              ));
        }
        else if(state is FailureInDeletingCustomer){
          print('failure in deleting customer');
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                actionsPadding:
                    EdgeInsets.only(bottom: 30, left: 20, right: 20),
                backgroundColor: Colors.white.withOpacity(0.8),
                content: Text(
                  state.error,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: primaryColor, fontWeight: FontWeight.w600),
                ),
              );
            },
          );
          context.read<CustomerCubit>().getCustomerProfile(widget.customer.id);
        }
      },
      child: Scaffold(
        backgroundColor: primaryColor.withOpacity(0.6),
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
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.sizeOf(context).width*0.1,
                          vertical: 30),
                      child: Column(
                        children: [
                          Align(
                          alignment: Alignment.topLeft,
                          child: BackButton(
                            color: primaryColor,
                          ),
                        ),
                          BlocBuilder<CustomerCubit, CustomerState>(
                            builder: (context, state) {
                              if(state is CustomerProfileFetched){
                                profile = state.profile;
                                return Column(
                                children: [
                                  UserDetails(
                                    customer: profile.customer!,
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  SizeTable(size: profile.size, customer: widget.customer,
                                   
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  OrderHistory(
                                    orders: profile.orders,
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  // ElevatedButton(
                                  //     style: ElevatedButton.styleFrom(
                                  //         fixedSize: const Size(350, 50),
                                  //         backgroundColor: Colors.red[900]),
                                  //     onPressed: () {
                                  //       context
                                  //           .read<CustomerCubit>()
                                  //           .deleteCustomer(
                                  //               widget.customer.phoneNumber);
                                  //     },
                                  //     child: Text(
                                  //      LocaleKeys.DeleteCustomer.tr(),
                                  //       style: Theme.of(context)
                                  //           .textTheme
                                  //           .headlineSmall,
                                  //     ))
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          fixedSize: const Size(350, 50),
                                          backgroundColor: Colors.red[900]),
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => SaveOrderPage(customer: widget.customer),));
                                      },
                                      child: Text(
                                       LocaleKeys.AddOrder.tr(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall,
                                      ))
                                ],
                              );
                              }
                              return Container(
                                alignment: Alignment.center,
                                height: 100,
                                width: 100,
                                child: CircularProgressIndicator(color: primaryColor,));
                            },
                          ),
                        ],
                      )),
                ),
              ),
            ]),
      ),
    );
  }
}
