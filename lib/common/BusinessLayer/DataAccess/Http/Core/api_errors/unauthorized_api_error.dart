import 'package:dio/dio.dart';

class UnauthorizedApiError extends DioError {
  UnauthorizedApiError() : super(requestOptions: RequestOptions(path: ''));
}
