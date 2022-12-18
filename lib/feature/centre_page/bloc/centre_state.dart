part of 'centre_bloc.dart';

@immutable
abstract class CentreState {
}

class CentreInitial extends CentreState {}

class CentreNewsLoading extends CentreState {}

class CentreNewsLoaded extends CentreState {
  final int pageNumber;
  final bool  hasNext;
  final Either<FailureResponse, List<NewsModel>> news;

  CentreNewsLoaded( {required this.news, required this.pageNumber,required  this.hasNext,});
}
