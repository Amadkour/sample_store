import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:sample_store/core/widget/base_page.dart';
import 'package:sample_store/core/widget/text_field/design/child/email_text_field.dart';
import 'package:sample_store/core/widget/text_field/design/child/phone_text_field.dart';
import 'package:sample_store/core/widget/text_field/design/child/symptoms_text_field.dart';

import '../../../../core/global_bloc/app_bloc.dart';
import '../../../../core/widget/my_button_not_progress.dart';
import '../../../../core/widget/my_image.dart';
import '../../../../core/widget/text_field/design/child/pationt_name_text_field.dart';
import '../../../../core/widget/text_field/validator/child/image_field.dart';
import '../../../../core/widget/text_field/validator/child/message_type.dart';
import '../../bloc/contact_us_bloc.dart';

class ContactUsSecond extends StatelessWidget {
  const ContactUsSecond(
      {Key? key,
      required this.firstName,
      required this.lastName,
      required this.phone,
      required this.email})
      : super(key: key);
  final String firstName;
  final String lastName;
  final String phone;
  final String email;

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
                return Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tr('contact_us'),
                        style: const TextStyle(color: Color(0xff0F1737), fontSize: 22),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      NameTextField(
                        nameController: controller.messageAddressController,
                        focusNode: controller.messageAddressFocus,
                        hint: 'message_title',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MessageType(
                        items: controller.messageTypes,
                        selectedItem: controller.messageType,
                        onChange: controller.onChangeType,
                      ),

                      ContentTextField(
                        contentController: controller.messageContentController,
                        focusNode: controller.messageContentFocus,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ImageWidget(
                        file: controller.image,
                        onChange: controller.onChangeImage,
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      state is MessageSending?
                      const Center(
                        child: CircularProgressIndicator(),
                      ):
                      MyButtonNotProgress(
                        onPressed: () async {
                          await controller.onConfirm(context,
                              firstName: firstName, lastName: lastName, email: email, phone: phone);
                          // print(m);
                          // pushNewScreen(context, screen: ContactUsFirst(), withNavBar: false);
                        },
                        text: 'Continue',
                      )

                    ],
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
