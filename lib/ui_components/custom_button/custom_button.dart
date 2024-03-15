import 'package:api_calling_demo/core/constant/point_size.dart';
import 'package:api_calling_demo/core/constant/strings.dart';
import 'package:api_calling_demo/view/login/bloc/login_state.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onLoginButtonPressed;
  final LoginState state;

  const CustomButton({
    required this.state,
    required this.onLoginButtonPressed,
    super.key,
  });

//! Build Method
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: _loginButtonStyle(),
      onPressed: onLoginButtonPressed,
      child:
          state is LoginLoadingState ? _loadingIndicator() : _loginButtonText(),
    );
  }

  //! Widget Methods
  Widget _loginButtonText() => Text(
        Strings.button.kLogin,
        style: TextStyle(fontSize: PointSize.value20),
      );

  Widget _loadingIndicator() => const CircularProgressIndicator(
        color: Colors.white,
      );

  ButtonStyle _loginButtonStyle() => ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Colors.white),
        backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        minimumSize: MaterialStateProperty.all(
          Size.fromHeight(PointSize.value70),
        ),
      );
}
