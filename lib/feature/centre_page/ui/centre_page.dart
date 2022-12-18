import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loadmore/loadmore.dart';
import 'package:sample_store/core/res/theme/colors.dart';
import '../../news/ui/component/new_card.dart';
import '../../news/ui/page/news_view.dart';
import '../bloc/centre_bloc.dart';

class CentrePage extends StatelessWidget {
  const CentrePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocProvider(
          create: (context) => CentreBloc(),
          child: BlocBuilder<CentreBloc, CentreState>(
            builder: (context, state) {
              CentreBloc controller = context.read<CentreBloc>();
              return state is CentreNewsLoaded
                  ? state.news.fold((l) => Text(l.errorMessage), (r) {
                      return SingleChildScrollView(
                        controller: controller.scrollController,
                        child: Column(
                          children: [
                            ...List.generate(
                              r.length,
                              (index) => Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: NewsCard(
                                  newsItem: r[index],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            state.hasNext
                                ? Container(
                                    height: 50,
                                    margin: EdgeInsets.only(bottom: 50),
                                    width: 50,
                                    child: const CircularProgressIndicator(
                                      color: Colors.black,
                                    ))
                                : const Text(
                                    'Last Page',
                                    style: TextStyle(color: primaryColor, fontSize: 16),
                                  ),
                            const SizedBox(
                              height: 40,
                            ),
                          ],
                        ),
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
      ),
    );
  }
}
