import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:smart_darzi/add_customer/cubit/customer_cubit.dart';
import 'package:smart_darzi/customer_profile/componants/order_history.dart';
import 'package:smart_darzi/customer_profile/componants/size_table.dart';
import 'package:smart_darzi/customer_profile/componants/uder_details.dart';

import '../Common Widgets/app_drawer.dart';
import '../app_theme/constants.dart';
import '../models/customer.dart';

class CustomerProfile extends StatefulWidget {
  const CustomerProfile({super.key, required this.phoneNo});
  final String phoneNo;
  @override
  State<CustomerProfile> createState() => _CustomerProfileState();
}

class _CustomerProfileState extends State<CustomerProfile> {
  @override
  void initState() {
    context.read<CustomerCubit>().getCustomerByPhone(widget.phoneNo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      horizontal: MediaQuery.sizeOf(context).width * 0.15,
                      vertical: 30),
                  child: BlocBuilder<CustomerCubit, CustomerState>(
                    builder: (context, state) {
                      if (state is CustomerFetchedByPhone) {
                        Customer customer = state.customer;
                        print(customer.toJson());
                      }
                      return Column(
                        children: [
                          UserDetails(),
                          SizedBox(height: 30,),

                          SizeTable(),
                          SizedBox(height: 30,),
                          OrderHistory(customerId: '6596e58bd32cc31ec31becac',),
                          SizedBox(height: 30,),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(350, 50),
                              backgroundColor: Colors.red[900]
                            ),
                            onPressed: (){}, child: Text('Delete Customer', style: Theme.of(context).textTheme.headlineSmall,))
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ]),
    );
  }
}
