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
import '../app_theme/constants.dart';
import '../view_customers/view_customers.dart';
import 'componants/embroidoryForm.dart';
import 'componants/order_details_form.dart';
import 'componants/stylingForm.dart';
import 'cubit/order_cubit.dart';

class SaveOrderPage extends StatefulWidget {
  SaveOrderPage({super.key});

  @override
  State<SaveOrderPage> createState() => _SaveOrderPageState();
}

class _SaveOrderPageState extends State<SaveOrderPage> {
  final TextEditingController _styleController = TextEditingController();
  ImagePicker picker = ImagePicker();
  XFile? image;
  final TextEditingController _bookNoController = TextEditingController();

  final TextEditingController _bookDesignController = TextEditingController();
  TextEditingController _customerNameController = TextEditingController();

  TextEditingController _orderIdController = TextEditingController();
  TextEditingController _orderCategoryController = TextEditingController();

  TextEditingController _orderTypeController = TextEditingController();
  final TextEditingController _cuffController = TextEditingController();
  final TextEditingController _neckController = TextEditingController();
  final TextEditingController _pocketController = TextEditingController();
  final TextEditingController _elasticController = TextEditingController();
  final TextEditingController _embroidaryController = TextEditingController();
  final TextEditingController _buttonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderCubit, OrderState>(
      listener: (context, state) {
        if(state is OrderAdded){
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
                            sizeTextField(context, 'Customer Name/کسٹمر کا نام',
                                [], _customerNameController, false),
                            sizeTextField(context, 'Customer Id/کسٹمر آئی ڈی',
                                [], _orderIdController, false),
                            sizeTextField(
                                context,
                                'Order Category/ آرڈر کی کیٹگری',
                                ['Male /مردانہ', 'Female /زنانہ'],
                                _orderCategoryController,
                                true),
                            sizeTextField(
                                context,
                                'Order Type/ آرڈر کی قسم',
                                [
                                  'Shalwar Qamees /شلوار قمیص',
                                  'Shirt /شرٹ',
                                  'Kurta Shalwar /کُرتا پاجامہ',
                                  'Waist Coat / ویس کوٹ',
                                  'Trouser / ٹراؤزر'
                                ],
                                _orderTypeController,
                                true),
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
                            sizeTextField(
                                context,
                                'Cuff Styling/کف ',
                                ['Cuff / کف والے بازو', 'Simple /سادہ بازو'],
                                _cuffController,
                                true),
                            sizeTextField(
                                context,
                                'Neck Styling/گلا',
                                ['Collar /کالر', 'Ban /بین '],
                                _neckController,
                                true),
                            sizeTextField(
                                context,
                                'Button Styling/ بٹن',
                                [
                                  'Fancy /فینسی بٹن',
                                  'Simple /سادہ بٹن ',
                                  'Metallic /میٹل بٹن'
                                ],
                                _buttonController,
                                true),
                            sizeTextField(
                                context,
                                'Pocket Styling/جیب',
                                [
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
                                _pocketController,
                                true),
                            sizeTextField(
                                context,
                                'Elastic/لاسٹک',
                                ['Elastic / لاسٹک', 'Simple/نالا'],
                                _elasticController,
                                true),
                            sizeTextField(
                                context,
                                'Embroidery / کڑھائی',
                                ['No / کوئی نہیں', 'Yes / جی ہاں'],
                                _embroidaryController,
                                true),
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
                                  sizeTextField(
                                      context,
                                      'Embroidary Style/کڑہائی کا سٹائل',
                                      [
                                        'Single Salai / سنگل سلائی',
                                        'Double Salai /ڈبل سلائی',
                                        'Raishmi   Single/ریشمی سنگل',
                                        'Raishmi   Double/ریشمی ڈبل'
                                      ],
                                      _styleController,
                                      true),
                                  // SizedBox(
                                  //   height: 20,
                                  // ),
                                  // sizeTextField(
                                  //     context,
                                  //     'Book Number/کتاب کا نمبر ',
                                  //     ['Book 1', 'Book 2', 'Book 3'],
                                  //     _bookNoController,
                                  //     true),
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
                                        height: 50,
                                        width: 500,
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
                              // InkWell(
                              //     onTap: () async {
                              //       image = await picker.pickImage(
                              //           source: ImageSource.gallery);

                              //       setState(() {});
                              //     },
                              //     child: Container(
                              //       width: 500,
                              //       height: 275,
                              //       child: image == null
                              //           ? Image.asset('images/pickImage.png')
                              //           : Stack(
                              //               alignment: Alignment.topRight,
                              //               children: [
                              //                   Image.network(
                              //                     image!.path,
                              //                     width: double.infinity,
                              //                     height: double.infinity,
                              //                     fit: BoxFit.fill,
                              //                   ),
                              //                   IconButton(
                              //                     icon: Icon(Icons.delete,
                              //                         color: iconColor),
                              //                     onPressed: () {
                              //                       setState(() {
                              //                         image = null;
                              //                       });
                              //                     },
                              //                   )
                              //                 ]),
                              //     ))
                            ],
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Order order = Order(
                                customerId: 'test',
                                cuffStyle: _cuffController.text,
                                neckStyle: _neckController.text,
                                buttonStyle: _buttonController.text,
                                pocketStyle: _pocketController.text,
                                elastic: _elasticController.text,
                                embroidery: _embroidaryController.text,
                                embroidaryStyle: _styleController.text,
                                bookNumber: int.parse(_bookNoController.text),
                                designNumber:
                                    int.parse(_bookDesignController.text));
                            context.read<OrderCubit>().addOrder(order);
                          },
                          child: Text(
                            'Save Order/ آرڈر کو محفوظ کریں',
                            style: Theme.of(context).textTheme.headlineSmall,
                          )),
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

  Widget sizeTextField(BuildContext context, label, List<String> dropdownItems,
      TextEditingController controller, bool enabled) {
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
            height: 50,
            width: 500,
            child: TextField(
              enabled: enabled,
              controller: controller,
              decoration: InputDecoration(
                  suffix: DropdownButton(
              
                iconEnabledColor: primaryColor,
                style: Theme.of(context).textTheme.labelLarge,
                dropdownColor: primaryColor,
                items: dropdownItems.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  controller.text = value!;
                  print(controller.text);
                },
              )),
            ))
      ],
    );
  }
}
