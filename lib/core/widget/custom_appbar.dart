import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sample_store/core/thems/colors.dart';

class CustomAppbar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final bool hasBackButton;
  final Widget? widget;
  final Color backIconColor;
  final SystemUiOverlayStyle systemOverlayStyle;
  @override
  final Size preferredSize;

  const CustomAppbar(
      {Key? key,
      this.backIconColor = const Color(0xff20926B),
      required this.title,
       this.backgroundColor=Colors.transparent,
      this.systemOverlayStyle = SystemUiOverlayStyle.dark,
      this.hasBackButton = true,
      this.widget})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      centerTitle: true,
      systemOverlayStyle: widget.systemOverlayStyle,
      title:
          Text(
            widget.title,
            style:  TextStyle(fontSize: 23,color: AppColors.iconColor),
          ),
      backgroundColor: widget.backgroundColor,
    );
  }
}
