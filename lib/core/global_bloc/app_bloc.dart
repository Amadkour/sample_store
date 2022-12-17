import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_event.dart';

part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppInitial()) {
    on<AppEvent>((event, emit) {
      if (event is LanguageChange) {
        emit(LanguageChanged());
      }
    });
  }

  ///language
  loadLanguage(String l) async {
    lang = l;
    String translation;
    translation = await rootBundle.loadString('assets/localization/$lang.json');
    localization = jsonDecode(translation);
    writeKey('lang', lang);
    add(LanguageChange());
  }
}

String tr(String key) => localization[key] ?? key;
Map localization = {};
String lang = 'ar_AE';

bool get isArabic => lang == 'ar_AE';
///////////////////////////////////////////////////////////////////////////////////////

Future<dynamic> readKey(String key, {dynamic defaultValue = ''}) async {
  final dynamic value = (await SharedPreferences.getInstance()).get(key);
  return value ?? Future<dynamic>.value(defaultValue);
}

Future<void> writeKey(String key, dynamic value,
    {dynamic defaultValue = ''}) async {
  if (value.runtimeType.toString().toLowerCase() == 'bool') {
    (await SharedPreferences.getInstance()).setBool(key, value as bool);
  } else {
    (await SharedPreferences.getInstance()).setString(key, value as String);
  }
}