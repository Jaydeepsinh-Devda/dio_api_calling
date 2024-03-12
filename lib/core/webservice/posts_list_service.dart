import 'package:api_calling_demo/core/constant/apis_strings.dart';
import 'package:api_calling_demo/models/posts_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'posts_list_service.g.dart';

@RestApi(baseUrl : '')
abstract class PostsListService{
  factory PostsListService(Dio dio, {String baseUrl}) = _PostsListService;

  @GET(APIStrings.posts)
  Future<HttpResponse<List<PostsModel>>> fetchPostsListing();
}