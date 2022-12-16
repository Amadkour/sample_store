import 'package:flutter/material.dart';

/// Redesign ColorScheme

const Color primaryColor = Color(0xFF0F1737);
const Color onPrimaryColor = Colors.white;
const Color surfaceColor = Colors.white;
const Color onSurfaceColor = Color(0xFF8AAEC6);
const Color backgroundColor = Color(0xFFF3F3F3);
const Color onBackgroundColor = Colors.black;
const Color secondaryColor = Color(0xFF22B8B0);
const Color secondaryContainerColor = Color(0xFFC97D31);
const Color tertiaryColor = Color(0xFFECF2F8);
const Color errorColor = Color(0x1AE53636);
const Color onErrorColor = Color(0xFFE53636);
const Color greyColor = Color(0xFFCCCCCC);
const Color outline = Color(0xFF598CAE);
const Color inverseSurface = Color(0xFF57C5CC);
const Color onInverseSurface = Color(0xFF8995AE);
const Color onTertiaryContainer = Color(0xFFDCE3EB);
const Color darkGrey = Color(0xFF919191);

const ColorScheme defaultColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: primaryColor,
    onPrimary: onPrimaryColor,
    secondary: secondaryColor,
    secondaryContainer: secondaryContainerColor,
    onSecondary: onPrimaryColor,
    tertiary: tertiaryColor,
    onTertiary: primaryColor,
    error: errorColor,
    onError: onErrorColor,
    background: backgroundColor,
    onBackground: onBackgroundColor,
    surface: surfaceColor,
    onSurface: onSurfaceColor,
    shadow: greyColor,
    outline: outline,
    inverseSurface: inverseSurface,
    onInverseSurface: onInverseSurface,
    onTertiaryContainer: onTertiaryContainer);

const LinearGradient shimmerGradient = LinearGradient(
  colors: <Color>[
    Color(0xFFEBEBF4),
    Color(0xFFF4F4F4),
    Color(0xFFEBEBF4),
  ],
  stops: <double>[
    0.1,
    0.3,
    0.4,
  ],
);

/// Old Colors

//header tabs
const Color unselectedHeaderTab = Color(0xFFB7B7B7);
const Color selectedHeaderTab = Color(0xFFffffff);

//address
const Color borderColor = Color(0xFFEDF0F7);
const Color lightGreen = Color(0xFFECF2F8);
const Color grey = Color(0xFFF6F8FF);
const Color moreGrey = Color(0xFF8995AE);
const Color backgroundAppBar = Color(0xFF142C5E);
const Color fillBackGround = Color(0xFFF6F8FF);
const Color borderAddNewAddress = Color(0xFF8995AE);
const Color backAddNewAddress = Color(0xFFECF2F8);
const Color chineseViolet = Color(0xFF7A5782);
const Color chiVioHard = Color(0xDD7A5782);
const Color chiVioletMedium = Color(0xBB7A5782);
const Color chiVioletWeak = Color(0x407A5782);
const Color chiVioletLight = Color(0x147A5782);
const Color darkerChineseViolet = Color(0xFF503855);
const Color mellow = Color(0xFFF7DB7F);
const Color buff = Color(0xFFF2D77D);
const Color desire = Color(0xFFC97D31);
const Color olivine = Color(0xFF9BB076);

const Color primaryText = Color(0xFF212121);
const Color secondaryText = Color(0xFF757575);
const Color divider = Color(0xFFBDBDBD);