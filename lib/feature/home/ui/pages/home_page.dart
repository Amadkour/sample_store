import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_store/core/colors.dart';
import 'package:sample_store/core/global_bloc/app_bloc.dart';
import 'package:sample_store/core/res/theme/colors.dart';
import 'package:sample_store/core/widget/my_image.dart';
import 'package:sample_store/feature/dashboard/bloc/tab_index_bloc.dart';
import 'package:sample_store/feature/dashboard/bloc/tab_index_event.dart';
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
                    (r) => ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                  InkWell(
                                    onTap: () => context.read<TabIndexBloc>().add(
                                        const TabIndexChange(headerTabIndex: 0, footerTabIndex: 2)),
                                    child: AutoSizeText(
                                      tr('more'),
                                      maxFontSize: 14,
                                      minFontSize: 12,
                                      maxLines: 1,
                                      style: TextStyle(fontSize: 14, color: AppColors.moreColor),
                                    ),
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
                                (isArabic ? r.first.titleAr : r.first.titleEn) ?? '',
                                maxLines: 1,
                                maxFontSize: 14,
                                minFontSize: 12,
                                style: TextStyle(
                                  color: AppColors.textColor1,
                                  fontSize: 14,
                                ),
                              ),
                              AutoSizeText(
                                (isArabic ? r.first.contentAr : r.first.contentEn) ?? '',
                                maxLines: 1,
                                maxFontSize: 14,
                                minFontSize: 14,
                                style: TextStyle(
                                    color: AppColors.darkColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),

                        ///----------------------------
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
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
                                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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

                        ///----------------------------
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
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
                                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                                  color: Colors.white,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(left: 5.0),
                                            child: MyImage(
                                              url: 'assets/images/logo.png',
                                              width: 35,
                                              height: 34,
                                              fit: BoxFit.scaleDown,
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              AutoSizeText(
                                                tr('al-ahly'),
                                                maxFontSize: 15,
                                                minFontSize: 10,
                                                maxLines: 1,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: AppColors.darkColor,
                                                    fontFamily: 'Bold'),
                                              ),
                                              const AutoSizeText(
                                                '@account',
                                                maxFontSize: 14,
                                                minFontSize: 10,
                                                maxLines: 1,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey,
                                                    fontFamily: 'Bold'),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      AutoSizeText(
                                        (isArabic ? r.first.contentAr : r.first.contentEn) ?? '',
                                        maxFontSize: 12,
                                        minFontSize: 10,
                                        maxLines: 3,
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: AppColors.darkColor,
                                            fontFamily: 'Bold'),
                                      ),
                                      Divider(
                                        color: Colors.blue.withOpacity(0.1),
                                        thickness: 1,
                                      ),
                                    ],
                                  ),
                                )),

                        ///----------------------------
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
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
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                          color: Colors.white,
                          child: Row(
                              children: List.generate(
                            3,
                            (index) => Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: double.maxFinite,
                                    padding: const EdgeInsets.symmetric(vertical: 20),
                                    margin: const EdgeInsets.symmetric(horizontal: 8),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(10)),
                                    child: const MyImage(
                                      url: 'assets/images/club.png',
                                      width: 35,
                                      height: 42,
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
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
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const AutoSizeText(
                                    '33%',
                                    maxFontSize: 14,
                                    minFontSize: 10,
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.grey, fontFamily: 'Bold'),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          )),
                        ),

                        ///----------------------------
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AutoSizeText(
                                tr('videos'),
                                maxFontSize: 16,
                                minFontSize: 12,
                                maxLines: 1,
                                style: TextStyle(fontSize: 16, color: AppColors.darkColor),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                          color: Colors.white,
                          child: const MyImage(
                            url: 'assets/images/image_video.png',
                            width: double.maxFinite,
                            height: 200,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AutoSizeText(
                                tr('sponsors'),
                                maxFontSize: 16,
                                minFontSize: 12,
                                maxLines: 1,
                                style: TextStyle(fontSize: 16, color: AppColors.darkColor),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              MyImage(
                                url: 'assets/images/sponsors.png',
                                width: MediaQuery.of(context).size.width / 2.5,
                                height: 65,
                              ),
                              MyImage(
                                url: 'assets/images/sponsors.png',
                                width: MediaQuery.of(context).size.width / 2.5,
                                height: 65,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                      ],
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
