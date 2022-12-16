import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:sample_store/feature/news/provider/repo/news_repo.dart';

import '../../../core/provider/remote/failure_response.dart';
import '../../news/provider/model/newa_model.dart';
part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<LoadNews>((event, emit) async {
      emit(NewsLoading());
      await NewsRepo.instance
          .fetchModels(pageNumber:1,limit: 1)
          .then((value) => emit(NewsLoaded(value)));
    });

    ///load data
    add(LoadNews());
  }

}
