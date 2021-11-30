import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
part 'api_error_message_error.g.dart';

@JsonSerializable()
class ApiErrorMessageError extends DioError {
  @JsonKey(name: 'error_message')
  final String errorMessage;

  @JsonKey(ignore: true)
  RequestOptions request;

  @JsonKey(ignore: true)
  Response<dynamic>? responseInfo;

  @JsonKey(ignore: true)
  DioErrorType errorType;

  @JsonKey(ignore: true)
  dynamic apiError;

  ApiErrorMessageError({
    required this.errorMessage,
    required this.request,
    required this.responseInfo,
    required this.errorType,
    this.apiError,
  }) : super(requestOptions: RequestOptions(path: ''));

  factory ApiErrorMessageError.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorMessageErrorFromJson(json);
}
