import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:smart_darzi/Common%20Widgets/app_drawer.dart';
import 'package:smart_darzi/Common%20Widgets/notification_btn.dart';
import 'package:smart_darzi/Common%20Widgets/search_customer_bar.dart';
import 'package:smart_darzi/add_customer/cubit/customer_cubit.dart';
import 'package:smart_darzi/view_customers/customer_list.dart';
import 'package:smart_darzi/app_theme/constants.dart';

import '../generated/locale_keys.g.dart';
import '../models/customer.dart';

class ViewCustomers extends StatefulWidget {
  const ViewCustomers({super.key});

  @override
  State<ViewCustomers> createState() => _ViewCustomersState();
}

class _ViewCustomersState extends State<ViewCustomers> {
  List<Customer> customers = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CustomerCubit>().getAllCustomers();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CustomerCubit, CustomerState>(
      listener: (context, state) {
        if(state is CustomerDeleted){
          context.read<CustomerCubit>().getAllCustomers();
        }
        if(state is FailureInDeletingCustomer){
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                actionsPadding:
                    const EdgeInsets.only(bottom: 30, left: 20, right: 20),
                backgroundColor: Colors.white.withOpacity(0.8),
                content: Text(
                  state.error,
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.topLeft,
                          child: BackButton(
                            color: primaryColor,
                          ),
                        ),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [SearchCustomerBar(), NotificationBtn()],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          LocaleKeys.customerList.tr(),
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        BlocBuilder<CustomerCubit, CustomerState>(
                          builder: (context, state) {
                            if (state is LoadingCustomer) {
                              return const CircularProgressIndicator(
                                color: primaryColor,
                              );
                            } else if (state is AllCustomersFetched) {
                              customers = state.customers;
                              print('cubit ');
                              print(customers);
                            } else if (state is CustomerFetchedByPhone){
                            customers = [];
                              customers.add(state.customer);
                            }
                            return   CustomerList(
                              customers: customers,
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
