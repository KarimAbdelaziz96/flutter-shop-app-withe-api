// ignore_for_file: non_constant_identifier_names, avoid_print, avoid_types_as_parameter_names, valid_regexps

import 'package:flutter/material.dart';
import 'package:flutter_application_1/layout/cubit/states.dart';
import 'package:flutter_application_1/layout/shop_layout/home_model.dart';
import 'package:flutter_application_1/model/categories.dart';
import 'package:flutter_application_1/modules/Categories/Categories_screen.dart';
import 'package:flutter_application_1/modules/Favorites/Favorites_screen.dart';
import 'package:flutter_application_1/modules/Products/Products_screen.dart';
import 'package:flutter_application_1/modules/settings/settings_screen.dart';
import 'package:flutter_application_1/shaerd/costants/constants.dart';
import 'package:flutter_application_1/shaerd/network/remote/dio_helper.dart';
import 'package:flutter_application_1/shaerd/network/remote/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Shopcubit extends Cubit<ShopStates> {
  Shopcubit() : super(ShoplayoutInitialStates());

  static Shopcubit get(context) => BlocProvider.of(context);

  int currentindex = 0;

  List<Widget> screens = const [
    ProductsScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    settingsScreen(),
  ];

  void ChangeBottomNAn(int index) {
    currentindex = index;
    emit(ShopchangeBottomNavStates());
  }

  late HomeModel homeModel;

  void getHomedata() {
    emit(ShoploadingHomDataStates());

    DioHelper.getdata(url: Home, Token: token).then((value) {
      homeModel = HomeModel.fromJson(value.data);

      print(homeModel.data.banners[1].image);

      printfultext(homeModel.data.banners[1].image);
      print(homeModel.status);
      emit(ShopSuccesHomDataStates());
    }).catchError((Error) {
      print(Error.toString());
      emit(ShopErrorHomDataStates());
    });
  }

   late CategoriesModel categoriesModel;

  void getCategoriesData() {
    DioHelper.getdata(url: Get_Categories, Token: token).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);


      emit(ShopSuccesCategoriesStates());
    }).catchError((Error) {
      print(Error.toString());
      emit(ShopErrorHomDataStates());
    });
  }


  
}



void printfultext(String text) {
  final Pattern = RegExp('{1,800}');
  Pattern.allMatches(text).forEach((match) {
    print(match.group(0));
  });
}
