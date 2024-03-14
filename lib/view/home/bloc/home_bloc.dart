import 'dart:async';
import 'package:api_calling_demo/core/webservice/api_client.dart';
import 'package:api_calling_demo/view/home/bloc/home_event.dart';
import 'package:api_calling_demo/view/home/bloc/home_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<GetPostListEvent>(_fetchPosts);
    on<GetPostByUserID>(_fetchPostsByUserId);
  }

  FutureOr<void> _fetchPosts(
      GetPostListEvent event, Emitter<HomeState> emit) async {
    emit(OnPostsLoadingState());

    try {
      // print("try");
      var response = await ApiClient.postsListService.fetchPostsListing();
      // print(response.data);
      emit(OnPostsLoadedState(list: response.data));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  FutureOr<void> _fetchPostsByUserId(
      GetPostByUserID event, Emitter<HomeState> emit) async {
    emit(OnPostsLoadingState());

    try {
      var response =
          await ApiClient.postsListService.fetchPostsByUserID(event.userId);
      emit(OnPostsLoadedState(list: response.data));
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
