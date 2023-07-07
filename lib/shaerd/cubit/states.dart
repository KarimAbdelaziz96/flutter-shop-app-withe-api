// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_application_1/model/shop_model.dart';

abstract class ShoploginStates {}

class ShoploginInitialState extends ShoploginStates {}

class ShoploginLoadingState extends ShoploginStates {}

class ShoplogicSuccessState extends ShoploginStates {
   final ShopAppModel loginmodel;

  ShoplogicSuccessState(this.loginmodel);
  
}

class ShoploginErrorState extends ShoploginStates {
  final String? error;

  ShoploginErrorState(this.error);
}

class ShopChangePasswordState extends ShoploginStates {}
