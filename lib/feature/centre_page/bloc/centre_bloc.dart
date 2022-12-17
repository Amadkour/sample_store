import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:sample_store/core/provider/remote/failure_response.dart';
import 'package:sample_store/feature/news/provider/model/newa_model.dart';
import 'package:sample_store/feature/news/provider/repo/news_repo.dart';

part 'centre_event.dart';

part 'centre_state.dart';

class CentreBloc extends Bloc<CentreEvent, CentreState> {
  CentreBloc() : super(CentreInitial()) {
    init();
  }

  init() async {
    add(CentreNewsLoadNext(
      1
    ));
    // emit(CentreNewsLoaded(pageNumber: 1, news: await NewsRepo.instance.fetchModels(pageNumber: 1)));
  }

  ///listen tab changing
  @override
  Stream<CentreState> mapEventToState(CentreEvent event) async* {
    if (event is CentreNewsLoadPrevious) {
      print(event);
      yield CentreNewsLoaded(
          pageNumber: event.pageNumber - 1,
          news: await NewsRepo.instance.fetchModels(pageNumber: event.pageNumber - 1));

    } else if (event is CentreNewsLoadNext) {
      print('hhhhh');
      yield CentreNewsLoaded(
          pageNumber: event.pageNumber + 1,
          news: await NewsRepo.instance.fetchModels(pageNumber: event.pageNumber + 1));

    }
  }
}
