import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../global_bloc/app_bloc.dart';
import '../../validator/child/email_validator.dart';
import '../parent/parent.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController emailController;
  final FocusNode focusNode;
  String? emailControllerError;
  final double? border;
  EmailTextField({Key? key, required this.emailController, required this.focusNode,  this.emailControllerError, this.border}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ParentTextField(
        onchange: (val) {
          emailControllerError = '';
        },
      border: border,
       controller: emailController,
      keyboardType: TextInputType.emailAddress,
        name:tr("Type Email"),
        validator:EmailValidator().getValidation(),
        focusNode: focusNode,
        title: tr("E-mail Address"),
        // prefix: const Icon(Icons.mail_outlined),
        error: emailControllerError,
      fillColor: Colors.white,

    );
  }
}
