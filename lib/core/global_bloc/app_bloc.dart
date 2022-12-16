import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

part 'app_event.dart';

part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppInitial()) {
    on<AppEvent>((event, emit) {
      // TODO: implement event handler
    });
  }



  /// also can use this file to config font size and theme in all app screens
}

String tr(String key) => localization[key] ?? key;
Map localization = {};
String lang = 'ar_AE';
///language
loadLanguage(String l) async {
  lang = l;
  String translation;
  translation = await rootBundle.loadString('assets/localization/$lang.json');
  localization = jsonDecode(translation);
}
bool get isArabic => lang == 'ar_AE';
