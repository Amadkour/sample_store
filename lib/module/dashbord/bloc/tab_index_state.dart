

import 'package:equatable/equatable.dart';

abstract class TabIndexState  {
  final int tabIndex;
  const TabIndexState({required this.tabIndex});
  List<Object?> get props => [tabIndex];
}
class TabIndexChanged extends TabIndexState {
  final int tabIndex;
  const TabIndexChanged({required this.tabIndex}) : super(tabIndex: tabIndex);
  @override
  List<Object?> get props => [tabIndex];
  @override
  String toString() => tabIndex.toString();
}
