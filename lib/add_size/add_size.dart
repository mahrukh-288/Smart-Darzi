import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../Common Widgets/app_drawer.dart';
import '../Common Widgets/customAppBar.dart';
import '../app_theme/constants.dart';
import '../customer_form/sizing.dart';

class AddSize extends StatefulWidget {
  const AddSize({super.key});

  @override
  State<AddSize> createState() => _AddSizeState();
}

class _AddSizeState extends State<AddSize> {
    bool sizeSaved = false;
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
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                   CustomAppBar(),
                    const SizedBox(
                      height: 20,
                    ),
                     Text(
                      'Sizing / ماپ',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Sizing(),
                    const SizedBox(
                      height: 20,
                    ),
                   ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: sizeSaved ? primaryColor : Colors.white.withOpacity(0.5)
                    ),
                        onPressed: () {
                          setState(() {sizeSaved=true;
                            
                          });
                        },
                        child: sizeSaved ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Text('Saved', style: Theme.of(context).textTheme.headlineSmall),SizedBox(width: 5,),
                        Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white.withOpacity(0.9)),child: Icon(Icons.check,color: primaryColor,),)],):Text(
                          'Save Size/ ماپ محفوظ کریں',
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: primaryColor),
                        )),
                    
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}