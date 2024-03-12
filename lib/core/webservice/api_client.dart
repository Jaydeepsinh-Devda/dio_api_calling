import 'package:api_calling_demo/core/constant/apis_strings.dart';
import 'package:api_calling_demo/core/webservice/posts_list_service.dart';
import 'package:dio/dio.dart';

class ApiClient {
  static late final PostsListService postsListService;
  static void initServices() {
    final dio = Dio()
      ..options = BaseOptions(
        baseUrl: APIStrings.baseUrl,
        contentType: Headers.jsonContentType,
      );

    postsListService = PostsListService(dio);
  }
}
