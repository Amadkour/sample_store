import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:sample_store/feature/home/ui/pages/home_page.dart';
import 'package:sample_store/feature/news/presentation/page/news_view.dart';
import '../model/dashboard_item.dart';

class DashboardRepo {

  DashboardRepo._singleTone();
  static final DashboardRepo _instance = DashboardRepo._singleTone();

  static DashboardRepo get instance => _instance;

  List<DashboardModel> fetchData() {
    return [
      DashboardModel(
        const HomePage(),
        PersistentBottomNavBarItem(icon: const Icon(CupertinoIcons.question_square), title: 'home'),
      ),
      DashboardModel(
        const Text('data'),
        PersistentBottomNavBarItem(icon: const Icon(CupertinoIcons.question_square), title: 'home'),
      ),
      DashboardModel(
        const Text('data'),
        PersistentBottomNavBarItem(icon: const Icon(CupertinoIcons.question_square), title: 'home'),
      ),
      DashboardModel(
        const Text('data'),
        PersistentBottomNavBarItem(icon: const Icon(CupertinoIcons.question_square), title: 'home'),
      ),
    ];
  }
}
