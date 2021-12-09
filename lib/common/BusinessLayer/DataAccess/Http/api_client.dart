import 'dart:convert';

import 'package:dating_app/common/BusinessLayer/DataAccess/Http/Core/Constant/shared_preferences_keys.dart';
import 'package:dio/dio.dart';

import 'package:injectable/injectable.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'Core/Evn/env.dart';
import 'Core/Exception/network_exception.dart';
import 'Core/api_errors/api_error_message_error.dart';
import 'Core/api_errors/bad_network_api_error.dart';
import 'Core/api_errors/internal_server_api_error.dart';
import 'Core/api_errors/unauthorized_api_error.dart';
import 'Core/interceptor/api_error_message_interceptor.dart';
import 'Core/interceptor/auth_interceptor.dart';
import 'Core/interceptor/bad_network_error_interceptor.dart';
import 'Core/interceptor/internal_server_error_interceptor.dart';
import 'Core/interceptor/unauthorized_interceptor.dart';

@lazySingleton
class ApiClient {
  final Dio dio;

  ApiClient(this.dio) {
    dio.options.baseUrl = Env.data.apiBaseUrl;
    dio.options.connectTimeout = const Duration(seconds: 60).inMilliseconds;
    dio.options.receiveTimeout = const Duration(seconds: 60).inMilliseconds;
    dio.options.contentType = Headers.jsonContentType;
    dio.interceptors.add(BadNetworkErrorInterceptor());
    dio.interceptors.add(InternalServerErrorInterceptor());
    dio.interceptors.add(AuthInterceptor());
    dio.interceptors.add(UnauthorizedInterceptor());
    dio.interceptors.add(ApiErrorMessageInterceptor());

    if (Env.data.debugApiClient) {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
        compact: true,
      ));
    }
  }

  Future<void> useAuthenTokenIfNeed({bool isDowloadFile = false}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final authtoken = prefs.getString(SharedPreferencesKeys.AUTH_TOKEN) ?? '';
    if (dio.options.headers.isEmpty) {
      dio.options.headers = {};
    }
    if (authtoken.isNotEmpty) {
      dio.options.headers['token'] = authtoken;
    }

    dio.options.setRequestContentTypeWhenNoPayload = true;
    dio.options.receiveDataWhenStatusError = true;
    dio.options.headers['contentType'] = Headers.jsonContentType;
    if (isDowloadFile == true) {
      dio.options.responseType = ResponseType.bytes;
      dio.options.followRedirects = false;
    } else {
      dio.options.responseType = ResponseType.json;
      dio.options.followRedirects = true;
    }
    dio.options.validateStatus = (status) {
      return status == 200;
    };
  }

  Future<Response> post(
    String path,
    dynamic data,
  ) async {
    await useAuthenTokenIfNeed();
    try {
      return await dio.post(path, data: data);
    } on BadNetworkApiError {
      throw BadNetworkException();
    } on InternalServerApiError {
      throw InternalServerException();
    } on UnauthorizedApiError {
      throw UnauthenticatedException();
    } on ApiErrorMessageError catch (e) {
      throw ApiErrorMessageException(errorMessage: e.errorMessage);
    } on DioError {
      throw ApiException();
    }
  }

  Future<Response> dowloadFile(
    String path,
    dynamic data,
  ) async {
    await useAuthenTokenIfNeed(isDowloadFile: true);
    try {
      return await dio.post(path, data: jsonEncode(data));
    } on BadNetworkApiError {
      throw BadNetworkException();
    } on InternalServerApiError {
      throw InternalServerException();
    } on UnauthorizedApiError {
      throw UnauthenticatedException();
    } on ApiErrorMessageError catch (e) {
      throw ApiErrorMessageException(errorMessage: e.errorMessage);
    } on DioError {
      throw ApiException();
    }
  }

  Future<Response> put(String path, dynamic data) async {
    await useAuthenTokenIfNeed();
    try {
      return await dio.put(path, data: data);
    } on BadNetworkApiError {
      throw BadNetworkException();
    } on InternalServerApiError {
      throw InternalServerException();
    } on UnauthorizedApiError {
      throw UnauthenticatedException();
    } on ApiErrorMessageError catch (e) {
      throw ApiErrorMessageException(errorMessage: e.errorMessage);
    } on DioError {
      throw ApiException();
    }
  }

  Future<Response> delete(String path, dynamic data) async {
    await useAuthenTokenIfNeed();
    try {
      return await dio.delete(path, data: data);
    } on BadNetworkApiError {
      throw BadNetworkException();
    } on InternalServerApiError {
      throw InternalServerException();
    } on UnauthorizedApiError {
      throw UnauthenticatedException();
    } on ApiErrorMessageError catch (e) {
      throw ApiErrorMessageException(errorMessage: e.errorMessage);
    } on DioError {
      throw ApiException();
    }
  }

  Future<Response> get(String path, Map<String, dynamic> parameters,
      {ProgressCallback? onReceiveProgress, bool isDowloadFile = false}) async {
    await useAuthenTokenIfNeed(isDowloadFile: isDowloadFile);
    try {
      return await dio.get(path,
          onReceiveProgress: onReceiveProgress, queryParameters: parameters);
    } on BadNetworkApiError {
      throw BadNetworkException();
    } on InternalServerApiError {
      throw InternalServerException();
    } on UnauthorizedApiError {
      throw UnauthenticatedException();
    } on ApiErrorMessageError catch (e) {
      throw ApiErrorMessageException(errorMessage: e.errorMessage);
    } on DioError {
      throw ApiException();
    }
  }
}
