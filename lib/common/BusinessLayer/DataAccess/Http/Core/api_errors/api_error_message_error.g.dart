part of 'api_error_message_error.dart';

ApiErrorMessageError _$ApiErrorMessageErrorFromJson(Map<String, dynamic> json) {
  return ApiErrorMessageError(
    errorMessage: json['error_message'] as String,
    errorType: DioErrorType.other,
    responseInfo: null,
    request: RequestOptions(path: ''),
  );
}
