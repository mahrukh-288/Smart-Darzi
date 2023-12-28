import 'package:flutter/material.dart';

import '../app_theme/constants.dart';
import 'notification_btn.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         BackButton(color: primaryColor),
         SizedBox(height: 5,),
          Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            height: 40,
                            width: 40,
                            padding: const EdgeInsets.symmetric(
                                vertical: 3, horizontal: 1),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                border: Border.all(color: borderColor)),
                            child: const Icon(
                              Icons.menu,
                              color: iconColor,
                            )),
                        const NotificationBtn(),
                      ],
                    ),
      ],
    );
  }
}