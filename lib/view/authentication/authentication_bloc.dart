import 'dart:async';
import 'package:api_calling_demo/core/sharepref_helper.dart';
import 'package:api_calling_demo/view/authentication/authentication_state.dart';
import 'package:api_calling_demo/view/authentication/authentication_event.dart';
import 'package:bloc/bloc.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitialState()) {
    on<LoggedInEvent>(_logIn);
    on<AppStartedEvent>(_onAppStarted);
    on<LogoutEvent>(_onLogout);
  }

  FutureOr<void> _logIn(
      LoggedInEvent event, Emitter<AuthenticationState> emit) async {
    await SharedPreferencesHelper.setToken(event.token);
    emit(AuthenticationAuthenticated());
  }

  FutureOr<void> _onAppStarted(
      AppStartedEvent event, Emitter<AuthenticationState> emit) async {
    var token = await SharedPreferencesHelper.getToken();

    if ((token ?? '').isNotEmpty) {
      emit(AuthenticationAuthenticated());
    } else {
      emit(AuthenticationUnauthenticated());
    }
  }

  FutureOr<void> _onLogout(
      LogoutEvent event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoadingState());
    await SharedPreferencesHelper.clear();
    emit(AuthenticationUnauthenticated());
  }
}
