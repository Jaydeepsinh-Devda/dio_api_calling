import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ResponseInterceptor extends InterceptorsWrapper {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
  debugPrint("Response : ${response.statusCode}");
    super.onResponse(response, handler);
  }
}
