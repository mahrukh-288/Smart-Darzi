import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:smart_darzi/add_order/cubit/order_cubit.dart';
import 'package:smart_darzi/view_orders/order_list.dart';

import '../Common Widgets/app_drawer.dart';
import '../Common Widgets/notification_btn.dart';
import '../Common Widgets/search_customer_bar.dart';
import '../app_theme/constants.dart';
import '../generated/locale_keys.g.dart';
import '../models/order.dart';

class ViewOrdersPage extends StatefulWidget {
  const ViewOrdersPage({super.key});

  @override
  State<ViewOrdersPage> createState() => _ViewOrdersPageState();
}

class _ViewOrdersPageState extends State<ViewOrdersPage> {
  List<Order> orders = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<OrderCubit>().getAllOrders();
  }

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
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Column(
                    children: [
                      Align(
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
                        LocaleKeys.OrderList.tr(),
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                       BlocBuilder<OrderCubit, OrderState>(
                        builder: (context, state) {
                          if(state is LoadingOrder ){
                            return CircularProgressIndicator(color: primaryColor,);
                          }
                          else if(state is AllOrdersFetched){
                            orders = state.orders;
                          }
                          return OrderList(orders: orders,);
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ]),
    );
  }
}
