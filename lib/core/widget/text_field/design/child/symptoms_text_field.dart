import 'package:flutter/material.dart';
import '../../../../global_bloc/app_bloc.dart';
import '../../validator/child/empty_validation.dart';
import '../parent/parent.dart';

class ContentTextField extends StatelessWidget {
  final TextEditingController contentController;
  late String? contentControllerError;
  final FocusNode focusNode;

   ContentTextField(
      {Key? key,
      required this.contentController,
      required this.focusNode,
      this.contentControllerError})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ParentTextField(
      onchange: (val) {
        contentControllerError = '';
      },
      controller: contentController,
      keyboardType: TextInputType.name,
      name: tr('message_content'),
      title: tr('message_content'),
      validator: EmptyValidator().getValidationWithParameter('name_empty'),
      focusNode: focusNode,
      multiLine: 4,
      error: contentControllerError,
      border: 4,
      fillColor: Colors.white,
    );
  }
}
