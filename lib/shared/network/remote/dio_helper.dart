//http://newsapi.org/v2/top-headlines?country=eg&category=business&apikey=65f7f556ec76449fa7dc7c0069f040ca
//https://newsapi.org/v2/everything?q=tesla&from=2021-06-18&sortBy=publishedAt&apiKey=b0e0dd81a02a4effaf57d863ae37d283
import 'package:dio/dio.dart';

class DioHelper {
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
