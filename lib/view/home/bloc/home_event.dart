import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class GetPostListEvent extends HomeEvent {}

class GetPostByUserID extends HomeEvent {
  final int userId;

  const GetPostByUserID({required this.userId});

  @override
  List<Object?> get props => [userId];
}

class GetPostModelEvent extends HomeEvent {}
