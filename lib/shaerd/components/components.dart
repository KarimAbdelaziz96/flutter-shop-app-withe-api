// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names, camel_case_types, dead_code

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void NavigatTO(context, Widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => Widget));

void NavigatAndfinsh(context, Widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => Widget),
    (Route<dynamic> Route) => false);

void ShowToast({required String text, required toastState state}) =>
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: choosetoastcolor(state),
        textColor: Colors.white,
        fontSize: 16.0);

enum toastState { success, eroor, warnnig }

Color choosetoastcolor(toastState state) {

  switch (state) {
    case toastState.success:
      return Colors.green;
      break;
    case toastState.eroor:
       return Colors.red;
      break;
    case toastState.warnnig:
      return Colors.amberAccent;
      break;
  }

}
