import 'package:flutter/material.dart';
import 'package:smart_darzi/order_details/SaveOrderPage.dart';

import '../app_theme/constants.dart';

class PopUpMenu extends StatelessWidget {
  const PopUpMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      icon: const Icon(
        Icons.menu,
        color: iconColor,
      ),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          // row has two child icon and text.
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset('images/user.png'),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Customer Profile',
                    style: Theme.of(context).textTheme.labelLarge,
                  )
                ],
              ),
              const Divider(
                color: borderColor,
              )
            ],
          ),
        ),
        PopupMenuItem(
          value: 2,
          // row has two child icon and text.
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset('images/editDetail.png'),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Edit Details',
                    style: Theme.of(context).textTheme.labelLarge,
                  )
                ],
              ),
              const Divider(
                color: borderColor,
              )
            ],
          ),
        ),
        PopupMenuItem(
          value: 1,
          // row has two child icon and text.
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset('images/editSize.png'),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Edit Size',
                    style: Theme.of(context).textTheme.labelLarge,
                  )
                ],
              ),
              const Divider(
                color: borderColor,
              )
            ],
          ),
        ),
        PopupMenuItem(
          value: 1,
          // row has two child icon and text.
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset('images/addOrder.png'),
                  const SizedBox(
                    width: 8,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SaveOrderPage(),
                            ));
                      },
                      child: Text(
                        'Add Order',
                        style: Theme.of(context).textTheme.labelLarge,
                      ))
                ],
              ),
              const Divider(
                color: borderColor,
              )
            ],
          ),
        ),
        PopupMenuItem(
          value: 1,
          // row has two child icon and text.
          child: Row(
            children: [
              Image.asset('images/delete.png'),
              const SizedBox(
                width: 8,
              ),
              Text(
                'Delete Customer',
                style: Theme.of(context).textTheme.labelLarge,
              )
            ],
          ),
        ),
      ],
      // offset: Offset(0, 100),
      color: primaryColor,
      elevation: 2,
    );
  }
}
