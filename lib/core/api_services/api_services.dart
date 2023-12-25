import 'package:dio/dio.dart';

class ApiServices {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://admin.wasiljo.com/public/api/v1/',
        contentType: 'application/json',
      ),
    );
  }

  Future<dynamic> getData({
    required String endPoint,
    Map<String,dynamic>? query,
  }) async{
    var response = await dio.get(
      endPoint,
      queryParameters: query,
    );
    return response.data;
  }

  Future<Response> postData({
    required String path,
    required Map<String,dynamic> data ,
  }) async{
    return await dio.post(
      path,
      data: data,

    );
  }
}