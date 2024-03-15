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
      style: _loginButtonStyle(context),
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

  ButtonStyle _loginButtonStyle(BuildContext context) => ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor:
            MaterialStateProperty.all<Color>(const Color(0xFF4CCD99)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        minimumSize: MaterialStateProperty.all<Size>(
          Size.fromHeight(PointSize.value70),
        ),
      );
}
