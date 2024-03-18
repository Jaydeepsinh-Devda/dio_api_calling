import 'package:api_calling_demo/core/constant/apis_string.dart';
import 'package:api_calling_demo/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'user_list_service.g.dart';

@RestApi(baseUrl : '')
abstract class UserListService{
  factory UserListService(Dio dio, {String baseUrl}) = _UserListService;

  @GET(APIStrings.users)
  Future<HttpResponse<UserModel>> fetchUserListing();
}