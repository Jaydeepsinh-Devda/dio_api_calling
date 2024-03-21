import 'package:api_calling_demo/core/constant/point_size.dart';
import 'package:flutter/material.dart';

class TextStyles {
  static TextStyle getLargeWhite() => TextStyle(
        color: Colors.white,
        fontSize: PointSize.large,
      );

  static TextStyle getH1WhiteRegular() => TextStyle(
        color: Colors.white,
        fontSize: PointSize.h1,
      );

  static TextStyle getLoginFormStyles() => const TextStyle(color: Colors.white);

  static InputDecoration getInputDecoration() => InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            color: Color(0xFF007F73),
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            color: Color(0xFF007F73),
            width: 2.0,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.0,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 2.0,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
      );

  static ButtonStyle getCustomButtonStyle() => ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(
          const Color(0xFF4CCD99),
        ),
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
