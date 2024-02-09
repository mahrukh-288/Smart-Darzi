import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_darzi/add_size/add_size.dart';
import 'package:smart_darzi/models/size.dart';

import '../../add_customer/cubit/customer_cubit.dart';
import '../../app_theme/constants.dart';
import '../../generated/locale_keys.g.dart';
import '../../models/customer.dart';

class SizeTable extends StatelessWidget {
  const SizeTable({super.key, required this.size, required this.customer});
final Customer customer;
 final  SizeModel?  size ;


  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(border: Border.all(color: borderColor)),
      child: Column(children: [
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 50,
          color: primaryColor,
          child: Text(
            LocaleKeys.Sizing.tr(),
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        Padding(
          
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: size == null ? Text(LocaleKeys.noSizeFound.tr(), style: Theme.of(context).textTheme.headlineSmall,) : Column(
                children: [
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                '${LocaleKeys.LengthofShirt.tr()} : ${size?.length}',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                             const SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${LocaleKeys.ArmLength.tr()} : ${size?.armLength}',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                           
                             const SizedBox(height: 5),
                            Text(
                              '${LocaleKeys.armscye.tr()} : ${size?.armscye}',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${LocaleKeys.Shoulder.tr()} : ${size?.shoulder}',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                             const SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${LocaleKeys.ArmRound.tr()} : ${size?.armRound}',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                           
                          ],
                        ),
                        VerticalDivider(
                            color: borderColor.withOpacity(0.3), thickness: 1),
                        Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${LocaleKeys.Chest.tr()} : ${size?.chest}',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                             const SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${LocaleKeys.Waist.tr()} : ${size?.waist}',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                             const SizedBox(height: 5),
                            Text(
                              '${LocaleKeys.Neck.tr()} : ${size?.neck}',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            const SizedBox(
                              height: 5,
                            ),

                            Text(
                              '${LocaleKeys.Daman.tr()} : ${size?.lap}',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                           
                           
                          ],
                        ),
                        VerticalDivider(
                          color: borderColor.withOpacity(0.3),
                          thickness: 1,
                        ),
                        Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${LocaleKeys.LengthofPant.tr()} : ${size?.lengthOfTrouser}',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${LocaleKeys.AnkleWidth.tr()} : ${size?.ankleWidth}',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${LocaleKeys.Hips.tr()} : ${size?.hips}',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  
                ],
              )
        ),
        const SizedBox(height: 30,),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(fixedSize: const Size(150, 30)),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AddSize(customer: customer),));
                      },
                      child: Text(
                        LocaleKeys.EditSize.tr(),
                        style: Theme.of(context).textTheme.labelLarge,
                      )),
                      const SizedBox(height: 30,),
      ]),
    );
  }
}
