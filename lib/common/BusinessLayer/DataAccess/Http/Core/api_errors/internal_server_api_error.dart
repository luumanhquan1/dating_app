import 'package:dio/dio.dart';

class InternalServerApiError extends DioError {
  InternalServerApiError() : super(requestOptions: RequestOptions(path: ''));
}
