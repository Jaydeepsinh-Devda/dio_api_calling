import 'package:dio/dio.dart';

class Failure extends DioException {
  final String? errorMessage;

  final int? applicationStatusCode;

  @override
  String get message => errorMessage ?? '';

  Failure({
    this.errorMessage,
    this.applicationStatusCode,
  }) : super(requestOptions: RequestOptions(path: ''));
}

class BadRequestException extends Failure {
  BadRequestException([message, applicationStatusCode])
      : super(
          errorMessage: message,
          applicationStatusCode: applicationStatusCode,
        );
}

class ServerException extends Failure {
  ServerException([message, applicationStatusCode])
      : super(
          errorMessage: message,
          applicationStatusCode: applicationStatusCode,
        );
}
