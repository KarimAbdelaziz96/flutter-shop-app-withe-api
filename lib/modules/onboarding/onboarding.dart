// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, unnecessary_string_interpolations
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/login/login_Screen.dart';
import 'package:flutter_application_1/modules/register/register_Screen.dart';
import 'package:flutter_application_1/shaerd/network/local/cash_helper.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../shaerd/components/components.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var BoardingContorller = PageController();

  List<BoardingModel> Boarding = [
    BoardingModel(
      image: 'Assets/images/onboarding_1.png',
      title: 'Strin Less Groceries',
      body:
          'Select cheap and best products from a wide variety of groceries in Karim stores',
    ),
    BoardingModel(
      image: 'Assets/images/onboarding_2.png',
      title: 'Touch To order ',
      body:
          'Add your favorite item in the cart and place an order to get your groceries ',
    ),
    BoardingModel(
      image: 'Assets/images/onboarding_3.png',
      title: 'Rapid delivery at doorstep',
      body:
          'Guaranteed swift  delivery at your doorstep and you can alsocash on delivery option ',
    )
  ];

  bool islast = true;

  void submit() {
    cashHelper.SaveData(Key: "onBoarding", Value: true).then((value) {
      if (value != null) {
        NavigatAndfinsh(context, ShopLoginScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          TextButton.icon(
              onPressed: () {
                submit();
              },
              icon: Icon(
                Icons.skip_next,
                color: Colors.grey,
              ),
              label: Text(
                'SKIP',
                style: TextStyle(color: Colors.grey),
              )),
        ],
      ),
      backgroundColor: Color(0xfffaf9fd),
      body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(children: [
            Expanded(
              child: PageView.builder(
                controller: BoardingContorller,
                physics: BouncingScrollPhysics(),
                onPageChanged: (int index) {
                  if (index == Boarding.length - 1) {
                    setState(() {
                      islast = true;
                    });
                  } else {
                    setState(() {
                      islast = false;
                    });
                  }
                },
                itemBuilder: (Context, index) =>
                    BuildBoardingItem(Boarding[index]),
                itemCount: Boarding.length,
              ),
            ),
            SmoothPageIndicator(
              controller: BoardingContorller,
              count: Boarding.length,
              effect:
                  WormEffect(activeDotColor: Color(0xffA376FE), offset: 15.0),
            ),
            SizedBox(
              height: 70.0,
            ),
            Container(
              width: 150.0,
              decoration: BoxDecoration(
                color: Color(0xffA376FE),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: RippleAnimation(
                color: Color(0xffA376FE),
              delay: const Duration(milliseconds:300),
              repeat: true,
              minRadius: 35,
              ripplesCount: 6,
              duration: const Duration(milliseconds: 6 * 300),
                child: TextButton.icon(
                    onPressed: () {
                      if (islast) {
                        submit();
                      } else {
                        BoardingContorller.nextPage(
                            duration: Duration(microseconds: 750),
                            curve: Curves.fastEaseInToSlowEaseOut);
                      }
                    },
                    icon: Icon(
                      Icons.login,
                      color: Colors.white,
                    ),
                    label: Text(
                      'LOGIN',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                    )),
              
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextButton.icon(
                onPressed: () {
                  NavigatAndfinsh(context, RegisterScreen());
                },
                icon: Icon(
                  Icons.arrow_forward_sharp,
                  color: Colors.black,
                ),
                label: Text(
                  'Register',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 15.0),
                )),
          ])),
    );
  }

  Widget BuildBoardingItem(BoardingModel model) => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${model.title}',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffA376FE)),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              '${model.body}',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 10.0,
              ),
            ),
            Expanded(
              child: Image(
                image: AssetImage('${model.image}'),
              ),
            ),
          ]);
}
