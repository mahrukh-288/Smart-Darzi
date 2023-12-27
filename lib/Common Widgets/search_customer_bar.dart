import 'package:flutter/material.dart';

import '../app_theme/constants.dart';

class SearchCustomerBar extends StatelessWidget {
  const SearchCustomerBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            height: 40,
            width: 40,
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 1),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                border: Border.all(color: borderColor)),
            child: const Icon(
              Icons.menu,
              color: iconColor,
            )),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
        width: 500,
          height: 40,
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  color: iconColor,
                ),
                hintText: 'Search Customer here...',
                hintStyle: Theme.of(context).textTheme.labelLarge),
          ),
        )
      ],
    );
  }
}
