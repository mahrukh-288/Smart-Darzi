import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:smart_darzi/models/size.dart';

import '../Common Widgets/app_drawer.dart';
import '../Common Widgets/customAppBar.dart';
import '../add_customer/addCustomerPage.dart';
import '../add_customer/cubit/customer_cubit.dart';
import '../app_theme/constants.dart';
import '../view_customers/view_customers.dart';
import 'sizing.dart';
import 'sizing_dropdown.dart';

class AddSize extends StatefulWidget {
   AddSize({super.key, required this.customerId});
final String customerId;

  @override
  State<AddSize> createState() => _AddSizeState();
}

class _AddSizeState extends State<AddSize> {
  bool sizeSaved = false;

  SizeModel sizeModel = SizeModel();
  @override
  void initState() {
    // TODO: implement initState
    print(widget.customerId);
    sizeModel.customerId = widget.customerId;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CustomerCubit, CustomerState>(
      listener: (context, state) {
       if(state is SizeSaved){
        sizeSavedDialog(context);
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
                      Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
      margin: const EdgeInsets.symmetric(horizontal: 60),
      decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(5),
          color: primaryColor.withOpacity(0.6)),
      child: Wrap(
        runSpacing: 20,
        spacing: 20,
        children: [
          Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Length of Shirt /قمیص کی لمبائی',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 40,
          width: 250,
          child: SizingDropdown(startValue: 10, lastValue: 50, onTapped: (value ) {
          sizeModel.length = value;
            },)
        )
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Shoulder /کندھے/تیرا',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 40,
          width: 250,
          child: SizingDropdown(startValue: 10, lastValue: 23, onTapped: (value ) {
          sizeModel.shoulder = value;
            },)
        )
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Chest /چھاتی',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 40,
          width: 250,
          child: SizingDropdown(startValue: 20, lastValue: 60, onTapped: (value ) {
          sizeModel.chest = value;
            },)
        )
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Neck / گلا',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 40,
          width: 250,
          child: SizingDropdown(startValue: 10, lastValue: 20, onTapped: (value ) {
          sizeModel.neck = value;
            },)
        )
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Arm Length /بازو کی لمبائی',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 40,
          width: 250,
          child: SizingDropdown(startValue: 10, lastValue: 30, onTapped: (value ) {
          sizeModel.armLength = value;
            },)
        )
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Arm Round/بازو کی گولائی',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 40,
          width: 250,
          child: SizingDropdown(startValue: 4, lastValue: 10, onTapped: (value ) {
          sizeModel.armRound = value;
            },)
        )
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Waist/Fitting/کمر',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 40,
          width: 250,
          child: SizingDropdown(startValue: 15, lastValue: 60, onTapped: (value ) {
          sizeModel.waist = value;
            },)
        )
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Lap/Daman/دامن/ گھیرا',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 40,
          width: 250,
          child: SizingDropdown(startValue: 20, lastValue: 60, onTapped: (value ) {
          sizeModel.lap = value;
            },)
        )
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
         'Length of Pant /پتلون یا شلوار کی لمبائی',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 40,
          width: 250,
          child: SizingDropdown(startValue: 20, lastValue: 60, onTapped: (value ) {
          sizeModel.lengthOfTrouser = value;
            },)
        )
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ankle Width/ پانچہ',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 40,
          width: 250,
          child: SizingDropdown(startValue: 4, lastValue: 20, onTapped: (value ) {
          sizeModel.ankleWidth = value;
            },)
        )
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hips/ کولہے',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 40,
          width: 250,
          child: SizingDropdown(startValue: 20, lastValue: 60, onTapped: (value ) {
          sizeModel.hips = value;
            },)
        )
      ],
    ),
          // sizeTextField(context,'Length of Shirt /قمیص کی لمبائی',10,50, sizeModel.length),
          // sizeTextField(context,'Shoulder /کندھے/تیرا',10,23, sizeModel.shoulder),
          // sizeTextField(context,'Chest /چھاتی',20,60, sizeModel.chest),
          // sizeTextField(context,'Neck / گلا',10,20, sizeModel.neck ),
          // sizeTextField(context,'Arm Length /بازو کی لمبائی',10,30 , sizeModel.armLength),
          // sizeTextField(context,'Arm Round/بازو کی گولائی',4,10,sizeModel.armRound ),
          // sizeTextField(context,'Waist/Fitting/کمر', 15,60,sizeModel.waist),
          // sizeTextField(context,'Lap/Daman/دامن/ گھیرا',20,60,sizeModel.lap ),
          // sizeTextField(
          //    context, 'Length of Pant /پتلون یا شلوار کی لمبائی', 20,60,sizeModel.lengthOfTrouser),
          // sizeTextField(context,'Ankle Width/ پانچہ',4,20,sizeModel.ankleWidth ),
          // sizeTextField(context,'Hips/ کولہے',20,60,sizeModel.hips ),

        ],
      ),
    ),
                      const SizedBox(
                        height: 20,
                      ),
                      BlocBuilder<CustomerCubit, CustomerState>(
                        builder: (context, state) {
                          if (state is LoadingCustomer) {
                            return CircularProgressIndicator(
                              color: primaryColor,
                            );
                          }
                          return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: sizeSaved
                                      ? primaryColor
                                      : Colors.white.withOpacity(0.5)),
                              onPressed: () {
                               
                          
                                  context
                                      .read<CustomerCubit>()
                                      .saveSize(sizeModel);
                             
                              },
                              child:
                              //  sizeSaved
                              //     ? Row(
                              //         mainAxisAlignment:
                              //             MainAxisAlignment.center,
                              //         children: [
                              //           Text('Saved',
                              //               style: Theme.of(context)
                              //                   .textTheme
                              //                   .headlineSmall),
                              //           SizedBox(
                              //             width: 5,
                              //           ),
                              //           Container(
                              //             padding: EdgeInsets.all(3),
                              //             decoration: BoxDecoration(
                              //                 borderRadius:
                              //                     BorderRadius.circular(20),
                              //                 color: Colors.white
                              //                     .withOpacity(0.9)),
                              //             child: Icon(
                              //               Icons.check,
                              //               color: primaryColor,
                              //             ),
                              //           )
                              //         ],
                              //       )
                              //     : 
                                  Text(
                                      'Save Size/ ماپ محفوظ کریں',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.copyWith(color: primaryColor),
                                    ));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  sizeSavedDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      actionsPadding: EdgeInsets.only(bottom: 30, left: 20, right: 20),
      backgroundColor: Colors.white.withOpacity(0.8),
      content: Text(
        "Size Saved Successfully!",
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
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CustomerForm(),
                  ));
            },
            child: Text(
              'Main Page',
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
            Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ViewCustomers(),
                ));
          },
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(150, 60),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
          child: Text(
            'Customer View',
            style: Theme.of(context).textTheme.labelLarge,
          ),
        )
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
}
