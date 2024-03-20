import 'package:api_calling_demo/core/app_config.dart';
import 'package:api_calling_demo/core/interceptor/exception_interceptor.dart';
import 'package:api_calling_demo/core/interceptor/request_interceptor.dart';
import 'package:api_calling_demo/core/interceptor/response_interceptor.dart';
import 'package:api_calling_demo/core/webservice/login_service.dart';
import 'package:api_calling_demo/core/webservice/user_list_service.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:dio/dio.dart';

class ApiClient {
  static late final LoginService loginService;
  static late final UserListService userListService;

  static void initServices() {
    final dio = Dio()
      ..options = BaseOptions(
        baseUrl: AppConfig.getInstance().apiBaseUrl,
        contentType: Headers.jsonContentType,
      );

    dio.interceptors.addAll([
      RequestInterceptor(),
      ResponseInterceptor(),
      ExceptionInterceptor(),
      PrettyDioLogger()
    ]);

    loginService = LoginService(dio);
    userListService = UserListService(dio);
  }
}
