import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
     //CAN HANDLE LOGIN HERE
    handler.next(options);
  }
}
