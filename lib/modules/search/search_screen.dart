// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20,
      ),
      body: Center(child: Text('SearchScreen',style: TextStyle(fontSize: 30.0,color: Colors.black,fontWeight: FontWeight.bold),)),
    );
  }
}