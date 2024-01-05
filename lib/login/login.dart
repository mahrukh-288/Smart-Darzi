import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../add_customer/addCustomerPage.dart';
import '../add_customer/cubit/customer_cubit.dart';
import '../app_theme/constants.dart';

class Login extends StatelessWidget {
  Login({super.key});
  late CustomerCubit _customerCubit;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _customerCubit = context.read<CustomerCubit>();
    return BlocListener<CustomerCubit, CustomerState>(
      listener: (ctx, state) {
        if (state is LoggedIn) {
          // loggedInDialog(context);
          //Navigator.pop(context);
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => CustomerForm(),
              ));
        } else if (state is Failure) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                actionsPadding:
                    EdgeInsets.only(bottom: 30, left: 20, right: 20),
                backgroundColor: Colors.white.withOpacity(0.8),
                content: Text(
                  "Something went wrong!",
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: primaryColor, fontWeight: FontWeight.w600),
                ),
              );
            },
          );
        }
      },
      child: Scaffold(
        backgroundColor: primaryColor.withOpacity(0.6),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * 0.3, vertical: 50),
          child: Column(
            children: [
              Text(
                'Lets get started',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Sign up or login to become Smart',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.white.withOpacity(0.5),
                    ),
              ),
              SizedBox(
                height: 30,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Username',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        style: Theme.of(context).textTheme.labelLarge,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This field is required!';
                          }
                          return null;
                        },
                        controller: _nameController,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Password',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        style: Theme.of(context).textTheme.labelLarge,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This field is required!';
                          }
                          return null;
                        },
                        controller: _passwordController,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 15,
                                width: 15,
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                      color: borderColor,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(2))),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                'Remember',
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ],
                          ),
                          TextButton(
                              style: TextButton.styleFrom(),
                              onPressed: () {},
                              child: Text(
                                'Forgot Password',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(
                                        decoration: TextDecoration.underline,
                                        decorationColor: iconColor),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      BlocBuilder<CustomerCubit, CustomerState>(
                        builder: (context, state) {
                          if (state is LoadingCustomer) {
                            return CircularProgressIndicator(color: primaryColor,);
                          }
                          return Center(
                            child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _customerCubit.login(_nameController.text,
                                        _passwordController.text);
                                  }
                                },
                                child: Text(
                                  'Login',
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                )),
                          );
                        },
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  loggedInDialog(BuildContext context) {
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actionsPadding: EdgeInsets.only(bottom: 30, left: 20, right: 20),
          backgroundColor: Colors.white.withOpacity(0.8),
          content: Text(
            "Logged In Successfully!",
            style: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(color: primaryColor, fontWeight: FontWeight.w600),
          ),
        );
      },
    );
  }
}
