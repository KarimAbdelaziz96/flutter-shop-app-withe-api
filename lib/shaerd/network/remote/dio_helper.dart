// ignore_for_file: non_constant_identifier_names


import 'dart:io';

import 'package:dio/dio.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}




class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        validateStatus: (status) => true,
        receiveDataWhenStatusError: true,
        // headers: {'Content-Type': 'application/json'}
        ));
  }

  static Future<Response> getdata({
    required String url,
    Map<String, dynamic>? query,
    String Lang = 'ar',
    String? Token,
  }) async {

    

    
    
    if (dio == null) {
      init();
    }
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'lang': Lang,
      'Authorization': Token??''
    };
    return await dio!.get(url, queryParameters: query);
  }

  static Future<Response> postdata({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String Lang = 'ar',
    String? Token,
  }) async {
    if (dio == null) {
      init();
    }
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'lang': Lang,
      'Authorization': Token??''
    };
    return await dio!.post(url, queryParameters: query, data: data);
  }
}
