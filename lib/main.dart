import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:smart_darzi/add_customer/addCustomerPage.dart';
import 'package:smart_darzi/add_order/SaveOrderPage.dart';
import 'package:smart_darzi/add_order/cubit/order_cubit.dart';
import 'package:smart_darzi/app_theme/app_theme.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:smart_darzi/customer_profile/customer_profile.dart';

import 'package:smart_darzi/firebase_options.dart';
import 'package:smart_darzi/login/login.dart';

import 'package:smart_darzi/view_customers/view_customers.dart';
import 'package:smart_darzi/view_orders/viewOrdersPage.dart';

import 'add_customer/cubit/customer_cubit.dart';
import 'add_size/add_size.dart';



void main() async {
  
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('ur', 'PK')],
      path: 'assets/translations', // <-- change the path of the translation files 
      fallbackLocale: Locale('en', 'US'),
      startLocale: Locale('ur', 'PK'),
      child: MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final CustomerCubit _customerCubit = CustomerCubit();
  final OrderCubit _orderCubit = OrderCubit();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
   
      providers: [
        BlocProvider(create: (context) => _customerCubit,),
   BlocProvider(create: (context) => _orderCubit,),
   
      ],
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        title: 'Smart Darzi',
        builder: (context, child) => ResponsiveBreakpoints.builder(
          child: child!,
          breakpoints: [
            const Breakpoint(start: 0, end: 500, name: MOBILE),
            const Breakpoint(start: 501, end: 800, name: TABLET),
            const Breakpoint(start: 801, end: 1920, name: DESKTOP),
            const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
          ],
        ),
        home: Login(),
      ),
    );
  }
}
