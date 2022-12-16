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
  loadLanguage(lang);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AppBloc(),
      child: MaterialApp(
        key: globalKey,
        debugShowCheckedModeBanner: false,
        home: const DashboardPage(),
        locale: Locale(lang),
        theme: lightTheme,
      ),
    );
  }
}
