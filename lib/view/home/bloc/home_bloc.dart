import 'dart:async';

import 'package:api_calling_demo/core/constant/strings.dart';
import 'package:api_calling_demo/core/error/exception.dart';
import 'package:api_calling_demo/core/util/extensions.dart';
import 'package:api_calling_demo/core/webservice/api_client.dart';
import 'package:api_calling_demo/view/authentication/authentication_bloc.dart';
import 'package:api_calling_demo/view/authentication/authentication_event.dart';
import 'package:api_calling_demo/view/home/bloc/home_event.dart';
import 'package:api_calling_demo/view/home/bloc/home_state.dart';
import 'package:bloc/bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AuthenticationBloc authBloc;
  HomeBloc({required this.authBloc}) : super(HomeInitialState()) {
    on<GetUsersListEvent>(_getUsersList);
    on<LogoutButtonPressedEvent>(_onLogoutButtonPressed);
  }

  FutureOr<void> _getUsersList(
      GetUsersListEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());

    try {
      var response = await ApiClient.userListService.fetchUserListing();

      if (response.isSuccessful) {
        emit(OnUsersListLoadedState(list: response.data.data));
      } else {
        emit(HomeErrorState(error: MyAppStrings.message.kSomethingWentWrong));
      }
    } on Failure catch (e) {
      emit(HomeErrorState(error: e.message));
    } catch (e) {
      emit(HomeErrorState(error: e.toString()));
    }
  }

  FutureOr<void> _onLogoutButtonPressed(
      LogoutButtonPressedEvent event, Emitter<HomeState> emit) {
    authBloc.add(LogoutEvent());
  }
}
