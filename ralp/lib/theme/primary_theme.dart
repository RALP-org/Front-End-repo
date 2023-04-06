import 'package:flutter/material.dart';

abstract class PrimaryTheme {
  PrimaryTheme._();

  static ThemeData generateTheme(BuildContext context) {
    return ThemeData(
      textTheme: const TextTheme(
          bodyMedium: TextStyle(
        fontWeight: FontWeight.w700,
        fontFamily: "Proxima Nova",
      )),
    );
  }
}
