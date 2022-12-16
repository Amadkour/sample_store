import 'package:flutter/material.dart';
import '../../validator/child/empty_validation.dart';
import '../parent/parent.dart';

class SymptomsTextField extends StatelessWidget {
  final TextEditingController nameController;
  String nameControllerError;
  final FocusNode focusNode;

  SymptomsTextField(
      {Key? key,
      required this.nameController,
      required this.focusNode,
      required this.nameControllerError}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ParentTextField(
        onchange:(val) {
          nameControllerError = '';
        },
      custom: true,
        controller: nameController,
        keyboardType: TextInputType.name,
        name: '',
       validator: EmptyValidator().getValidationWithParameter('name_empty'),
        focusNode: focusNode,
      multiLine: 4,
        title: '',
        error: nameControllerError,
      border: 4,
      fillColor: Colors.white,

    );
  }
}
