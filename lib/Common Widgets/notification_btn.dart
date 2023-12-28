import 'package:flutter/material.dart';

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
                              'Notifications',
                              style: Theme.of(context).textTheme.labelLarge,
                            )),
                      );
  }
}