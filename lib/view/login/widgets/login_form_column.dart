import 'package:api_calling_demo/core/constant/point_size.dart';
import 'package:api_calling_demo/core/constant/strings.dart';
import 'package:api_calling_demo/core/constant/text_styles.dart';
import 'package:api_calling_demo/core/util/validator.dart';
import 'package:flutter/material.dart';

class LoginFormColumn extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Function(String)? onFieldSubmitted;

  const LoginFormColumn({
    required this.emailController,
    required this.passwordController,
    required this.onFieldSubmitted,
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
      ],
    );
  }

  //! Widget Methods
  Widget _verticalSpacer() => SizedBox(height: PointSize.value30);

  Widget _emailLabel() => Text(
        MyAppStrings.labelString.kEmail,
        style: TextStyles.getLoginFormStyles(),
      );

  Widget _passwordLabel() => Text(
        MyAppStrings.labelString.kPassword,
        style:  TextStyles.getLoginFormStyles(),
      );

  Widget _emailTextField() => TextFormField(
        style:  TextStyles.getLoginFormStyles(),
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        controller: emailController,
        validator: _validateEmail,
        decoration: TextStyles.getInputDecoration(),
      );

  Widget _passwordTextField() => TextFormField(
        style:  TextStyles.getLoginFormStyles(),
        obscureText: true,
        validator: _validatePassword,
        textInputAction: TextInputAction.done,
        onFieldSubmitted: onFieldSubmitted,
        controller: passwordController,
        decoration: TextStyles.getInputDecoration(),
      );

  //! Functions

  String? _validatePassword(String? val) {
    if ((val ?? '').trim().isEmpty) {
      return MyAppStrings.message.kEnterPassword;
    } else if (!Validator.isValidPassword(val!)) {
      return MyAppStrings.message.kEnterValidPassword;
    } else {
      return null;
    }
  }

  String? _validateEmail(String? val) {
    if ((val ?? '').trim().isEmpty) {
      return MyAppStrings.message.kEnterEmail;
    } else if (!Validator.isValidEmail(val!)) {
      return MyAppStrings.message.kEnterValidEmail;
    } else {
      return null;
    }
  }
}
