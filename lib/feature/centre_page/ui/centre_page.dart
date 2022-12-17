import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loadmore/loadmore.dart';
import 'package:sample_store/core/res/theme/colors.dart';
import '../../news/ui/page/news_view.dart';
import '../bloc/centre_bloc.dart';

class CentrePage extends StatelessWidget {
  const CentrePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: BlocProvider(
        create: (context) => CentreBloc(),
        child: BlocBuilder<CentreBloc, CentreState>(
          builder: (context, state) {
            CentreBloc controller = context.read<CentreBloc>();
            return state is CentreNewsLoaded
                ? state.news.fold((l) => Text(l.errorMessage), (r) {
                    return LoadMore(
                      whenEmptyLoad: false,
                      isFinish: !state.enablePullUp,
                      onLoadMore: () async {
                        await Future.delayed(Duration(seconds: 0, milliseconds: 100));
                        controller.add(CentreNewsLoadNext(state.pageNumber));
                        return true;
                      },
                      child: NewsView(r),
                    );
                  })
                : const Center(
                    child: CircularProgressIndicator(
                      color: primaryColor,
                    ),
                  );
          },
        ),
      ),
    );
  }
}
