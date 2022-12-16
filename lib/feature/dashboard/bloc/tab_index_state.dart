abstract class TabIndexState {
  final int headerTabIndex;
  final int footerTabIndex;

  const TabIndexState({required this.headerTabIndex, required this.footerTabIndex});

  List<Object?> get props => [headerTabIndex,headerTabIndex];
}

class TabIndexChanged extends TabIndexState {

  const TabIndexChanged({required int headerTabIndex, required int footerTabIndex})
      : super(headerTabIndex: headerTabIndex, footerTabIndex: footerTabIndex);

  @override
  List<Object?> get props => [headerTabIndex,headerTabIndex];

}
