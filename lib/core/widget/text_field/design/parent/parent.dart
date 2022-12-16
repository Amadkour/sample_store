import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ParentTextField extends StatelessWidget {
  final ValueChanged<String>? onchange;
  final GestureTapCallback? onTab;
  final TextEditingController controller;
  final String? name;
  final Color? fillColor;
  final String? error;
  final bool canArabic = false;
  final Color labelColor;
  final int multiLine;
  final String? title;
  final Widget? suffix;
  final Widget? prefix;
  final double padding;
  final double? border;
  final double? height;
  final double? width;
  final FormFieldValidator<String>? validator;
  final bool readOnly;
  final FocusNode focusNode;
  final bool isPassword;
  final TextInputType? keyboardType;
  final bool? custom;

  const ParentTextField({
    required this.onchange,
    required this.controller,
    this.keyboardType,
    this.name,
    this.custom,
    this.fillColor,
    required this.validator,
    Key? key,
    this.padding = 20.0,
    this.multiLine = 1,
    this.labelColor = const Color(0xff011E06),
    this.title,
    this.suffix,
    this.prefix,
    this.error,
    this.border,
    this.height,
    this.width,
    this.readOnly = false,
    required this.focusNode,
    this.isPassword = false,
    this.onTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: TextFormField(
        scrollPadding: const EdgeInsets.symmetric(vertical: 12),
        minLines: multiLine,
        maxLines: multiLine,
        focusNode: focusNode,
        readOnly: readOnly,
        controller: controller,
        validator: validator,
        inputFormatters: keyboardType == TextInputType.number || keyboardType == TextInputType.phone
            ? [FilteringTextInputFormatter.allow(RegExp("[0-9]"))]
            : null,
        obscureText: isPassword,
        textInputAction: multiLine > 1 ? TextInputAction.done : TextInputAction.next,
        keyboardType: keyboardType,
        style: const TextStyle(fontSize: 16, fontFamily: 'Poppins', fontWeight: FontWeight.w400),
        textAlignVertical: TextAlignVertical.center,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: onchange,
        onTap: onTab,
        decoration: InputDecoration(
          errorText: error == '' || error == null ? null : error,
          errorStyle:
              const TextStyle(fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w400),
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: padding, vertical: 17),
          fillColor: fillColor ?? const Color(0xffEFF0F7),
          filled: true,
          focusColor: Theme.of(context).primaryColor,
          hintText: title,
          errorMaxLines: 1,
          hintMaxLines: 1,
          prefixIcon: prefix,
          alignLabelWithHint: true,
          floatingLabelAlignment: FloatingLabelAlignment.start,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: custom != null ? title : null,
          suffixIcon: suffix,
          labelStyle: TextStyle(
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              color: theme.dividerColor),
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.all(
              Radius.circular(
                10.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
