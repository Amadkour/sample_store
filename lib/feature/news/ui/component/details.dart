import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample_store/feature/news/provider/model/newa_model.dart';

import '../../../../core/colors.dart';
import '../../../../core/global_bloc/app_bloc.dart';
import '../../../../core/widget/base_page.dart';
import '../../../../core/widget/my_image.dart';

class NewsDetails extends StatelessWidget {
  const NewsDetails({Key? key, required this.newsModel}) : super(key: key);
  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) => MainScaffold(
      scaffold: Container(
        padding: const EdgeInsets.all(30),
        color: Colors.white,
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyImage(
                  url: newsModel.image,
                  width: double.maxFinite,
                  height: 200,
                  boarderRadius: 10,
                  fit: BoxFit.cover,
                ),
                AutoSizeText(
                  (isArabic ? newsModel.titleAr : newsModel.titleEn) ?? '',
                  maxLines: 1,
                  maxFontSize: 14,
                  minFontSize: 12,
                  style: TextStyle(
                    color: AppColors.textColor1,
                    fontSize: 14,
                  ),
                ),
                AutoSizeText(
                  (isArabic ? newsModel.contentAr : newsModel.contentEn) ?? '',
                  maxFontSize: 14,
                  textAlign: TextAlign.justify,
                  minFontSize: 14,
                  style: TextStyle(
                      color: AppColors.darkColor, fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
      appBarWidget: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const MyImage(
            url: 'assets/images/logo.png',
            height: null,
            width: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () => Navigator.maybePop(context),
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ))
            ],
          ),
        ],
      ));
}
