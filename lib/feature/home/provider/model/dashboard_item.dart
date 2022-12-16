import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class DashboardModel{
  final Widget content;
  final PersistentBottomNavBarItem tab;
  DashboardModel(this.content, this.tab);
}