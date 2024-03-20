import 'package:api_calling_demo/core/constant/strings.dart';
import 'package:api_calling_demo/core/error/exception.dart';
import 'package:api_calling_demo/core/error/response_failure.dart';
import 'package:dio/dio.dart';

class ExceptionInterceptor extends InterceptorsWrapper {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
        throw ServerException(MyAppStrings.message.kRequestTimeout);
      case DioExceptionType.sendTimeout:
        throw ServerException(MyAppStrings.message.kSendTimeout);
      case DioExceptionType.receiveTimeout:
        throw ServerException(MyAppStrings.message.kNoInternetConnection);
      case DioExceptionType.badCertificate:
      case DioExceptionType.badResponse:
        handleResponse(err);
        break;
      case DioExceptionType.cancel:
        throw ServerException(MyAppStrings.message.kRequestCancelled);
      case DioExceptionType.connectionError:
        throw ServerException(MyAppStrings.message.kNoInternetConnection);
      case DioExceptionType.unknown:
        throw ServerException(MyAppStrings.message.kSomethingWentWrong);
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
          exception.error,
        );
      case 401:
        final ResponseFailure exception =
            ResponseFailure.fromJson(response?.data);

        throw UnauthorisedException(
          exception.error,
        );
      case 500:
      default:
        throw FetchDataException(
            "${MyAppStrings.message.kFetchDataExceptionMessage} ${response?.statusCode}");
    }
  }
}
