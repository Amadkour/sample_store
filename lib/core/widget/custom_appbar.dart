import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppbar extends StatefulWidget implements PreferredSizeWidget {
  final String? title;
  final Color? backgroundColor;
  final bool hasBackButton;
  final Widget? widget;
  final Color backIconColor;
  final SystemUiOverlayStyle systemOverlayStyle;
  @override
  final Size preferredSize;

  const CustomAppbar(
      {Key? key,
      this.backIconColor = const Color(0xff20926B),
      this.title,
      this.backgroundColor,
      this.systemOverlayStyle = SystemUiOverlayStyle.dark,
      this.hasBackButton = true,
      this.widget})
      : preferredSize = const Size.fromHeight(80),
        super(key: key);

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Container(
        decoration: BoxDecoration(
            color: widget.backgroundColor ?? Theme.of(context).primaryColor,
            image: DecorationImage(
                image: Image.asset('assets/images/appbar.png').image, fit: BoxFit.cover)),
        child: widget.widget ??
            Text(
              widget.title ?? '',
              style: TextStyle(fontSize: 23, color: Theme.of(context).primaryColor),
            ),
      ),
    );
  }
}
