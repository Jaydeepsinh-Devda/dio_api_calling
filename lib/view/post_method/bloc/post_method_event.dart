import 'package:equatable/equatable.dart';

abstract class PostMethodEvent extends Equatable {
  const PostMethodEvent();

  @override
  List<Object?> get props => [];
}

class GetPostModelEvent extends PostMethodEvent {
  final String name;

  const GetPostModelEvent({required this.name});

  @override
  List<Object?> get props => [name];
}

class GetPatchRequestEvent extends PostMethodEvent {}
