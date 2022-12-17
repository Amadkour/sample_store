import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_store/core/global_bloc/app_bloc.dart';
import 'package:sample_store/core/widget/custom_appbar.dart';

class MainScaffold extends StatelessWidget {
  final Widget scaffold;
  final Widget? appBarWidget;
  const MainScaffold({
    Key? key,
    required this.scaffold, required this.appBarWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Directionality(
          textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
          child: Scaffold(
            backgroundColor:  Theme.of(context).primaryColor,
            appBar:appBarWidget!=null? CustomAppbar(
              widget:appBarWidget ,
            ):null,
            body: scaffold,
          ),
        );
      },
    );
  }
}
