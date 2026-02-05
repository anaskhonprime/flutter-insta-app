import 'package:flutter/material.dart';

var theme = ThemeData(
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(backgroundColor: Colors.amber),
  ),

  appBarTheme: AppBarTheme(
    actionsIconTheme: IconThemeData(color: Colors.white),
    backgroundColor: Colors.blue,
    titleTextStyle: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Colors.black,
  ),

  iconTheme: IconThemeData(color: Colors.black),
  textTheme: TextTheme(),
);
