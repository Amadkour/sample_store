import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyToast {
  MyToast(
    dynamic snackMessage, {
    Color? fontColor,
    Color? background,
    bool? isError,
  }) {
    Fluttertoast.showToast(
      msg: snackMessage,
      backgroundColor: Colors.black,
      fontSize: 16,
      textColor: fontColor ?? Colors.white,
    );
  }
}
