import 'package:flutter/cupertino.dart';
import 'package:sample_store/feature/news/provider/model/newa_model.dart';

import '../component/new_card.dart';

class NewsView extends StatelessWidget {
  final List<NewsModel> models;

  const NewsView(this.models, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (_, int index) => NewsCard(
        newsItem: models[index],
      ),
      itemCount: models.length,
      separatorBuilder: (_, int index) => const SizedBox(
        height: 10,
      ),
    );
  }
}
