import 'package:flutter/material.dart';
import '../constants.dart';

final ThemeData defaultTheme = buildDefaultTheme();

ThemeData buildDefaultTheme() {
  return ThemeData(
    primarySwatch: Colors.green,
    primaryColor: Colors.green,
    accentColor: Colors.orange,
    scaffoldBackgroundColor: bgColor,
    appBarTheme: AppBarTheme(),
    textTheme: TextTheme(button: TextStyle(fontSize: 16)),
    buttonTheme: ButtonThemeData(
      minWidth: 150,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      contentPadding: const EdgeInsets.all(16),
      floatingLabelBehavior: FloatingLabelBehavior.auto,
    ),
  );
}
