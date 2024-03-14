import 'package:dio/dio.dart';

class RequestInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print("Request: ${options.method} ${options.path}");
    super.onRequest(options, handler);
  }
}
