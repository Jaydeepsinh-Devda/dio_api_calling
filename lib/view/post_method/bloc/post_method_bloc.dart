import 'dart:async';

import 'package:api_calling_demo/core/webservice/api_client.dart';
import 'package:api_calling_demo/models/posts_model.dart';
import 'package:api_calling_demo/view/post_method/bloc/post_method_event.dart';
import 'package:api_calling_demo/view/post_method/bloc/post_method_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostMethodBloc extends Bloc<PostMethodEvent, PostMethodState> {
  PostMethodBloc() : super(GetPostModelInitialState()) {
    on<GetPostModelEvent>(_getData);
    on<GetPatchRequestEvent>(_patchRequest);
  }

  FutureOr<void> _getData(
      GetPostModelEvent event, Emitter<PostMethodState> emit) async {
    emit(OnGetPostModalLoadingState());

    try {
      var request =
          PostsModel(userId: 2, id: 101, title: event.name, body: "Flutter");
      var response = await ApiClient.postsListService.fetchPostModel(request);

      emit(OnGetPostModelSuccessState(data: response.data.title));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  FutureOr<void> _patchRequest(
      GetPatchRequestEvent event, Emitter<PostMethodState> emit) async {
    emit(OnPatchRequestLoadingState());
    try {
      var response = await ApiClient.postsListService.fetchPatchModel();
      emit(OnPatchRequestSuccessState(
          statusCode: response.response.statusCode!));
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
