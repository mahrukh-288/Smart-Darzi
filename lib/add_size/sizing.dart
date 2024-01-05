import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:smart_darzi/add_size/sizing_dropdown.dart';
import 'package:smart_darzi/models/size.dart';
import '../Common Widgets/custom_dropdown_search.dart';
import '../app_theme/constants.dart';

class Sizing extends StatelessWidget {
   Sizing({super.key, required this.sizeModel});
   final SizeModel sizeModel;
  

  @override
  Widget build(BuildContext context) {
    return Container(
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
          sizeTextField(context,'Length of Shirt /قمیص کی لمبائی',10,50, sizeModel.length),
          sizeTextField(context,'Shoulder /کندھے/تیرا',10,23, sizeModel.shoulder),
          sizeTextField(context,'Chest /چھاتی',20,60, sizeModel.chest),
          sizeTextField(context,'Neck / گلا',10,20, sizeModel.neck ),
          sizeTextField(context,'Arm Length /بازو کی لمبائی',10,30 , sizeModel.armLength),
          sizeTextField(context,'Arm Round/بازو کی گولائی',4,10,sizeModel.armRound ),
          sizeTextField(context,'Waist/Fitting/کمر', 15,60,sizeModel.waist),
          sizeTextField(context,'Lap/Daman/دامن/ گھیرا',20,60,sizeModel.lap ),
          sizeTextField(
             context, 'Length of Pant /پتلون یا شلوار کی لمبائی', 20,60,sizeModel.lengthOfTrouser),
          sizeTextField(context,'Ankle Width/ پانچہ',4,20,sizeModel.ankleWidth ),
          sizeTextField(context,'Hips/ کولہے',20,60,sizeModel.hips ),

        ],
      ),
    );
  }

   Widget sizeTextField(BuildContext context, label, int startValue, int lastValue, String maapValue ){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 40,
          width: 250,
          child: SizingDropdown(startValue: startValue, lastValue: lastValue, onTapped: (value ) {
          maapValue = value;
            },)
        )
      ],
    );
  }
}
