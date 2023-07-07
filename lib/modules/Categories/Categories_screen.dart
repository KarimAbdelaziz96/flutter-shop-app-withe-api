// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:image_card/image_card.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
        body: Column(
      children: [
        FillImageCard(
          
          width: 200,
          heightImage: 140,
          imageProvider: AssetImage('Assets/images/onboarding_1.png'),
          title: Text(
            'hello world'
          ),
          description:Text(
            'hello KArimalaa'
          ) ,
          borderRadius:25
        ),
        SizedBox(
height: 40.0,
        ),
TransparentImageCard(
  width: 200,
  imageProvider:AssetImage('Assets/images/onboarding_1.png'),
  title: Text(
            'hello world',
              style: TextStyle(
              color: Colors.white
            ),
          ),
  description: Text(
            'hello KArimalaa',


            style: TextStyle(
              color: Colors.white
            ),
          ) ,
          
),
        
      ],
    ));
  }
}
