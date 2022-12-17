import 'package:flutter/material.dart';
import 'package:sample_store/feature/centre_page/ui/centre_page.dart';
import 'package:sample_store/feature/home/ui/pages/home_page.dart';
import '../../../../core/global_bloc/app_bloc.dart';
import '../../../contact_us/ui/page/first_screen.dart';
import '../model/more_item.dart';

class MoreRepo {
  MoreRepo._singleTone();

  static final MoreRepo _instance = MoreRepo._singleTone();

  static MoreRepo get instance => _instance;

  List<TabModel> fetchHeaderTabs() {
    return [
      TabModel(content: const HomePage(), tab: 'Clubs Guide', color: Colors.white),
      TabModel(
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                tr('schedule'),
              ),
            ],
          ),
          tab: 'Matches Guide',
          color: Colors.white),
      TabModel(content: const CentrePage(), tab: 'about', color: Colors.red),
      TabModel(
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                tr('terms_conditions'),
              ),
            ],
          ),
          tab: 'terms_conditions',
          color: Colors.green),
      TabModel(
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                tr('groups'),
              ),
            ],
          ),
          tab: 'groups',
          color: Colors.blue),
      TabModel(content: ContactUsFirst(), tab: 'contact_us', color: Colors.white),
      TabModel(
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                tr('share'),
              ),
            ],
          ),
          tab: 'share',
          color: Colors.red),
      TabModel(
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                tr('share'),
              ),
            ],
          ),
          tab: tr('share_news'),
          color: Colors.green),
    ];
  }

  List<String> fetchFooterTabs() {
    return [
      'assets/images/facebook.svg',
      'assets/images/tweeter.svg',
      'assets/images/insta.svg',
      'assets/images/linkedin.svg',
      'assets/images/youtube.svg',
    ];
  }
}
