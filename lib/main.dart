import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:sample_store/core/global_bloc/app_bloc.dart';
import 'package:sample_store/core/res/theme/themes.dart';
import 'feature/dashboard/ui/pages/dashbord.dart';

GlobalKey globalKey = GlobalKey();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting();
  /// run normal app or network error
    ///----------------lang must be not null

    if (await readKey('lang') as String == '') {
      await writeKey('lang', Platform.localeName.split('_').first);
    }
    lang=await readKey('lang');
    runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AppBloc(),
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          context.read<AppBloc>().loadLanguage(lang);
          return MaterialApp(
            key: globalKey,
            debugShowCheckedModeBanner: false,
            home: const DashboardPage(),
            locale: Locale(lang),
            theme: lightTheme,
          );
        },
      ),
    );
  }
}
