import 'package:flutter/material.dart';

ThemeData theme = ThemeData.light().copyWith(
    appBarTheme: ThemeData.light().appBarTheme.copyWith(
          elevation: 1,
          color: Colors.white,
        ),
    primaryTextTheme: ThemeData.light().primaryTextTheme.apply(
          bodyColor: Colors.black,
          displayColor: Colors.black,
        ),
    primaryIconTheme:
        ThemeData.light().primaryIconTheme.copyWith(color: Colors.black));
