import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_darzi/models/size.dart';

import '../../add_customer/cubit/customer_cubit.dart';
import '../../app_theme/constants.dart';

class SizeTable extends StatelessWidget {
  const SizeTable({super.key, required this.size});
  
 final  SizeModel  size ;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: borderColor)),
      child: Column(children: [
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 50,
          color: primaryColor,
          child: Text(
            'Size',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
          child: Column(
                children: [
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Shir length : ${size.length}',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Neck : ${size.neck}',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Shoulder : ${size.shoulder}',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Waist : ${size.waist}',
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
                              'Chest : ${size.chest}',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Daman : ${size.lap}',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Arm Length : ${size.armLength}',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Arm Round : ${size.armRound}',
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
                              'Pent Length : ${size.lengthOfTrouser}',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Ankle Width : ${size.ankleWidth}',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Hips : ${size.hips}',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(fixedSize: Size(150, 30)),
                      onPressed: () {},
                      child: Text(
                        'Edit Size',
                        style: Theme.of(context).textTheme.labelLarge,
                      )),
                ],
              )
        ),
      ]),
    );
  }
}
