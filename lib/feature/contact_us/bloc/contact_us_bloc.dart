import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'contact_us_event.dart';
part 'contact_us_state.dart';

class ContactUsBloc extends Bloc<ContactUsEvent, ContactUsState> {
  TextEditingController firstController=TextEditingController();
  TextEditingController secondController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  FocusNode firstFocus=FocusNode();
  FocusNode secondFocus=FocusNode();
  FocusNode emailFocus=FocusNode();
  FocusNode phoneFocus=FocusNode();
  ContactUsBloc() : super(ContactUsInitial()) {
    on<ContactUsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
