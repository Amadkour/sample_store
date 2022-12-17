import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:sample_store/core/res/theme/colors.dart';
import 'package:sample_store/core/widget/base_page.dart';
import 'package:sample_store/core/widget/my_image.dart';
import 'package:sample_store/feature/dashboard/bloc/tab_index_event.dart';
import '../../../../core/global_bloc/app_bloc.dart';
import '../../bloc/tab_index_bloc.dart';
import '../../bloc/tab_index_state.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
  builder: (context, state) {
    return BlocProvider(
      create: (context) => TabIndexBloc(),
      child: BlocBuilder<TabIndexBloc, TabIndexState>(
        builder: (context, state) {
          TabIndexBloc controller = context.read<TabIndexBloc>();
          return MainScaffold(
            appBarWidget:state.footerTabIndex!=4? Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const MyImage(
                  url: 'assets/images/logo.png',
                  height: null,
                  width: 50,
                ),
                state.footerTabIndex == 2?
                  Row(
                    children: List.generate(
                        controller.headerTabs.length,
                        (index) => Expanded(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () => controller.add(TabIndexChange(
                                    headerTabIndex: index, footerTabIndex: state.footerTabIndex)),
                                child: Container(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  decoration: index == state.headerTabIndex
                                      ? const BoxDecoration(
                                          border: Border(
                                              bottom:
                                                  BorderSide(color: selectedHeaderTab, width: 2)))
                                      : null,
                                  child: Text(
                                    tr(controller.headerTabs[index].tab),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: index == state.headerTabIndex
                                            ? selectedHeaderTab
                                            : unselectedHeaderTab),
                                  ),
                                ),
                              ),
                            ))),
                  ):
                const SizedBox(height: 20,)
                ,
              ],
            ):null,
            scaffold: PersistentTabView.custom(
              context,
              controller: TabIndexBloc.tabController,
              confineInSafeArea: true,
              backgroundColor: Theme.of(context).primaryColor,
              handleAndroidBackButtonPress: true,
              stateManagement: true,
              bottomScreenMargin: 0,
              onWillPop: (_) => Future.value(false),
              hideNavigationBarWhenKeyboardShows: true,
              itemCount: controller.footerTabs.length,
              screens: List<Widget>.from(controller.footerTabs.map((e) => e.content)),
              customWidget: ColoredBox(
                  color: Theme.of(context).primaryColor,
                  child: Row(
                      children: List.generate(
                          controller.footerTabs.length,
                          (index) => Expanded(
                                child: InkWell(
                                  splashColor: unselectedHeaderTab,
                                  overlayColor: MaterialStateProperty.all(unselectedHeaderTab),
                                  onTap: () {
                                    controller.add(TabIndexChange(
                                        headerTabIndex: state.headerTabIndex,
                                        footerTabIndex: index));
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      const Spacer(),
                                      Icon(
                                        index == 3
                                            ? CupertinoIcons.star_fill
                                            : CupertinoIcons.question_square,
                                        size: 33,
                                        color: state.footerTabIndex == index
                                            ? selectedHeaderTab
                                            : unselectedHeaderTab,
                                      ),
                                      FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Text(
                                          tr(controller.footerTabs[index].tab),
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: state.footerTabIndex == index
                                                  ? selectedHeaderTab
                                                  : unselectedHeaderTab,
                                              fontWeight: state.footerTabIndex == index
                                                  ? FontWeight.w700
                                                  : FontWeight.w500),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )))),
            ),
          );
        },
      ),
    );
  },
);
  }
}
