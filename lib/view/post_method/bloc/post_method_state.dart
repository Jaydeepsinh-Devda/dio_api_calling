import 'package:equatable/equatable.dart';

abstract class PostMethodState extends Equatable {
  const PostMethodState();

  @override
  List<Object?> get props => [];
}

class GetPostModelInitialState extends PostMethodState {}

class OnGetPostModalLoadingState extends PostMethodState {}

class OnPatchRequestLoadingState extends PostMethodState {}

class OnGetPostModelSuccessState extends PostMethodState {
  final String data;

  const OnGetPostModelSuccessState({required this.data});

  @override
  List<Object?> get props => [data];
}

class OnPatchRequestSuccessState extends PostMethodState {
  final int statusCode;

  const OnPatchRequestSuccessState({required this.statusCode});

  @override
  List<Object?> get props => [statusCode];
}

class OnGetPostModelErrorState extends PostMethodState {}
