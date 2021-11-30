import 'package:dio/dio.dart';
import '../api_errors/unauthorized_api_error.dart';

class UnauthorizedInterceptor extends Interceptor {

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    final code = err.response?.statusCode  ?? -1;
    if (code == 401 ||
        code == 403) {
      handler.next(UnauthorizedApiError());
      return;
    }
    handler.next(err);
  }
}
