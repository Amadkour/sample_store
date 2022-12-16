import 'dart:convert';

import 'package:flutter/services.dart';

class ValidationError {
  ValidationError() {
    loadErrors();
  }

  loadErrors() async {
    errors = json.decode(await rootBundle.loadString(
        0 == 0 ? 'assets/errors/ar.json' : 'assets/errors/en.json'));
  }
   Map errors = {};

}