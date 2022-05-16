import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  scaffoldBackgroundColor: const Color(0xffE8F9FD),
  primaryColor: Colors.greenAccent,
  secondaryHeaderColor: Colors.redAccent,
  textTheme: TextTheme(
    headline3: const TextStyle().copyWith(color: Colors.black),
  ),
);
final darkTheme = ThemeData(
  scaffoldBackgroundColor: const Color(0xff533E85),
  primaryColor: Colors.redAccent,
  secondaryHeaderColor: Colors.greenAccent,
  textTheme: TextTheme(
    headline3: const TextStyle().copyWith(color: Colors.white),
  ),
);
