part of 'centre_bloc.dart';

@immutable
abstract class CentreEvent {}
class CentreNewsLoadNext extends CentreEvent {
  final int pageNumber;
  CentreNewsLoadNext(this.pageNumber);
}
class CentreNewsLoadPrevious extends CentreEvent {
  final int pageNumber;
  CentreNewsLoadPrevious(this.pageNumber);
}
