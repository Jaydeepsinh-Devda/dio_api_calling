import 'package:api_calling_demo/core/constant/point_size.dart';
import 'package:api_calling_demo/core/constant/strings.dart';
import 'package:api_calling_demo/core/constant/text_styles.dart';
import 'package:api_calling_demo/core/util/validator.dart';
import 'package:flutter/material.dart';

class LoginFormColumn extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginFormColumn({
    required this.emailController,
    required this.passwordController,
    super.key,
  });

//! Build Method
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _emailLabel(),
        _emailTextField(),
        _verticalSpacer(),
        _passwordLabel(),
        _passwordTextField(),
        // _loginButton()
      ],
    );
  }

//! Widget Methods

  Widget _verticalSpacer() => SizedBox(height: PointSize.value30);

  Widget _emailLabel() => Text(
        Strings.labelString.kEmail,
        style: const TextStyle(color: Colors.white),
      );

  Widget _passwordLabel() => Text(
        Strings.labelString.kPassword,
        style: const TextStyle(color: Colors.white),
      );

  Widget _emailTextField() => TextFormField(
        style: const TextStyle(color: Colors.white),
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        controller: emailController,
        validator: _validateEmail,
        decoration: TextStyles.getInputDecoration(),
      );

  Widget _passwordTextField() => TextFormField(
        style: const TextStyle(color: Colors.white),
        obscureText: true,
        validator: _validatePassword,
        textInputAction: TextInputAction.done,
        controller: passwordController,
        decoration: TextStyles.getInputDecoration(),
      );

  //! Functions

  String? _validatePassword(String? val) {
    if (val!.trim().isEmpty) {
      return Strings.message.kEnterPassword;
    } else if (!Validator.isValidPassword(val)) {
      return Strings.message.kEnterValidPassword;
    } else {
      return null;
    }
  }

  String? _validateEmail(String? val) {
    if (val!.trim().isEmpty) {
      return Strings.message.kEnterEmail;
    } else if (!Validator.isValidEmail(val)) {
      return Strings.message.kEnterValidEmail;
    } else {
      return null;
    }
  }
}
