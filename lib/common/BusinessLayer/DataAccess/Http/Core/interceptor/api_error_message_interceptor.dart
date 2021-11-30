import 'package:dio/dio.dart';

class ApiErrorMessageInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }
}
