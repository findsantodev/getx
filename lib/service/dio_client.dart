import 'dart:developer';

import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio = Dio();

  final _baseUrl = 'https://api.kanye.rest';

  Future<Response> getData({required endpoint}) async {
    try {
      Response response = await _dio.get(_baseUrl + endpoint);

      return response;
    } on DioError catch (e) {
      if (e.response != null) {
        log('Dio error!');
        log('STATUS: ${e.response?.statusCode}');
        log('DATA: ${e.response?.data}');
        log('HEADERS: ${e.response?.headers}');
        throw ("Try again later");
      } else {
        log('Error sending request!');
        log(e.message);
        throw (e.message);
      }
    }
  }
}
