// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable, avoid_print

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/layout/shop_layout/shop_layout.dart';
import 'package:flutter_application_1/shaerd/costants/constants.dart';
import 'package:flutter_application_1/shaerd/cubit/cubit.dart';
import 'package:flutter_application_1/shaerd/cubit/states.dart';
import 'package:flutter_application_1/modules/register/register_Screen.dart';
import 'package:flutter_application_1/shaerd/components/components.dart';
import 'package:flutter_application_1/shaerd/network/local/cash_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

var emailController = TextEditingController();
var passwordController = TextEditingController();

class ShopLoginScreen extends StatelessWidget {
  ShopLoginScreen({super.key});
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShoploginCubit(),
      child: BlocConsumer<ShoploginCubit, ShoploginStates>(
        listener: (context, state) {
          if (state is ShoplogicSuccessState) {
            if (state.loginmodel.status) {
              print(state.loginmodel.message);
              print(state.loginmodel.data.token);

              cashHelper.SaveData(
                      Key: 'token', Value: state.loginmodel.data.token)
                  .then((value) {
                token = state.loginmodel.data.token!;
                NavigatAndfinsh(context, Shoplayout());
              });
            } else {
              print(state.loginmodel.message);
              ShowToast(
                  text: state.loginmodel.message, state: toastState.eroor);
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffA376FE)),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "Please sign in to continue",
                          style: TextStyle(fontSize: 20.0, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter your Email Adress';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: Colors.black)),
                              label: Text('EMAIL'),
                              prefixIcon: Icon(Icons.email_sharp),
                              iconColor: Color(0xffA376FE),
                              counterStyle:
                                  TextStyle(color: Color(0xffA376FE))),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                          obscureText:
                              ShoploginCubit.get(context).isPasswordVisible,
                          keyboardType: TextInputType.visiblePassword,
                          controller: passwordController,
                          onFieldSubmitted: (value) {
                            if (formkey.currentState!.validate()) {
                              ShoploginCubit.get(context).usersLogin(
                                  email: emailController.text,
                                  password: passwordController.text);
                            }
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter your password';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: Colors.black)),
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: IconButton(
                                icon: ShoploginCubit.get(context)
                                        .isPasswordVisible
                                    ? Icon(Icons.visibility)
                                    : Icon(Icons.visibility_off),
                                onPressed: () {
                                  ShoploginCubit.get(context)
                                      .changePasswordvisibility();
                                },
                              ),
                              label: Text('Password'),
                              iconColor: Color(0xffA376FE),
                              counterStyle:
                                  TextStyle(color: Color(0xffA376FE))),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Center(
                          child: ConditionalBuilder(
                            condition: state is! ShoploginLoadingState,
                            builder: (context) => Container(
                              width: 240.0,
                              decoration: BoxDecoration(
                                color: Color(0xffA376FE),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: TextButton.icon(
                                  onPressed: () {
                                    if (formkey.currentState!.validate()) {
                                      ShoploginCubit.get(context).usersLogin(
                                          email: emailController.text,
                                          password: passwordController.text);
                                    }
                                  },
                                  icon: Icon(
                                    Icons.login,
                                    color: Colors.white,
                                  ),
                                  label: Text(
                                    'LOGIN'.toUpperCase(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                            fallback: (context) =>
                                Center(child: CircularProgressIndicator()),
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Row(
                          children: [
                            Text(
                              'Don\t have an account ',
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  NavigatTO(context, RegisterScreen());
                                },
                                child: Text(
                                  'Register !'.toLowerCase(),
                                  style: TextStyle(fontSize: 18.0),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
