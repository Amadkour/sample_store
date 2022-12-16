import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:sample_store/feature/dashboard/bloc/tab_index_event.dart';
import 'package:sample_store/feature/dashboard/bloc/tab_index_state.dart';
import 'package:sample_store/feature/dashboard/provider/model/dashboard_item.dart';
import 'package:sample_store/feature/dashboard/provider/repo/dashboard_repo.dart';

class TabIndexBloc extends Bloc<TabIndexEvent, TabIndexState> {
  static late PersistentTabController tabController= PersistentTabController();
  late List<DashboardFooterTabModel> footerTabs;
  late List<DashboardHeaderTabModel> headerTabs;

  TabIndexBloc() : super(const TabIndexChanged(headerTabIndex: 0, footerTabIndex: 0)) {

    footerTabs = DashboardRepo.instance.fetchFooterTabs();
    headerTabs = DashboardRepo.instance.fetchHeaderTabs();
  }

  ///listen tab changing
  @override
  Stream<TabIndexState> mapEventToState(TabIndexEvent event) async* {
    if (event is TabIndexChange) {
      tabController.jumpToTab(event.footerTabIndex);
      yield TabIndexChanged(
          headerTabIndex: event.headerTabIndex, footerTabIndex: event.footerTabIndex);
    }
  }
}
