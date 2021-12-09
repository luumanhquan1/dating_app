import 'package:flutter/foundation.dart' as foundation;
import '../Constant/urls.dart';
import 'evn_data.dart';

class Env {
  static EnvData _env = dev;
  static EnvData get data => _env;

  static final bool isRelease = foundation.kReleaseMode;

  static final bool isDebug = !foundation.kReleaseMode;

  static void init() {
    _env = isRelease ? Env.prod : Env.dev;
  }

  static final EnvData dev = EnvData(
      debug: true,
      debugShowCheckedModeBanner: true,
      debugShowMaterialGrid: false,
      debugApiClient: true,
      apiBaseUrl: UrlConstants.DEV_API_BASE_URL,
      apiToken: '',
      apiUrlSocket: UrlConstants.DEV_API_BASE_URL_SOCKET
  );

  static final EnvData prod = EnvData(
      debug: false,
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      debugApiClient: false,
      apiBaseUrl: UrlConstants.PROD_API_URL,
      apiToken: '',
   apiUrlSocket: UrlConstants.PROD_API_URL_SOCKET
  );
}
