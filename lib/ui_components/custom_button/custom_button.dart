import 'package:api_calling_demo/core/constant/point_size.dart';
import 'package:api_calling_demo/core/constant/text_styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onLoginButtonPressed;
  final bool isLoading;
  final String buttonText;

  const CustomButton({
    required this.buttonText,
    required this.isLoading,
    required this.onLoginButtonPressed,
    super.key,
  });

  //! Build Method
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: TextStyles.getCustomButtonStyle(),
      onPressed: onLoginButtonPressed,
      child: isLoading ? _loadingIndicator() : _loginButtonText(),
    );
  }

  //! Widget Methods
  Widget _loginButtonText() => Text(
        buttonText,
        style: TextStyle(fontSize: PointSize.value20),
      );

  Widget _loadingIndicator() => const CircularProgressIndicator(
        color: Colors.white,
      );
}
