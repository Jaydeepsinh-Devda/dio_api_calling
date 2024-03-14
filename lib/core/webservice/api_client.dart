import 'package:api_calling_demo/core/constant/apis_strings.dart';
import 'package:api_calling_demo/core/interceptor/error_interceptor.dart';
import 'package:api_calling_demo/core/interceptor/request_interceptor.dart';
import 'package:api_calling_demo/core/interceptor/response_interceptor.dart';
import 'package:api_calling_demo/core/webservice/posts_list_service.dart';
import 'package:dio/dio.dart';

class ApiClient {
  static late final PostsListService postsListService;

  static void initServices() {
    final dio = Dio()
      ..options = BaseOptions(
        baseUrl: APIStrings.baseUrl,
        contentType: "application/json",
      );

    dio.interceptors.addAll([
      RequestInterceptor(),
      ResponseInterceptor(),
      ErrorInterceptor(),
    ]);

    postsListService = PostsListService(dio);
  }
}
