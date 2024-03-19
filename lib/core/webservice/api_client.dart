import 'package:api_calling_demo/core/constant/apis_string.dart';
import 'package:api_calling_demo/core/interceptor/exception_interceptor.dart';
import 'package:api_calling_demo/core/interceptor/request_interceptor.dart';
import 'package:api_calling_demo/core/interceptor/response_interceptor.dart';
import 'package:api_calling_demo/core/webservice/login_service.dart';
import 'package:api_calling_demo/core/webservice/user_list_service.dart';
import 'package:dio/dio.dart';

class ApiClient {
  static late final LoginService loginService;
  static late final UserListService userListService;

  static void initServices() {
    final dio = Dio()
      ..options = BaseOptions(
        baseUrl: APIStrings.baseUrl, 
        contentType: Headers.jsonContentType,
      );

    dio.interceptors.addAll([
      RequestInterceptor(),
      ResponseInterceptor(),
      ExceptionInterceptor(),
    ]);

    loginService = LoginService(dio);
    userListService = UserListService(dio);
  }
}
