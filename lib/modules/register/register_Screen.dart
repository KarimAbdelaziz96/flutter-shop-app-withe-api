// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/login/login_Screen.dart';

import '../../shaerd/components/components.dart';

class RegisterScreen  extends StatelessWidget {
  const RegisterScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Register",
                  style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffA376FE)),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Please sign in to continue",
                  style: TextStyle(fontSize: 25.0, color: Colors.grey),
                ),
                SizedBox(
                  height: 15.0,
                ),
                 TextFormField(
                  keyboardType: TextInputType.text,
                  controller: emailController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.black)),
                      label: Text('Name'),
                      prefixIcon: Icon(Icons.person),
                      iconColor: Color(0xffA376FE),
                      counterStyle: TextStyle(color: Color(0xffA376FE))),
                ),
                SizedBox(
                    height: 15.0,
                ),
                  TextFormField(
                  keyboardType: TextInputType.phone,
                  controller: emailController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.black)),
                      label: Text('PHON'),
                      prefixIcon: Icon(Icons.phone_android),
                      iconColor: Color(0xffA376FE),
                      counterStyle: TextStyle(color: Color(0xffA376FE))),
                ),
                SizedBox(
                      height: 15.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.black)),
                      label: Text('EMAIL'),
                      prefixIcon: Icon(Icons.email_sharp),
                      iconColor: Color(0xffA376FE),
                      counterStyle: TextStyle(color: Color(0xffA376FE))),
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  controller: passwordController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.black)),
                      suffixIcon: Icon(Icons.remove_red_eye_rounded),
                      
                      prefixIcon: Icon(Icons.lock),
                      label: Text('Password'),
                      iconColor: Color(0xffA376FE),
                      counterStyle: TextStyle(color: Color(0xffA376FE))),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Center(
                  child: Container(
                    width: 240.0,
                    decoration: BoxDecoration(
                      color: Color(0xffA376FE),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: TextButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.login,
                          color: Colors.white,
                        ),
                        label: Text(
                          'Register Now'.toUpperCase(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Row(
                  children: [
                    Text(
                      'al ready have an account ? ',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          NavigatTO(
                            context,ShopLoginScreen()
                          );
                        },
                        child: Text(
                          'login !',
                          style: TextStyle(fontSize: 18.0),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}