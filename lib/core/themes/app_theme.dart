import 'package:flutter/material.dart';

class AppTheme {
  static const int _redPrimaryValue = 0xFFE72041;
  static const MaterialColor _red = MaterialColor(
    _redPrimaryValue,
    <int, Color>{
      50: Color(0xFFeb7185),
      100: Color(0xFFf24b67),
      200: Color(0xFFf53857),
      300: Color(0xFFf72d4e),
      400: Color(0xFFE72041),
      500: Color(_redPrimaryValue),
      600: Color(0xFFc91c39),
      700: Color(0xFFa3172e),
      800: Color(0xFF7a1223),
      900: Color(0xFF590d1a),
    },
  );

  const AppTheme._();
  static final lightTheme = ThemeData(
    primarySwatch: _red,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static final darkTheme = ThemeData(
    primarySwatch: _red,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
