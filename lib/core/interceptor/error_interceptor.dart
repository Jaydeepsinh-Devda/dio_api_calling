import 'package:dio/dio.dart';

class ErrorInterceptor extends InterceptorsWrapper {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print("Error : ${err.message}");
    super.onError(err, handler);
  }
}
