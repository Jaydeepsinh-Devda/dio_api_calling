import 'package:dio/dio.dart';

class ResponseInterceptor extends InterceptorsWrapper {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print("Response : ${response.statusCode}");
    super.onResponse(response, handler);
  }
}
