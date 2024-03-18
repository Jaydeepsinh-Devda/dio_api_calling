import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object?> get props => [];
}

class LoggedInEvent extends AuthenticationEvent {
  final String token;

  const LoggedInEvent({required this.token});

  @override
  List<Object?> get props => [token];

}

class AppStartedEvent extends AuthenticationEvent {}

class LogoutEvent extends AuthenticationEvent {}
