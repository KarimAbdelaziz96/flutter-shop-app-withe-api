// ignore_for_file: avoid_print, non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/shop_model.dart';
import 'package:flutter_application_1/shaerd/cubit/states.dart';
import 'package:flutter_application_1/shaerd/network/remote/dio_helper.dart';
import 'package:flutter_application_1/shaerd/network/remote/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShoploginCubit extends Cubit<ShoploginStates> {
  ShoploginCubit() : super(ShoploginInitialState());

  static ShoploginCubit get(context) => BlocProvider.of(context);
  late ShopAppModel loginmodel;

  void usersLogin({required String email, required String password}) {
    emit(ShoploginLoadingState());
    DioHelper.postdata(url: LOGIN, data: {'email': email, 'password': password})
        .then((value) {
      loginmodel = ShopAppModel.fromjson(value.data);
      // print(loginmodel.status);
      // print(loginmodel.message);
      // print(loginmodel.data.token);

      // print(value.data);
      emit(ShoplogicSuccessState(loginmodel));
    }).catchError((Error) {
      print(Error.toString());
      emit(ShoploginErrorState(Error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPasswordVisible = true;
  void changePasswordvisibility() {
    isPasswordVisible = !isPasswordVisible;

    emit(ShopChangePasswordState());
  }
}

