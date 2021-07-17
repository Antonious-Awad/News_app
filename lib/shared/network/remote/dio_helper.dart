//http://newsapi.org/v2/top-headlines?country=eg&category=business&apikey=65f7f556ec76449fa7dc7c0069f040ca

import 'package:dio/dio.dart';

class dioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: "http://newsapi.org/",
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData(String url , Map<String, dynamic> queries ) async{
    return await dio!.get(url , queryParameters: queries);
  }
}
