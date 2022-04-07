
import 'package:equatable/equatable.dart';

abstract class TabIndexEvent extends Equatable {
  const TabIndexEvent();
  @override
  List<Object> get props => [];
}

class ChangeIndex extends TabIndexEvent{
   final int tabIndex;
   const ChangeIndex(this.tabIndex);
   @override
   List<Object> get props => [tabIndex];
   @override
   String toString() => tabIndex.toString();
}

