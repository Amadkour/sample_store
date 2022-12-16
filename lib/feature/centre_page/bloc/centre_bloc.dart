import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sample_store/core/provider/remote/failure_response.dart';
import 'package:sample_store/feature/news/provider/model/newa_model.dart';
import 'package:sample_store/feature/news/provider/repo/news_repo.dart';

part 'centre_event.dart';

part 'centre_state.dart';

class CentreBloc extends Bloc<CentreEvent, CentreState> {
  CentreBloc() : super(CentreInitial()) {
    init();
  }

  late RefreshController refreshController = RefreshController(initialRefresh: false);

  init() async {
    emit(CentreNewsLoaded(pageNumber: 1, news: await NewsRepo.instance.fetchModels(pageNumber: 1)));
  }

  ///listen tab changing
  @override
  Stream<CentreState> mapEventToState(CentreEvent event) async* {
    print('kmkkm');
    if (event is CentreNewsLoadPrevious) {
      yield CentreNewsLoaded(
          pageNumber: event.pageNumber - 1,
          news: await NewsRepo.instance.fetchModels(pageNumber: event.pageNumber - 1));
      refreshController.loadComplete();

    } else if (event is CentreNewsLoadNext) {
      yield CentreNewsLoaded(
          pageNumber: event.pageNumber + 1,
          news: await NewsRepo.instance.fetchModels(pageNumber: event.pageNumber + 1));
      refreshController.loadComplete();

    }
  }
}
