import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:smart_darzi/models/size.dart';

import '../Common Widgets/app_drawer.dart';
import '../Common Widgets/customAppBar.dart';
import '../add_customer/addCustomerPage.dart';
import '../add_customer/cubit/customer_cubit.dart';
import '../app_theme/constants.dart';
import '../customer_profile/customer_profile.dart';
import '../generated/locale_keys.g.dart';
import '../models/customer.dart';
import '../view_customers/view_customers.dart';
import 'sizing_dropdown.dart';

class AddSize extends StatefulWidget {
  AddSize({super.key, required this.customer});
  final Customer customer;

  @override
  State<AddSize> createState() => _AddSizeState();
}

class _AddSizeState extends State<AddSize> {
  bool sizeSaved = true;

  SizeModel sizeModel = SizeModel();
  @override
  void initState() {
    sizeModel.customerId = widget.customer.id;
    
    context.read<CustomerCubit>().getCustomerSize(widget.customer.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CustomerCubit, CustomerState>(
      listener: (context, state) {
        if (state is SizeSaved) {
          sizeSavedDialog(context, widget.customer, state.message);
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
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: borderColor),
                                ),
                                child: const Icon(
                                  Icons.person,
                                  color: iconColor,
                                  size: 30,
                                ),
                              ),
                              Text(
                                '${widget.customer.cid}',
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.customer.name,
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                              Text(
                                '${widget.customer.phoneNumber}',
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        LocaleKeys.Sizing.tr(),
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 40),
                        margin: const EdgeInsets.symmetric(horizontal: 60),
                        decoration: BoxDecoration(
                            border: Border.all(color: borderColor),
                            borderRadius: BorderRadius.circular(5),
                            color: primaryColor.withOpacity(0.6)),
                        child: BlocBuilder<CustomerCubit, CustomerState>(
                          builder: (context, state) {
                            if(state is CustomerSizeFetched) {
                              sizeModel = state.size;
                              
                         
                            }
                            else if(state is SizeNotAvailable){
sizeSaved = false;
                            }
                            
                              return 
                              Wrap(
                              runSpacing: 20,
                              spacing: 20,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      LocaleKeys.LengthofShirt.tr(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    SizedBox(
                                        height: 40,
                                        width: 250,
                                        child: SizingDropdown(
                                          startValue: 10,
                                          lastValue: 50,
                                          onTapped: (value) {
                                            sizeModel.length = value;
                                          }, selectedValue: sizeModel.length,
                                        ))
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      LocaleKeys.armscye.tr(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    SizedBox(
                                        height: 40,
                                        width: 250,
                                        child: SizingDropdown(
                                          startValue: 5,
                                          lastValue: 20,
                                          onTapped: (value) {
                                            sizeModel.armscye = value;
                                          }, selectedValue: sizeModel.armscye,
                                        ))
                                  ],
                                ),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      LocaleKeys.Shoulder.tr(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    SizedBox(
                                        height: 40,
                                        width: 250,
                                        child: SizingDropdown(
                                          startValue: 10,
                                          lastValue: 23,
                                          onTapped: (value) {
                                            sizeModel.shoulder = value;
                                          }, selectedValue: sizeModel.shoulder,
                                        ))
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      LocaleKeys.Chest.tr(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    SizedBox(
                                        height: 40,
                                        width: 250,
                                        child: SizingDropdown(
                                          startValue: 20,
                                          lastValue: 60,
                                          onTapped: (value) {
                                            sizeModel.chest = value;
                                          }, selectedValue: sizeModel.chest,
                                        ))
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      LocaleKeys.Neck.tr(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    SizedBox(
                                        height: 40,
                                        width: 250,
                                        child: SizingDropdown(
                                          startValue: 10,
                                          lastValue: 20,
                                          onTapped: (value) {
                                            sizeModel.neck = value;
                                          }, selectedValue: sizeModel.neck,
                                        ))
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      LocaleKeys.ArmLength.tr(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    SizedBox(
                                        height: 40,
                                        width: 250,
                                        child: SizingDropdown(
                                          startValue: 10,
                                          lastValue: 30,
                                          onTapped: (value) {
                                            sizeModel.armLength = value;
                                          }, selectedValue: sizeModel.armLength,
                                        ))
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      LocaleKeys.ArmRound.tr(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    SizedBox(
                                        height: 40,
                                        width: 250,
                                        child: SizingDropdown(
                                          startValue: 4,
                                          lastValue: 10,
                                          onTapped: (value) {
                                            sizeModel.armRound = value;
                                          }, selectedValue: sizeModel.armRound,
                                        ))
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      LocaleKeys.Waist.tr(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    SizedBox(
                                        height: 40,
                                        width: 250,
                                        child: SizingDropdown(
                                          startValue: 15,
                                          lastValue: 60,
                                          onTapped: (value) {
                                            sizeModel.waist = value;
                                          }, selectedValue: sizeModel.waist,
                                        ))
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      LocaleKeys.Daman.tr(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    SizedBox(
                                        height: 40,
                                        width: 250,
                                        child: SizingDropdown(
                                          startValue: 20,
                                          lastValue: 60,
                                          onTapped: (value) {
                                            sizeModel.lap = value;
                                          }, selectedValue: sizeModel.lap,
                                        ))
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      LocaleKeys.LengthofPant.tr(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    SizedBox(
                                        height: 40,
                                        width: 250,
                                        child: SizingDropdown(
                                          startValue: 20,
                                          lastValue: 60,
                                          onTapped: (value) {
                                            sizeModel.lengthOfTrouser = value;
                                          }, selectedValue: sizeModel.lengthOfTrouser,
                                        ))
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      LocaleKeys.AnkleWidth.tr(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    SizedBox(
                                        height: 40,
                                        width: 250,
                                        child: SizingDropdown(
                                          startValue: 4,
                                          lastValue: 20,
                                          onTapped: (value) {
                                            sizeModel.ankleWidth = value;
                                          }, selectedValue: sizeModel.ankleWidth,
                                        ))
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      LocaleKeys.Hips.tr(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    SizedBox(
                                        height: 40,
                                        width: 250,
                                        child: SizingDropdown(
                                          startValue: 20,
                                          lastValue: 60,
                                          onTapped: (value) {
                                            sizeModel.hips = value;
                                          }, selectedValue: sizeModel.hips,
                                        ))
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
                            );
                            
                          },
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
                                if(sizeSaved) {
                                  context
                                    .read<CustomerCubit>()
                                    .updateSize(sizeModel);
                                }
                                else{
                                  context
                                    .read<CustomerCubit>()
                                    .saveSize(sizeModel);

                                }
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
                                LocaleKeys.SaveSize.tr(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(color: textColor),
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

  sizeSavedDialog(BuildContext context, Customer customer, String message) {
    AlertDialog alert = AlertDialog(
      actionsPadding: EdgeInsets.only(bottom: 30, left: 20, right: 20),
      backgroundColor: Colors.white.withOpacity(0.8),
      content: Text(
        message,
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
              // Navigator.pop(context);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ViewCustomers(),
                  ));
            },
            child: Text(
              LocaleKeys.CustomerView.tr(),
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
            //Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CustomerProfile(
                    customer: customer,
                  ),
                ));
          },
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(150, 60),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
          child: Text(
            LocaleKeys.CustomerProfile.tr(),
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
        OutlinedButton(
            style: OutlinedButton.styleFrom(
                fixedSize: const Size(150, 60),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                side: const BorderSide(color: primaryColor)),
            onPressed: () {
              // Navigator.pop(context);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CustomerForm(),
                  ));
            },
            child: Text(
              LocaleKeys.goToHome.tr(),
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(color: primaryColor),
            )),
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
