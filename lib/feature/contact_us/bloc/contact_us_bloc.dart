import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:keyboard_actions/keyboard_actions_config.dart';
import 'package:keyboard_actions/keyboard_actions_item.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:sample_store/core/widget/message.dart';
import 'package:sample_store/feature/contact_us/provider/repo/contact_repo.dart';

import '../ui/page/first_screen.dart';
import '../ui/page/success_screen.dart';

part 'contact_us_event.dart';

part 'contact_us_state.dart';

class ContactUsBloc extends Bloc<ContactUsEvent, ContactUsState> {
  TextEditingController firstController = TextEditingController();
  TextEditingController secondController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController messageAddressController = TextEditingController();
  TextEditingController messageContentController = TextEditingController();
  FocusNode firstFocus = FocusNode();
  FocusNode secondFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode phoneFocus = FocusNode();
  FocusNode messageAddressFocus = FocusNode();
  FocusNode messageContentFocus = FocusNode();

  XFile? image;

  onChangeImage() async {
    image = await ImagePicker.platform.getImage(
      source: ImageSource.gallery,
    );
    add(ImageChange());
  }

  Future<void> onConfirm(context, {
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
  }) async {
    add(MessageSend());
    (await ContactRepo.instance.sendMessage(
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      email: email,
      messageAddress: messageAddressController.text,
      messageType: messageType ?? '',
      messageContent: messageContentController.text,
      imageBase64: image == null
          ? null
          : base64Encode(
        await image!.readAsBytes(),
      ),
    ))
        .fold((l) {
      add(MessageConfirm());
      MyToast(l.errorMessage);
      // l.errorMessage;
    }, (r) {
      add(MessageConfirm());
      pushNewScreen(context,
          screen: SuccessScreen(
            orderNumber: r,
          ));
      // return r;
    });
  }

  List<String> messageTypes = ['type_a', 'type_b', 'type_c'];
  String? messageType = 'type_a';

  void onChangeType(String? v) {
    messageType = v;
    add(MessageTypeChange());
  }

  ContactUsBloc() : super(ContactUsInitial()) {
    on<ContactUsEvent>((event, emit) {
      if (event is ImageChange) {
        emit(ImageChanged());
      } else if (event is MessageTypeChange) {
        emit(MessageTypeChanged());
      } else if (event is MessageSend) {
        emit(MessageSending());
      } else if (event is MessageConfirm) {
        emit(MessageSent());
      }
    });
  }

  KeyboardActionsConfig buildConfig1(BuildContext context) {
    return KeyboardActionsConfig(
      defaultDoneWidget: const AutoSizeText(
        'Done',
        minFontSize: 9,
        maxFontSize: 14,
        style: TextStyle(
          fontSize: 14,
          color: Colors.black
        ),
      ),
        keyboardBarColor: Colors.grey[200],
        actions:

        ///-----------------keyboard config -----> [by phone]
        <KeyboardActionsItem>[
          KeyboardActionsItem(
            focusNode: firstFocus,
          ),
          KeyboardActionsItem(
            focusNode: secondFocus,
          ),
          KeyboardActionsItem(
            focusNode: emailFocus,
          ),
          KeyboardActionsItem(
            focusNode: phoneFocus,
          ),
        ]
    );
  }
  KeyboardActionsConfig buildConfig2(BuildContext context) {
    return KeyboardActionsConfig(
      defaultDoneWidget: const AutoSizeText(
        'Done',
        minFontSize: 9,
        maxFontSize: 14,
        style: TextStyle(
          fontSize: 14,
          color: Colors.black
        ),
      ),
        keyboardBarColor: Colors.grey[200],
        actions:

        ///-----------------keyboard config -----> [by phone]
        <KeyboardActionsItem>[
          KeyboardActionsItem(
            focusNode: messageAddressFocus,
          ),
          KeyboardActionsItem(
            focusNode: messageContentFocus,
          ),
        ]
    );
  }
  }
