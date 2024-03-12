import 'package:api_calling_demo/models/posts_model.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitialState extends HomeState {}

class OnPostsLoadingState extends HomeState {}

class OnPostsLoadedState extends HomeState {
  final List<PostsModel> list;

  const OnPostsLoadedState({required this.list});

  @override
  List<Object?> get props => [list, identityHashCode(this)];
}

class HomeErrorState extends HomeState {
  final String message;

  const HomeErrorState({required this.message});

  @override
  List<Object?> get props => [message, identityHashCode(this)];
}
