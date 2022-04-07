import 'dart:async';

import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:sample_store/module/dashbord/bloc/tab_index_event.dart';
import 'package:sample_store/module/dashbord/bloc/tab_index_state.dart';
class TabIndexBloc extends Bloc<TabIndexEvent, TabIndexState> {
  static late TabController control;

  TabIndexBloc() : super(const TabIndexChanged(tabIndex: 0));

  @override
  Stream<TabIndexState> mapEventToState(TabIndexEvent event) async* {
    if (event is ChangeIndex) {
      yield TabIndexChanged(tabIndex: event.tabIndex);
    } else {
      yield const TabIndexChanged(tabIndex: 0);
    }
  }
}
