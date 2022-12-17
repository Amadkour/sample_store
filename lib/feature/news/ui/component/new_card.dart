import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:sample_store/core/colors.dart';
import 'package:sample_store/core/global_bloc/app_bloc.dart';
import 'package:sample_store/core/widget/my_image.dart';
import 'package:sample_store/feature/news/provider/model/newa_model.dart';

import 'details.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({Key? key, required this.newsItem}) : super(key: key);
  final NewsModel newsItem;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => pushNewScreen(context, screen: NewsDetails(newsModel: newsItem),withNavBar: false),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Stack(
              children: [
                Positioned(
                  child: MyImage(
                    url: newsItem.image,
                    width: 130,
                    height: 94,
                    boarderRadius: 9,
                  ),
                ),
                const Positioned(child: MyImage(
                  url: 'assets/images/logo2.png',
                  width: 25,
                  height: 35,
                  fit: BoxFit.scaleDown,
                  boarderRadius: 9,
                ),
                bottom:-10 ,right: 0,),

              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  (isArabic ? newsItem.titleAr : newsItem.titleEn) ?? '',
                  maxLines: 1,
                  maxFontSize: 14,
                  minFontSize: 12,
                  style: TextStyle(
                    color: AppColors.textColor1,
                    fontSize: 14,
                  ),
                ),
                AutoSizeText(
                  (isArabic ? newsItem.contentAr : newsItem.contentEn) ?? '',
                  maxLines: 2,
                  maxFontSize: 14,
                  minFontSize: 14,
                  style: TextStyle(
                      color: AppColors.darkColor, fontSize: 14, fontWeight: FontWeight.bold),
                ),
                AutoSizeText(
                  DateFormat.yMMMMd(lang).format(newsItem.createdAt ?? DateTime.now()),
                  maxLines: 1,
                  maxFontSize: 11,
                  minFontSize: 11,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: AppColors.textColor2,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
