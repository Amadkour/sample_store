import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:sample_store/core/res/theme/colors.dart';
import 'package:sample_store/core/widget/base_page.dart';
import 'package:sample_store/core/widget/text_field/design/child/email_text_field.dart';
import 'package:sample_store/core/widget/text_field/design/child/phone_text_field.dart';
import 'package:sample_store/feature/contact_us/ui/page/second_screen.dart';

import '../../../../core/global_bloc/app_bloc.dart';
import '../../../../core/widget/my_button_not_progress.dart';
import '../../../../core/widget/my_image.dart';
import '../../../../core/widget/text_field/design/child/name_text_field.dart';
import '../../bloc/contact_us_bloc.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key, required this.orderNumber}) : super(key: key);
  final String orderNumber;

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
        scaffold: Container(
          padding: const EdgeInsets.all(30),
          color: Colors.white,
          child: BlocProvider.value(
            value: ContactUsBloc(),
            child: BlocBuilder<ContactUsBloc, ContactUsState>(
              builder: (context, state) {
                ContactUsBloc controller = context.read<ContactUsBloc>();
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tr('send_success'),
                      style: const TextStyle(
                        fontSize: 22,
                        color: darkGrey,
                      ),
                    ),
                    Text(
                      '${tr('order_number')}: $orderNumber',
                      style: const TextStyle(
                        fontSize: 17,
                        color: grey,
                      ),
                    ),
                    const Icon(
                      CupertinoIcons.checkmark_alt_circle,
                      size: 106,
                      color: Colors.green,
                    )
                  ],
                );
              },
            ),
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
}
