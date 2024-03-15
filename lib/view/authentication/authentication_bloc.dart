import 'dart:async';

import 'package:api_calling_demo/view/authentication/authentication_state.dart';
import 'package:api_calling_demo/view/authentication/authentication_event.dart';
import 'package:bloc/bloc.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitialState()) {
    on<OnLoggedIn>(_logIn);
  }

  FutureOr<void> _logIn(OnLoggedIn event, Emitter<AuthenticationState> emit) {
    emit(AuthenticationAuthenticated());
    
  }
}
