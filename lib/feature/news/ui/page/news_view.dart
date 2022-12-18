import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample_store/feature/news/provider/model/newa_model.dart';

import '../component/new_card.dart';

class NewsView extends StatefulWidget {
  final List<NewsModel> models;
  final ScrollController scrollController;

  const NewsView(this.models, {Key? key, required this.scrollController}) : super(key: key);

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemBuilder: (_, int index) => NewsCard(
            newsItem:widget. models[index],
          ),
          itemCount: widget.models.length,
          scrollDirection: Axis.vertical,
          controller:widget.scrollController,
          separatorBuilder: (_, int index) => const SizedBox(
            height: 10,
          ),
          ),
    );
  }
}
