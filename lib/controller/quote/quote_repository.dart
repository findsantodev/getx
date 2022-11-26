import 'package:dio/dio.dart';

import '../../service/dio_client.dart';

class QuoteRepository {
  final DioClient _client = DioClient();

  getQuote({endpoint}) async {
    final Response result = await _client.getData(endpoint: endpoint);

    return result;
  }
}
