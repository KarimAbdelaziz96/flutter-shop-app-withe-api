// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names, unnecessary_null_comparison, avoid_print
// ignore_for_file: prefer_const_constructors, unused_import

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/layout/cubit/cubit.dart';
import 'package:flutter_application_1/layout/cubit/states.dart';
import 'package:flutter_application_1/layout/shop_layout/shop_layout.dart';
import 'package:flutter_application_1/shaerd/bloc_observer/bloc_observer.dart';
import 'package:flutter_application_1/shaerd/costants/constants.dart';
import 'package:flutter_application_1/shaerd/cubit/cubit.dart';
import 'package:flutter_application_1/shaerd/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'modules/login/login_Screen.dart';
import 'modules/onboarding/onboarding.dart';
import 'shaerd/network/local/cash_helper.dart';
 
 
 
 
 class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
void main() async {
   HttpOverrides.global = MyHttpOverrides();

  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  cashHelper.Init();
  await DioHelper.init();
  Widget widget;
  bool? onBoarding = cashHelper.getdata(Key: "onBoarding") as bool?;
  token = cashHelper.getdata(Key: "token") ?? "";

  
  if (onBoarding != null && onBoarding) {
    if (token != null) {
      widget = Shoplayout();
    } else {
      widget = ShopLoginScreen();
    }
  } else {
    widget = OnBoardingScreen();
  }
  runApp(MyApp(
    
    StartWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget StartWidget;

  const MyApp({
    Key? key,
    required this.StartWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ShoploginCubit(),
          child: Container(),
        ),
        BlocProvider(
          create: (context) => Shopcubit()
            ..getHomedata()
            ..getCategoriesData(),
            
        ),
      ],
      child: BlocConsumer<Shopcubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
              theme: ThemeData(primarySwatch: Colors.deepPurple),
              debugShowCheckedModeBanner: false,
              home: StartWidget);
        },
      ),
    );
  }
}
