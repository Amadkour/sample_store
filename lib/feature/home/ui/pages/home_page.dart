import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_store/core/colors.dart';
import 'package:sample_store/core/global_bloc/app_bloc.dart';
import 'package:sample_store/core/res/theme/colors.dart';
import 'package:sample_store/core/widget/my_image.dart';
import 'package:sample_store/feature/home/bloc/home_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          HomeBloc controller = context.read<HomeBloc>();
          return controller.state is NewsLoaded
              ? (controller.state as NewsLoaded).news.fold(
                    (l) => Text(l.errorMessage),
                    (r) => Container(
                      child: ListView(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AutoSizeText(
                                tr('last_news'),
                                maxFontSize: 16,
                                minFontSize: 12,
                                maxLines: 1,
                                style: TextStyle(fontSize: 16, color: AppColors.darkColor),
                              ),
                              AutoSizeText(
                                tr('more'),
                                maxFontSize: 14,
                                minFontSize: 12,
                                maxLines: 1,
                                style: TextStyle(fontSize: 14, color: AppColors.moreColor),
                              )
                            ],
                          ),
                          MyImage(
                            url: r.first.image,
                            width: double.maxFinite,
                            height: 200,
                            boarderRadius: 10,
                            fit: BoxFit.cover,
                          ),
                          AutoSizeText(
                            (isArabic ? r.first.titleAr : r.first.titleEn) ??
                                '',
                            maxLines: 1,
                            maxFontSize: 14,
                            minFontSize: 12,
                            style: TextStyle(
                              color: AppColors.textColor1,
                              fontSize: 14,
                            ),
                          ),
                          AutoSizeText(
                            (isArabic
                                ? r.first.contentAr
                                : r.first.contentEn) ??
                                '',
                            maxLines: 1,
                            maxFontSize: 14,
                            minFontSize: 14,
                            style: TextStyle(
                                color: AppColors.darkColor,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          ///----------------------------
                          const SizedBox(height: 20,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AutoSizeText(
                                  tr('last_news'),
                                  maxFontSize: 16,
                                  minFontSize: 12,
                                  maxLines: 1,
                                  style: TextStyle(fontSize: 16, color: AppColors.darkColor),
                                ),
                                AutoSizeText(
                                  tr('more'),
                                  maxFontSize: 14,
                                  minFontSize: 12,
                                  maxLines: 1,
                                  style: TextStyle(fontSize: 14, color: AppColors.moreColor),
                                )
                              ],
                            ),
                          ),
                          ...List.generate(
                              3,
                              (index) => Container(
                                padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                const MyImage(
                                                  url: 'assets/images/club.png',
                                                  width: 29,
                                                  height: 34,
                                                ),
                                                AutoSizeText(
                                                  tr('al-ahly'),
                                                  maxFontSize: 14,
                                                  minFontSize: 10,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: AppColors.darkColor,
                                                      fontFamily: 'Bold'),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                AutoSizeText(
                                                  tr('22:00'),
                                                  maxFontSize: 12,
                                                  minFontSize: 10,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: AppColors.darkColor,
                                                      fontFamily: 'Bold'),
                                                ),
                                                AutoSizeText(
                                                  tr('date'),
                                                  maxFontSize: 12,
                                                  minFontSize: 10,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: AppColors.textColor2,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                AutoSizeText(
                                                  tr('al-ahly'),
                                                  maxFontSize: 14,
                                                  minFontSize: 10,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: AppColors.darkColor,
                                                      fontFamily: 'Bold'),
                                                ),
                                                const MyImage(
                                                  url: 'assets/images/club.png',
                                                  width: 29,
                                                  height: 34,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                    const Divider(),
                                  ],
                                ),
                              )),
                          const SizedBox(height: 20,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AutoSizeText(
                                  tr('last_news'),
                                  maxFontSize: 16,
                                  minFontSize: 12,
                                  maxLines: 1,
                                  style: TextStyle(fontSize: 16, color: AppColors.darkColor),
                                ),
                                AutoSizeText(
                                  tr('more'),
                                  maxFontSize: 14,
                                  minFontSize: 12,
                                  maxLines: 1,
                                  style: TextStyle(fontSize: 14, color: AppColors.moreColor),
                                )
                              ],
                            ),
                          ),
                          ...List.generate(
                              3,
                                  (index) => Container(
                                padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              decoration:BoxDecoration(
                                                border: Border.all(color: Colors.grey),
                                                borderRadius: BorderRadius.circular(10)
                                              ),
                                              child: const MyImage(
                                                url: 'assets/images/club.png',
                                                width: 29,
                                                height: 34,
                                              ),
                                            ),
                                            AutoSizeText(
                                              tr('al-ahly'),
                                              maxFontSize: 14,
                                              minFontSize: 10,
                                              maxLines: 1,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: AppColors.darkColor,
                                                  fontFamily: 'Bold'),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            AutoSizeText(
                                              tr('22:00'),
                                              maxFontSize: 12,
                                              minFontSize: 10,
                                              maxLines: 1,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: AppColors.darkColor,
                                                  fontFamily: 'Bold'),
                                            ),
                                            AutoSizeText(
                                              tr('date'),
                                              maxFontSize: 12,
                                              minFontSize: 10,
                                              maxLines: 1,
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: AppColors.textColor2,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            AutoSizeText(
                                              tr('al-ahly'),
                                              maxFontSize: 14,
                                              minFontSize: 10,
                                              maxLines: 1,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: AppColors.darkColor,
                                                  fontFamily: 'Bold'),
                                            ),
                                            const MyImage(
                                              url: 'assets/images/club.png',
                                              width: 29,
                                              height: 34,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    const Divider(),
                                  ],
                                ),
                              ))                        ],
                      ),
                    ),
                  )
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
