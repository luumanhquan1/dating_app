import 'package:dio/dio.dart';
import '../api_errors/bad_network_api_error.dart';

class BadNetworkErrorInterceptor extends Interceptor {
  // final NetworkInfo _networkInfo = getIt<NetworkInfo>();
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: implement onRequest
    handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
    // _networkInfo.isConnected.then((value) => {
    //       if (!value) {handler.next(BadNetworkApiError())}
    //     });
    handler.next(BadNetworkApiError());
  }
}
