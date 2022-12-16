import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:sample_store/feature/centre_page/ui/centre_page.dart';
import 'package:sample_store/feature/home/ui/pages/home_page.dart';
import '../../../../core/global_bloc/app_bloc.dart';
import '../../../more/ui/page/more_page.dart';
import '../model/dashboard_item.dart';

class DashboardRepo {
  DashboardRepo._singleTone();

  static final DashboardRepo _instance = DashboardRepo._singleTone();

  static DashboardRepo get instance => _instance;

  List<DashboardFooterTabModel> fetchFooterTabs() {
    return [
      DashboardFooterTabModel(
        content: const HomePage(),
        tab: 'home',
      ),
      DashboardFooterTabModel(
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              tr('schedule'),
            ),
          ],
        ),
        tab: 'schedule',
      ),
      DashboardFooterTabModel(
        content: const CentrePage(),
        tab: tr('centre_page'),
      ),
      DashboardFooterTabModel(
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              tr('statistics'),
            ),
          ],
        ),
        tab: 'statistics',
      ),
      DashboardFooterTabModel(
        content: MorePage(),
        tab: tr('more'),
      ),
    ];
  }

  List<DashboardHeaderTabModel> fetchHeaderTabs() {
    return [
      DashboardHeaderTabModel(
        content: const HomePage(),
        tab: 'news',
      ),
      DashboardHeaderTabModel(
        content: Text(tr('images')),
        tab: 'images',
      ),
      DashboardHeaderTabModel(
        content: Text(tr('videos')),
        tab: 'videos',
      ),
    ];
  }
}
