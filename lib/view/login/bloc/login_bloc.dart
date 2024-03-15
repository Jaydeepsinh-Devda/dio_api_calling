import 'dart:async';
import 'package:api_calling_demo/core/webservice/api_client.dart';
import 'package:api_calling_demo/models/login_request.dart';
import 'package:api_calling_demo/view/authentication/authentication_bloc.dart';
import 'package:api_calling_demo/view/authentication/authentication_event.dart';
import 'package:api_calling_demo/view/login/bloc/login_event.dart';
import 'package:api_calling_demo/view/login/bloc/login_state.dart';
import 'package:bloc/bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationBloc authBloc;
  LoginBloc({required this.authBloc}) : super(LoginInitialState()) {
    on<LoginButtonClickedEvent>(_verifyUser);
  }

  FutureOr<void> _verifyUser(
      LoginButtonClickedEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoadingState());

    try {
      var request = LoginRequest(email: event.email, password: event.password);
      var response = await ApiClient.loginService.verifyUser(request);
      emit(LoginSuccessState(token: response.data.token));
      authBloc.add(OnLoggedIn());
      print("login bloc");
    } catch (e) {
      emit(LoginFailureState(error: e.toString()));
    }
  }
}
