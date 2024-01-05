import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:smart_darzi/Common%20Widgets/app_drawer.dart';
import 'package:smart_darzi/Common%20Widgets/customAppBar.dart';
import 'package:smart_darzi/add_order/componants/order_dropdown.dart';
import 'package:smart_darzi/models/order.dart';
import '../Common Widgets/custom_dropdown_search.dart';
import '../Common Widgets/notification_btn.dart';
import '../add_customer/addCustomerPage.dart';
import '../add_customer/cubit/customer_cubit.dart';
import '../app_theme/constants.dart';
import '../view_customers/view_customers.dart';
import 'componants/embroidoryForm.dart';
import 'componants/order_details_form.dart';
import 'componants/stylingForm.dart';
import 'cubit/order_cubit.dart';

class SaveOrderPage extends StatefulWidget {
  SaveOrderPage({super.key, required this.customerId});
final String customerId;
  @override
  State<SaveOrderPage> createState() => _SaveOrderPageState();
}

class _SaveOrderPageState extends State<SaveOrderPage> {
  Order order = Order();

  ImagePicker picker = ImagePicker();
  XFile? image;

  final TextEditingController _bookDesignController = TextEditingController();
@override
  void initState() {
    // TODO: implement initState
    order.customerId = widget.customerId;
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderCubit, OrderState>(
      listener: (context, state) {
        if (state is OrderAdded) {
          orderSavedDialog(context);
        }
      },
      child: Scaffold(
        backgroundColor: primaryColor.withOpacity(0.3),
        body: Flex(
          direction: ResponsiveBreakpoints.of(context).largerThan(TABLET)
              ? Axis.horizontal
              : Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppDrawer(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      CustomAppBar(),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Order Details/آرڈر کی تفصیلات',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 40),
                        margin: const EdgeInsets.symmetric(horizontal: 60),
                        decoration: BoxDecoration(
                            border: Border.all(color: borderColor),
                            borderRadius: BorderRadius.circular(5),
                            color: primaryColor.withOpacity(0.6)),
                        child: Wrap(
                          runSpacing: 20,
                          spacing: 60,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Customer Name/کسٹمر کا نام',
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                    height: 40,
                                    width: 500,
                                    child: CustomDropdownSearch(
                                      dropdownItems: [],
                                      isDefault: true,
                                      onValueChanged: (String) {},
                                    ))
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Customer Id/کسٹمر آئی ڈی',
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                    height: 40,
                                    width: 500,
                                    child: CustomDropdownSearch(
                                      dropdownItems: [],
                                      isDefault: true,
                                      onValueChanged: (val) {},
                                    ))
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Order Category/ آرڈر کی کیٹگری',
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                    height: 40,
                                    width: 500,
                                    child: CustomDropdownSearch(
                                      dropdownItems: [
                                        'Male /مردانہ',
                                        'Female /زنانہ'
                                      ],
                                      isDefault: false,
                                      onValueChanged: (String) {},
                                    ))
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Order Type/ آرڈر کی قسم',
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                    height: 40,
                                    width: 500,
                                    child: CustomDropdownSearch(
                                      dropdownItems: const [
                                        'Shalwar Qamees /شلوار قمیص',
                                        'Shirt /شرٹ',
                                        'Kurta Shalwar /کُرتا پاجامہ',
                                        'Waist Coat / ویس کوٹ',
                                        'Trouser / ٹراؤزر'
                                      ],
                                      isDefault: false,
                                      onValueChanged: (String) {},
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Dress Styling / پرہیز',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 40),
                        margin: const EdgeInsets.symmetric(horizontal: 60),
                        decoration: BoxDecoration(
                            border: Border.all(color: borderColor),
                            borderRadius: BorderRadius.circular(5),
                            color: primaryColor.withOpacity(0.6)),
                        child: Wrap(
                          runSpacing: 20,
                          spacing: 20,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Cuff Styling/کف ',
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                    height: 40,
                                    width: 250,
                                    child: CustomDropdownSearch(
                                      dropdownItems: [
                                        'Cuff / کف والے بازو',
                                        'Simple /سادہ بازو'
                                      ],
                                      isDefault: false,
                                      onValueChanged: (val) {
                                        order.cuffStyle = val;
                                      },
                                    ))
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Neck Styling/گلا',
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                    height: 40,
                                    width: 250,
                                    child: CustomDropdownSearch(
                                      dropdownItems: [
                                        'Collar /کالر',
                                        'Ban /بین '
                                      ],
                                      isDefault: false,
                                      onValueChanged: (val) {
                                        order.neckStyle = val;
                                      },
                                    ))
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Button Styling/ بٹن',
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                    height: 40,
                                    width: 250,
                                    child: CustomDropdownSearch(
                                      dropdownItems: [
                                        'Fancy /فینسی بٹن',
                                        'Simple /سادہ بٹن ',
                                        'Metallic /میٹل بٹن'
                                      ],
                                      isDefault: false,
                                      onValueChanged: (val) {
                                        order.buttonStyle = val;
                                      },
                                    ))
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Pocket Styling/جیب',
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                    height: 40,
                                    width: 250,
                                    child: CustomDropdownSearch(
                                      dropdownItems: const [
                                        'Front Pocket / سامنے والی جیب',
                                        '2 Side Pockets / سائڈ جیب ',
                                        'Trouser Pocket / ٹراؤزر جیب ',
                                        ' 1 Front Pocket+2Side+1 Shalwar',
                                        ' 0 Front Pocket+0 Side+0Shalwar',
                                        ' 0 Front + 2 Side+ 1 Trouser Pocket',
                                        ' 2 Front + 2 Side+ 1 Shalwar',
                                        ' 0 Front + 1 Left Side+ 0 Shalwar',
                                        ' 0 Front + 1 Right Side+ 0 Shalwar'
                                      ],
                                      isDefault: false,
                                      onValueChanged: (val) {
                                        order.pocketStyle = val;
                                      },
                                    ))
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Elastic/لاسٹک',
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                    height: 40,
                                    width: 250,
                                    child: CustomDropdownSearch(
                                      dropdownItems: [
                                        'Elastic / لاسٹک',
                                        'Simple/نالا'
                                      ],
                                      isDefault: false,
                                      onValueChanged: (val) {
                                        order.elastic = val;
                                      },
                                    ))
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Embroidery / کڑھائی',
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                    height: 40,
                                    width: 250,
                                    child: CustomDropdownSearch(
                                      dropdownItems: [
                                        'No / کوئی نہیں',
                                        'Yes / جی ہاں'
                                      ],
                                      isDefault: false,
                                      onValueChanged: (val) {
                                        order.embroidery = val;
                                      },
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Embroidary Details/کڑہائی کی تفصیلات',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 40),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Embroidary Style/کڑہائی کا سٹائل',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge,
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
                                            onValueChanged: (val) {
                                              order.embroidaryStyle = val;
                                            },
                                          ))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Book Number/کتاب کا نمبر ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      SizedBox(
                                          height: 40,
                                          width: 430,
                                          child: CustomDropdownSearch(
                                            dropdownItems: ['1', '2', '3'],
                                            isDefault: false,
                                            onValueChanged: (val) {
                                              order.bookNumber = int.parse(val);
                                            },
                                          ))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Design Number/ ڈیزائن نمبر',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      SizedBox(
                                        height: 40,
                                        width: 430,
                                        child: TextField(
                                          cursorColor: borderColor,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge,
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
                                    image = await picker.pickImage(
                                        source: ImageSource.gallery);

                                    setState(() {});
                                  },
                                  child: Container(
                                    width: 500,
                                    height: 275,
                                    child: image == null
                                        ? Image.asset('images/pickImage.png')
                                        : Stack(
                                            alignment: Alignment.topRight,
                                            children: [
                                                Image.network(
                                                  image!.path,
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  fit: BoxFit.fill,
                                                ),
                                                IconButton(
                                                  icon: Icon(Icons.delete,
                                                      color: iconColor),
                                                  onPressed: () {
                                                    setState(() {
                                                      image = null;
                                                    });
                                                  },
                                                )
                                              ]),
                                  ))
                            ],
                          )),

                      //
                      const SizedBox(
                        height: 20,
                      ),
                      BlocBuilder<OrderCubit, OrderState>(
                        builder: (context, state) {
                          if(state is LoadingOrder){
                            return CircularProgressIndicator(color: primaryColor,);

                          }
                          return ElevatedButton(
                              onPressed: () {
                                order.designNumber =
                                    int.parse(_bookDesignController.text);
                               
                                context.read<OrderCubit>().addOrder(order);
                              },
                              child: Text(
                                'Save Order/ آرڈر کو محفوظ کریں',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  orderSavedDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      actionsPadding: EdgeInsets.only(bottom: 30, left: 20, right: 20),
      backgroundColor: Colors.white.withOpacity(0.8),
      content: Text(
        "Order Saved Successfully!",
        style: Theme.of(context)
            .textTheme
            .labelLarge
            ?.copyWith(color: primaryColor, fontWeight: FontWeight.w600),
      ),
      actions: [
        OutlinedButton(
            style: OutlinedButton.styleFrom(
                fixedSize: const Size(150, 60),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                side: const BorderSide(color: primaryColor)),
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CustomerForm(),
                  ));
            },
            child: Text(
              'Main Page',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(color: primaryColor),
            )),
        const SizedBox(
          width: 30,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ViewCustomers(),
                ));
          },
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(150, 60),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
          child: Text(
            'Customer View',
            style: Theme.of(context).textTheme.labelLarge,
          ),
        )
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
