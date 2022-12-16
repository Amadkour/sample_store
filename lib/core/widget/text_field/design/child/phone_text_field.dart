import 'package:flutter/material.dart';

import '../../../../global_bloc/app_bloc.dart';
import '../../validator/child/phone_validator.dart';
import '../parent/parent.dart';

class PhoneTextField extends StatelessWidget {
  final TextEditingController phoneController;
  String? phoneControllerError;
  final FocusNode focusNode;
  final double? border;

  PhoneTextField(
      {Key? key,
      required this.phoneController,
       this.phoneControllerError,
      required this.focusNode, this.border})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ParentTextField(
      onchange: (val) {
        phoneControllerError = '';
      },
      controller: phoneController,
      name: tr("Phone number"),
      title: tr("Phone number"),
      keyboardType: TextInputType.phone,
      labelColor: const Color(0xff011E06),
      focusNode: focusNode,
      border: border,
      error: phoneControllerError,
      validator: PhoneValidator().getValidation(),
      fillColor: Colors.white,

    );
  }
}
