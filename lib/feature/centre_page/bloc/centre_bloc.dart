import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:sample_store/core/provider/remote/failure_response.dart';
import 'package:sample_store/feature/news/provider/model/newa_model.dart';
import 'package:sample_store/feature/news/provider/repo/news_repo.dart';

part 'centre_event.dart';

part 'centre_state.dart';

class CentreBloc extends Bloc<CentreEvent, CentreState> {
  List<NewsModel> previousModels = [];

  CentreBloc() : super(CentreInitial()) {
    scrollController = ScrollController(initialScrollOffset: 50.0);
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isEnd = scrollController.position.pixels != 0;
        if (isEnd) {
          if (state is CentreNewsLoaded && (state as CentreNewsLoaded).hasNext) {
            previousModels=(((state as CentreNewsLoaded).news).fold((l) => [], (r) => r));
            add(CentreNewsLoadNext((state as CentreNewsLoaded).pageNumber));
          }
        }
      }
      // emit(CentreInitial());
    });
    add(CentreNewsLoadNext(0));

    // init();
  }

  late ScrollController scrollController;

  ///listen tab changing
  @override
  Stream<CentreState> mapEventToState(CentreEvent event) async* {
    if (event is CentreNewsLoadPrevious) {
      yield CentreNewsLoaded(
          hasNext: true,
          pageNumber: event.pageNumber - 1,
          news: await NewsRepo.instance.fetchModels(pageNumber: event.pageNumber - 1));
    } else if (event is CentreNewsLoadNext) {
      final Either<FailureResponse, List<NewsModel>> news =
          await NewsRepo.instance.fetchModels(pageNumber: event.pageNumber + 1);

      yield CentreNewsLoaded(
          hasNext: news.fold((l) => 0, (r) => r.length) >= 5,
          pageNumber: event.pageNumber + 1,
          news: news.fold((l) => Left(l), (r) => Right(previousModels..addAll(r))));
    }
  }
}
