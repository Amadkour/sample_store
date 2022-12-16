
import 'package:equatable/equatable.dart';

abstract class TabIndexEvent extends Equatable {
  const TabIndexEvent({required this.headerTabIndex, required this.footerTabIndex});
  @override
  List<Object?> get props => [headerTabIndex,headerTabIndex];
  final int headerTabIndex;
  final int footerTabIndex;

}

class TabIndexChange extends TabIndexEvent{
  const TabIndexChange({required int headerTabIndex, required int footerTabIndex}) : super(headerTabIndex: headerTabIndex, footerTabIndex: footerTabIndex);

}