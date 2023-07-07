// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';

class settingsScreen extends StatelessWidget {
  const settingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('settingsScreen',
       style: TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.bold
      ),)),
    );
  }
}