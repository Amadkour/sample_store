import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class DashboardFooterTabModel{
  final Widget content;
  final String tab;
  DashboardFooterTabModel( { required this.tab,required this.content,});
}

class DashboardHeaderTabModel{
  final Widget content;
  final String tab;
  DashboardHeaderTabModel({required this.content, required this.tab});
}