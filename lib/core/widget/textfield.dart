import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample_store/core/thems/colors.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({Key? key, this.password = false, this.controller})
      : super(key: key);
  final bool password;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ///-------------title
        Text(
          password ? 'Password' : 'Email',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: AppColors.iconColor, fontSize: 14),
        ),
        const SizedBox(
          height: 7,
        ),

        ///-------------textfield

        TextFormField(
          controller: controller,
          scrollPadding: const EdgeInsets.all(2),
          obscureText: password,
          keyboardType: password
              ? TextInputType.visiblePassword
              : TextInputType.emailAddress,
          style: const TextStyle(
            fontSize: 16,
            fontFamily: 'Light',
          ),
          textAlignVertical: TextAlignVertical.center,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            errorStyle: const TextStyle(fontSize: 14, fontFamily: 'SemiBold'),
            isDense: false,
            hintText: password ? 'Enter Your Password' : 'Enter Your Email',
            hintStyle: TextStyle(
              color: AppColors.iconColor,
              fontSize: 16,
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          ),
        ),
      ],
    );
  }
}
