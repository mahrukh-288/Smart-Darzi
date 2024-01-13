import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:smart_darzi/add_customer/cubit/customer_cubit.dart';
import 'package:smart_darzi/add_order/cubit/order_cubit.dart';
import 'package:smart_darzi/customer_profile/componants/order_history.dart';
import 'package:smart_darzi/customer_profile/componants/size_table.dart';
import 'package:smart_darzi/customer_profile/componants/uder_details.dart';
import 'package:smart_darzi/models/order.dart';
import 'package:smart_darzi/models/size.dart';
import 'package:smart_darzi/view_customers/view_customers.dart';

import '../Common Widgets/app_drawer.dart';
import '../app_theme/constants.dart';
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
  @override
  void initState() {
    print(widget.customer.name);
    context.read<CustomerCubit>().getCustomerSize(widget.customer.id);
    context.read<OrderCubit>().getOrdersByCustomerId(widget.customer.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CustomerCubit, CustomerState>(
      listener: (context, state) {
       if(state is CustomerDeleted){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ViewCustomers(),));
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
                          horizontal: MediaQuery.sizeOf(context).width * 0.1,
                          vertical: 30),
                      child: Column(
                        children: [
                          UserDetails(
                            customer: widget.customer,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          BlocBuilder<CustomerCubit, CustomerState>(
                            builder: (context, state) {
                              if (state is CustomerSizeFetched) {
                                size = state.size;
                                return SizeTable(
                                  size: size,
                                );
                              }
                              return Text('Size not found');
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          BlocBuilder<OrderCubit, OrderState>(
                            builder: (context, state) {
                              if (state is OrdersByCustomerIdFetched) {
                                orders = state.orders;
                                return OrderHistory(
                                  orders: orders,
                                );
                              }
                              return Text('No orders yet');
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(350, 50),
                                  backgroundColor: Colors.red[900]),
                              onPressed: () {
                                context.read<CustomerCubit>().deleteCustomer(
                                    widget.customer.phoneNumber);
                              },
                              child: Text(
                                'Delete Customer',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ))
                        ],
                      )),
                ),
              ),
            ]),
      ),
    );
  }
}
