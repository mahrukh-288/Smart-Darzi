import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../generated/locale_keys.g.dart';

class NotificationBtn extends StatelessWidget {
  const NotificationBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return  Badge(
                        alignment: Alignment.topLeft,
                        backgroundColor: Colors.green,
                        smallSize: 20,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                fixedSize: const Size(200, 50),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () {},
                            child: Text(
                              LocaleKeys.Notifications.tr(),
                              style: Theme.of(context).textTheme.labelLarge,
                            )),
                      );
  }
}