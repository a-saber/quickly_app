import 'package:dio/dio.dart';

class DioHelper
{
  static late Dio dio;

  static init()
  {
    dio = Dio(
        BaseOptions(
            baseUrl: "https://www.quickly-egypt.com/api/v1",
            receiveDataWhenStatusError: true,
          connectTimeout: const Duration(seconds: 5),
        )
    );
  }
  static Future<Response> getDate
      ({
    required String url,
    Map <String,dynamic>? query,
    String lang = 'en',
    String? token ,
  }) async
  {
    dio.options.headers =
        {
          'Content-Type' : 'application/json',
          'lang':lang,
          'Authorization': token??''
        };
    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> postDate
      ({
        required String endPoint,
        Map <String,dynamic>? query,
        Map <String,dynamic>? data,
      }) async
  {
    if(data != null)
    {
      dio.options.headers = data;
    }
    return dio.post(
      endPoint,
      queryParameters: query,
    );
  }

  static Future<Response> putDate
      ({
    required String url,
    required Map <String,dynamic> data,
    Map <String,dynamic>? query,
    String lang = 'en',
    String? token ,
  }) async
  {
    dio.options.headers =
    {
      'Content-Type' : 'application/json',
      'lang':lang,
      'Authorization': token??''
    };
    return  dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }


}