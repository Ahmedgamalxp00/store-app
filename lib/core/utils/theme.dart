import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:store_app/core/constants.dart';

ThemeData myTheme() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: kTextColor, height: 1.2),
      bodyMedium: TextStyle(color: kTextColor, height: 1.2),
    ),
    appBarTheme: const AppBarTheme(
      // systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.white),
      centerTitle: true,
      titleTextStyle: TextStyle(color: Color(0xFF8B8B8B), fontSize: 18),
      color: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
    ),
  );
}
