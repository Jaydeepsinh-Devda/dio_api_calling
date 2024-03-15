import 'package:api_calling_demo/core/constant/apis_string.dart';
import 'package:api_calling_demo/models/login_request.dart';
import 'package:api_calling_demo/models/login_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'login_service.g.dart';

@RestApi(baseUrl: '')
abstract class LoginService {
  factory LoginService(Dio dio, {String baseUrl}) = _LoginService;

  @POST(APIStrings.login)
  Future<HttpResponse<LoginResponse>> verifyUser(
    @Body() LoginRequest request
  );
}
