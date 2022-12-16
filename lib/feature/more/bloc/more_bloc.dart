import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../provider/model/more_item.dart';
import '../provider/repo/more_repo.dart';

part 'more_event.dart';

part 'more_state.dart';

class MoreBloc extends Bloc<MoreEvent, MoreState> {
  late List<String> footerTabs;
  late List<TabModel> headerTabs;

  MoreBloc() : super(MoreInitial()) {
    footerTabs = MoreRepo.instance.fetchFooterTabs();
    headerTabs = MoreRepo.instance.fetchHeaderTabs();
    add(LoadItems());
  }

  ///listen tab changing
  @override
  Stream<MoreState> mapEventToState(MoreEvent event) async* {
    if (event is LoadItems) {
      yield MoreLoaded();
    }
  }
}
