import 'package:flutter/material.dart';

import 'package:smart_darzi/app_theme/app_theme.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:smart_darzi/customer_form/customer_form.dart';
import 'package:smart_darzi/view_customers/view_customers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: const CustomerForm(),
    );
  }
}
