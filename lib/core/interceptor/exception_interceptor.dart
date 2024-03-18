import 'package:api_calling_demo/core/constant/strings.dart';
import 'package:api_calling_demo/core/error/exception.dart';
import 'package:api_calling_demo/core/error/response_failure.dart';
import 'package:dio/dio.dart';

class ExceptionInterceptor extends InterceptorsWrapper {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.badCertificate:
      case DioExceptionType.badResponse:
        handleResponse(err);
        break;
      case DioExceptionType.cancel:
      case DioExceptionType.connectionError:
        throw ServerException(Strings.errorMessage.noInternetConnection);
      case DioExceptionType.unknown:
        throw ServerException("Something Went Wrong");
    }

    super.onError(err, handler);
  }

  void handleResponse(DioException err) {
    var response = err.response;

    switch (response?.statusCode) {
      case 400:
        final ResponseFailure exception =
            ResponseFailure.fromJson(response?.data);

        throw BadRequestException(
          exception.message,
          exception.applicationStatusCode,
        );
      case 401:
        final ResponseFailure exception =
            ResponseFailure.fromJson(response?.data);

        throw BadRequestException(
          exception.message,
          exception.applicationStatusCode,
        );
    }
  }
}
