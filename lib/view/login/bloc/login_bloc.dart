import 'dart:async';
import 'package:api_calling_demo/core/constant/strings.dart';
import 'package:api_calling_demo/core/error/exception.dart';
import 'package:api_calling_demo/core/util/extensions.dart';
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
      var request = LoginRequest(
        email: event.email.trim(),
        password: event.password.trim(),
      );
      var response = await ApiClient.loginService.verifyUser(request);

      if (response.isSuccessful) {
        emit(LoginSuccessState(token: response.data.token));
        authBloc.add(LoggedInEvent(token: response.data.token));
      } else {
        emit(
            LoginFailureState(error: MyAppStrings.message.kSomethingWentWrong));
      }
    } on Failure catch (e) {
      emit(LoginFailureState(error: e.message.toString()));
    } catch (e) {
      emit(LoginFailureState(error: e.toString()));
    }
  }
}
