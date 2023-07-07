// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('FavoritesScreen',
       style: TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.bold
      ),)),
    );
  }
}