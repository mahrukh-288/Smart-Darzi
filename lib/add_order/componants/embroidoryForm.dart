import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../../Common Widgets/custom_dropdown_search.dart';
import '../../app_theme/constants.dart';

class EmbroidaryFom extends StatefulWidget {
  const EmbroidaryFom({super.key});

  @override
  State<EmbroidaryFom> createState() => _EmbroidaryFomState();
}

class _EmbroidaryFomState extends State<EmbroidaryFom> {
  final TextEditingController _styleController = TextEditingController();
  ImagePicker picker = ImagePicker();
  XFile? image;
  final TextEditingController _bookNoController = TextEditingController();

  final TextEditingController _bookDesignController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
        margin: const EdgeInsets.symmetric(horizontal: 60),
        decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(5),
            color: primaryColor.withOpacity(0.6)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Embroidary Style/کڑہائی کا سٹائل',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                        height: 40,
                        width: 430,
                        child: CustomDropdownSearch(
                          dropdownItems: [
                            'Single Salai / سنگل سلائی',
                            'Double Salai /ڈبل سلائی',
                            'Raishmi   Single/ریشمی سنگل',
                            'Raishmi   Double/ریشمی ڈبل'
                          ],
                          isDefault: false,
                          onValueChanged: (value) {},
                        ))
                  ],
                ),
                //   sizeTextField(context, 'Embroidary Style/کڑہائی کا سٹائل', false, ['Single Salai / سنگل سلائی', 'Double Salai /ڈبل سلائی', 'Raishmi   Single/ریشمی سنگل','Raishmi   Double/ریشمی ڈبل']),
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Book Number/کتاب کا نمبر ',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                        height: 40,
                        width: 430,
                        child: CustomDropdownSearch(
                          dropdownItems: ['Book 1', 'Book 2', 'Book 3'],
                          isDefault: false,
                          onValueChanged: (value) {},
                        ))
                  ],
                ),
                // sizeTextField(context, 'Book Number/کتاب کا نمبر ', false, ['Book 1', 'Book 2', 'Book 3']),
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Design Number/ ڈیزائن نمبر',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 40,
                      width: 430,
                      child: TextField(
                        cursorColor: borderColor,
                        style: Theme.of(context).textTheme.labelLarge,
                        controller: _bookDesignController,
                        decoration: InputDecoration(
                            suffixIcon: Icon(
                          Icons.edit,
                          color: iconColor,
                        )),
                      ),
                    )
                  ],
                )
              ],
            ),
            InkWell(
                onTap: () async {
                  image = await picker.pickImage(source: ImageSource.gallery);

                  setState(() {});
                },
                child: Container(
                  width: 500,
                  height: 275,
                  child: image == null
                      ? Image.asset('images/pickImage.png')
                      : Stack(alignment: Alignment.topRight, children: [
                          Image.network(
                            image!.path,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.fill,
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: iconColor),
                            onPressed: () {
                              setState(() {
                                image = null;
                              });
                            },
                          )
                        ]),
                ))
          ],
        ));
  }

  Widget sizeTextField(
      BuildContext context, label, bool isDefault, List<String> dropdownItems) {
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
            width: 430,
            child: CustomDropdownSearch(
              dropdownItems: dropdownItems,
              isDefault: isDefault,
              onValueChanged: (value) {},
            ))
      ],
    );
  }
}
