import 'package:flutter/material.dart';
import 'package:sample_store/feature/dashboard/ui/pages/dashbord.dart';
import 'package:sample_store/routes/routes_name.dart';

mixin AppRouter {
  static Route<dynamic> router(RouteSettings settings) {
    switch (settings.name) {

      case RoutesName.newsDetails:
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const DashboardPage(),
        );
      default:
        return MaterialPageRoute<dynamic>(
          maintainState: false,
          builder: (BuildContext context) => const DashboardPage(),
        );
    }
  }
}
