part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class NewsLoading extends HomeState {}

class NewsLoaded extends HomeState {
  final Either<FailureResponse, List<NewsModel>> news;

  NewsLoaded(this.news);
}
