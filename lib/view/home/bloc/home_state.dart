import 'package:api_calling_demo/models/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class OnUsersListLoadedState extends HomeState {
  final List<Datum> list;

  const OnUsersListLoadedState({
    required this.list,
  });

  @override
  List<Object?> get props => [list, identityHashCode(this)];
}

class OnUsersListErrorState extends HomeState {
  final String message;

  const OnUsersListErrorState({
    required this.message,
  });

  @override
  List<Object?> get props => [message, identityHashCode(this)];
}
