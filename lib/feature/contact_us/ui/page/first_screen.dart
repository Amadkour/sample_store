import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:sample_store/core/widget/base_page.dart';
import 'package:sample_store/core/widget/text_field/design/child/email_text_field.dart';
import 'package:sample_store/core/widget/text_field/design/child/phone_text_field.dart';
import 'package:sample_store/feature/contact_us/ui/page/second_screen.dart';

import '../../../../core/global_bloc/app_bloc.dart';
import '../../../../core/widget/my_button_not_progress.dart';
import '../../../../core/widget/my_image.dart';
import '../../../../core/widget/text_field/design/child/name_text_field.dart';
import '../../bloc/contact_us_bloc.dart';

class ContactUsFirst extends StatelessWidget {
  ContactUsFirst({Key? key}) : super(key: key);
  final GlobalKey<FormState> keyValidation = GlobalKey<FormState>();

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
                return KeyboardActions(
                  config: controller.buildConfig1(context),
                  child:Form(
                    key: keyValidation,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tr('contact_us_screen'),
                            style: const TextStyle(color: Color(0xff0F1737), fontSize: 22),
                          ),
                          NameTextField(
                            nameController: controller.firstController,
                            focusNode: controller.firstFocus,
                            hint: 'first_name',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          NameTextField(
                            nameController: controller.secondController,
                            focusNode: controller.secondFocus,
                            hint: 'second_name',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          EmailTextField(
                            emailController: controller.emailController,
                            focusNode: controller.emailFocus,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          PhoneTextField(
                              phoneController: controller.phoneController,
                              focusNode: controller.phoneFocus),
                          const SizedBox(
                            height: 20,
                          ),
                          MyButtonNotProgress(
                            onPressed: () {
                              if (keyValidation.currentState!.validate()) {
                                pushNewScreen(context,
                                    screen: ContactUsSecond(
                                      firstName: controller.firstController.text,
                                      lastName: controller.secondController.text,
                                      email: controller.emailController.text,
                                      phone: controller.phoneController.text,
                                    ),
                                    withNavBar: false);
                              }
                            },
                            text: tr('continue'),
                          )
                        ],
                      ),
                    ),
                  ),
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
