import 'package:flutter/material.dart';

import '../app_theme/constants.dart';

class AddOrder extends StatelessWidget {
  const AddOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(5),
          color: primaryColor.withOpacity(0.6)),
      child: Column(
        children: [
          Wrap(
            runSpacing: 20,
            spacing: 30,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order Category',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 40,
                    width: 430,
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Male/Female/kid/مردانہ/ زنانہ / بچہ ',
                          hintStyle: Theme.of(context).textTheme.labelLarge),
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order Type',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 40,
                    width: 430,
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Suit/Shirt/Kurta/Coat',
                          hintStyle: Theme.of(context).textTheme.labelLarge),
                    ),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Customer Data',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(
            height: 20,
          ),
          Wrap(
            runSpacing: 20,
            spacing: 30,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cuff Styling',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 40,
                    width: 270,
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Cuff / Simple/کف / سادہ',
                          hintStyle: Theme.of(context).textTheme.labelLarge),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Neck Styling',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 40,
                    width: 270,
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Collar/ Baan/کالر/ بین',
                          hintStyle: Theme.of(context).textTheme.labelLarge),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Other Styling',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 40,
                    width: 270,
                    child: TextField(
                      decoration: InputDecoration(
                          suffixIcon: const Icon(
                            Icons.edit,
                            color: iconColor,
                          ),
                          hintText: 'Front Pocket',
                          hintStyle: Theme.of(context).textTheme.labelLarge),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
