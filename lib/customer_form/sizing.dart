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
