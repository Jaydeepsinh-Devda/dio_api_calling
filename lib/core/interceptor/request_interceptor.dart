import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RequestInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint("Request: ${options.method} ${options.path}");
    super.onRequest(options, handler);
  }
}
