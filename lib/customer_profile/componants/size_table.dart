import 'package:flutter/material.dart';

import '../../app_theme/constants.dart';

class SizeTable extends StatelessWidget {
  const SizeTable({super.key});

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
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      'length : 38',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    SizedBox(height: 5),
                    Text(
                      'length : 38',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'length : 38',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'length : 38',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
                VerticalDivider(
                    color: borderColor.withOpacity(0.3), thickness: 1),
                Column(
                  children: [
                    Text(
                      'length : 38',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'length : 38',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'length : 38',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'length : 38',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
                VerticalDivider(
                  color: borderColor.withOpacity(0.3),
                  thickness: 1,
                ),
                Column(
                  children: [
                    Text(
                      'length : 38',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'length : 38',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'length : 38',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(fixedSize: Size(150, 30)),
            onPressed: () {},
            child: Text(
              'Edit Size',
              style: Theme.of(context).textTheme.labelLarge,
            )),
        SizedBox(
          height: 20,
        ),
      ]),
    );
  }
}
