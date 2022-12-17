import 'package:flutter/material.dart';
import '../../../../global_bloc/app_bloc.dart';
import '../../validator/child/empty_validation.dart';
import '../parent/parent.dart';

class NameTextField extends StatelessWidget {
  final TextEditingController nameController;
  String? nameControllerError;
  final String hint;
  final FocusNode focusNode;

  NameTextField(
      {Key? key,
      required this.nameController,
      required this.focusNode,
      this.nameControllerError,
      required this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ParentTextField(
      onchange: (val) {
        nameControllerError = '';
      },
      controller: nameController,
      keyboardType: TextInputType.name,
      name: tr(hint),
      validator: EmptyValidator().getValidationWithParameter('name_empty'),
      focusNode: focusNode,
      title: tr(hint),
      error: nameControllerError,
      border: 5,
      fillColor: Colors.white,
    );
  }
}
