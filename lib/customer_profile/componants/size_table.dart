import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_darzi/models/size.dart';

import '../../add_customer/cubit/customer_cubit.dart';
import '../../app_theme/constants.dart';

class SizeTable extends StatefulWidget {
  const SizeTable({super.key, required this.customerId});
  final String customerId;
  @override
  State<SizeTable> createState() => _SizeTableState();
}

class _SizeTableState extends State<SizeTable> {
  SizeModel  sizeModel = SizeModel();
  @override
  void initState() {
    context.read<CustomerCubit>().getCustomerSize(widget.customerId);
    super.initState();
  }

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
          child: BlocBuilder<CustomerCubit, CustomerState>(
            builder: (context, state) {
              if(state is CustomerSizeFetched)
              {
                sizeModel = state.size;
              }
              return Column(
                children: [
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Shir length : ${sizeModel.length}',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Neck : ${sizeModel.neck}',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Shoulder : ${sizeModel.shoulder}',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Waist : ${sizeModel.waist}',
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
                              'Chest : ${sizeModel.chest}',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Daman : ${sizeModel.lap}',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Arm Length : ${sizeModel.armLength}',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Arm Round : ${sizeModel.armRound}',
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
                              'Pent Length : ${sizeModel.lengthOfTrouser}',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Ankle Width : ${sizeModel.ankleWidth}',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Hips : ${sizeModel.hips}',
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
              );
            },
          ),
        ),
      ]),
    );
  }
}
