import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sample_store/core/res/theme/colors.dart';
import 'package:sample_store/feature/home/bloc/home_bloc.dart';
import 'package:sample_store/feature/news/presentation/page/news_view.dart';
import '../bloc/centre_bloc.dart';

class CentrePage extends StatelessWidget {
  const CentrePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CentreBloc(),
      child: BlocBuilder<CentreBloc, CentreState>(
        builder: (context, state) {
          CentreBloc controller = context.read<CentreBloc>();
          return state is CentreNewsLoaded
              ? state.news.fold((l) => Text(l.errorMessage), (r) {
                  return SmartRefresher(
                      controller: controller.refreshController,
                      enablePullDown: true,
                      enablePullUp: true,
                      header: WaterDropHeader(),
                      // header: const MaterialClassicHeader(),
                      footer: CustomFooter(
                        loadStyle: LoadStyle.ShowWhenLoading,
                        builder: (BuildContext? context, LoadStatus? mode) {
                          Widget body;
                          if (mode == LoadStatus.loading) {
                            body = const CircularProgressIndicator();
                          } else {
                            body = const SizedBox.shrink();
                          }
                          return SizedBox(
                            height: 50.0,
                            child: Center(child: body),
                          );
                        },
                      ),
                      onRefresh: () {
                        print('object');
                        controller.add(CentreNewsLoadNext(state.pageNumber));
                      },
                      onLoading: () {
                        print('object');

                        controller.add(CentreNewsLoadPrevious(state.pageNumber));
                      },
                      child: NewsView(r));
                })
              : const Center(
                  child: CircularProgressIndicator(
                    color: primaryColor,
                  ),
                );
        },
      ),
    );
  }
}
