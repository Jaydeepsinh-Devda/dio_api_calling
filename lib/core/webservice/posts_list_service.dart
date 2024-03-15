import 'package:api_calling_demo/core/constant/apis_string.dart';
import 'package:api_calling_demo/models/posts_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'posts_list_service.g.dart';

@RestApi(baseUrl: '')
abstract class PostsListService {
  factory PostsListService(Dio dio, {String baseUrl}) = _PostsListService;

  @GET(APIStrings.posts)
  Future<HttpResponse<List<PostsModel>>> fetchPostsListing();

  @GET(APIStrings.posts)
  Future<HttpResponse<List<PostsModel>>> fetchPostsByUserID(
    @Query('userId') int userId,
  );

  @POST(APIStrings.posts)
  Future<HttpResponse<PostsModel>> fetchPostModel(
    @Body() PostsModel request,
  );

  @PATCH(APIStrings.patch)
  Future<HttpResponse<PostsModel>> fetchPatchModel();
}
