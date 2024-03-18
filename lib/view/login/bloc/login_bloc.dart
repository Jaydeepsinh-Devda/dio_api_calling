import 'dart:async';
import 'package:api_calling_demo/core/error/exception.dart';
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
      var request =
          LoginRequest(username: event.email, password: event.password);
      var response = await ApiClient.loginService.verifyUser(request);
      print(response.data);
      emit(LoginSuccessState(token: response.data.refreshToken ?? "hello"));
      authBloc.add(LoggedInEvent(token: response.data.refreshToken ?? "hello"));
    } on Failure catch (e) {
      print("Login Failure error: ${e.toString()}");
      emit(LoginFailureState(error: e.message.toString()));
    } catch (e) {
      print("error: ${e.toString()}");
      emit(LoginFailureState(error: e.toString()));
    }
  }
}
