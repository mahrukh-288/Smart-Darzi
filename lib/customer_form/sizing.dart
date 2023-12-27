import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../app_theme/constants.dart';

class Sizing extends StatefulWidget {
  const Sizing({super.key});

  @override
  State<Sizing> createState() => _SizingState();
}

class _SizingState extends State<Sizing> {
  TextEditingController _shirtController = TextEditingController();
  TextEditingController _shoulderController = TextEditingController();
  TextEditingController _chestController = TextEditingController();
  TextEditingController _neckController = TextEditingController();
  TextEditingController _armLengthController = TextEditingController();
  TextEditingController _armRoundController = TextEditingController();
  TextEditingController _waistController = TextEditingController();
  TextEditingController _lapController = TextEditingController();
  TextEditingController _pantController = TextEditingController();
  TextEditingController _anckleController = TextEditingController();
  TextEditingController _hipController = TextEditingController();
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
          sizeTextField('Length of Shirt /قمیص کی لمبائی', _shirtController),
          sizeTextField('Shoulder /کندھے/تیرا', _shoulderController),
          sizeTextField('Chest /چھاتی', _chestController),
          sizeTextField('Neck / گلا', _neckController),
          sizeTextField('Arm Length /بازو کی لمبائی', _armLengthController),
          sizeTextField('Arm Round/بازو کی گولائی', _armRoundController),
          sizeTextField('Waist/Fitting/کمر', _waistController),
          sizeTextField('Lap/Daman/دامن/ گھیرا', _lapController),
          sizeTextField(
              'Length of Pant /پتلون یا شلوار کی لمبائی', _pantController),
          sizeTextField('Ankle Width/ پانچہ', _anckleController),
          sizeTextField('Hips/ کولہے', _hipController),

          DropdownSearch(
            
            
           dropdownButtonProps: DropdownButtonProps(
            color: primaryColor
           ),
            items: [
              10,
              11,
              12,
              13,
              14,
              15,
              16,
              17,
              18,
              19,
              20,
              21,
              22,
              23,
              24,
              25,
              26,
              27,
              28,
              29,
              30,
              31
            ],
          )

          // Column(
          //   children: [
          //     const SizedBox(
          //       height: 30,
          //     ),

          //     // ElevatedButton(
          //     //     style: ElevatedButton.styleFrom(
          //     //       backgroundColor: iconColor.withOpacity(0.6),
          //     //       minimumSize: ResponsiveBreakpoints.of(context).largerThan(TABLET) ? Size(540,50) :Size(250, 50),

          //     //     ),
          //     //     onPressed: () {
          //     //       setState(() {
          //     //          _dataSaved = true;
          //     //       });

          //     //     },
          //     //     child: _dataSaved ? Row(
          //     //       mainAxisSize: MainAxisSize.min,
          //     //       children: [
          //     //         Text('Size Saved Successfully', style: Theme.of(context)
          //     //           .textTheme
          //     //           .headlineSmall
          //     //           ?.copyWith(color: primaryColor),),
          //     //           SizedBox(width: 5,),
          //     //           Container(
          //     //             decoration: BoxDecoration(
          //     //               shape: BoxShape.circle,
          //     //               color: primaryColor
          //     //             ),
          //     //             child: Icon(Icons.check, color: iconColor,),
          //     //           )
          //     //       ],
          //     //     ): Text(
          //     //       'Save Data',
          //     //       style: Theme.of(context)
          //     //           .textTheme
          //     //           .headlineSmall
          //     //           ?.copyWith(color: primaryColor),
          //     //     )),
          //   ],
          // )
        ],
      ),
    );
  }

  Widget sizeTextField(String label, TextEditingController controller) {
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
          width: 300,
          child: TextField(

            cursorColor: borderColor,
            style: Theme.of(context).textTheme.labelLarge,
            controller: controller,
          ),
        )
      ],
    );
  }
}
