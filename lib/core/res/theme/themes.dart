import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'colors.dart';

ThemeData lightTheme=ThemeData(
cupertinoOverrideTheme: const CupertinoThemeData(brightness: Brightness.light),
primaryColor: defaultColorScheme.primary,

textSelectionTheme: TextSelectionThemeData(
cursorColor: defaultColorScheme.primary,
),
scaffoldBackgroundColor: defaultColorScheme.background,
fontFamily: 'main',
colorScheme: defaultColorScheme,
);