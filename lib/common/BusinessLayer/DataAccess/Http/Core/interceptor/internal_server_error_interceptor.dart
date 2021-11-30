import 'package:dio/dio.dart';
import '../api_errors/internal_server_api_error.dart';

class InternalServerErrorInterceptor extends Interceptor {

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
      if (err.response != null) {
        final code = err.response?.statusCode ?? -1;
        if (code >= 500 && code < 600) {
          handler.next(InternalServerApiError());
          return;
        }
      }
      handler.next(err);
  }
}
