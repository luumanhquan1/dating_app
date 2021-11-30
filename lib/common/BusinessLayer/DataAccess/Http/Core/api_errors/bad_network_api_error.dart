import 'package:dio/dio.dart';

class BadNetworkApiError extends DioError {
  BadNetworkApiError() : super(requestOptions: RequestOptions(path: ''));
}
