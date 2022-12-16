import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:sample_store/core/global_bloc/app_bloc.dart';
import 'package:sample_store/core/widget/my_image.dart';

import '../../bloc/more_bloc.dart';

class MorePage extends StatelessWidget {
  const MorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: BlocProvider(
          create: (context) => MoreBloc(),
          child: BlocBuilder<MoreBloc, MoreState>(
            builder: (context, state) {
              MoreBloc controller=context.read<MoreBloc>();
              return Container(
                color: Theme.of(context).primaryColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Align(
                      alignment: Alignment.centerRight,
                      child:  Padding(
                        padding: EdgeInsets.all(20.0),
                        child: MyImage(
                          url: 'assets/images/logo.png',
                          height: 55,
                          width: 55,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                   ...List.generate(controller.headerTabs.length, (index) =>
                   InkWell(
                     child: Row(
                       children: [
                         Container(
                           height: 35,
                           width: 2,
                           color: controller.headerTabs[index].color,
                         ),
                         const SizedBox(width: 20,),
                         Text(
                            tr(controller.headerTabs[index].tab),
                           style: const TextStyle(
                             fontSize: 20,
                             color: Colors.white
                           ),
                         )
                       ],
                     ),
                     onTap: ()=>pushNewScreen(context, screen: controller.headerTabs[index]
                         .content,withNavBar: false),
                   )
                   ),
                    ...List.generate(controller.footerTabs.length, (index) =>
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 50,
                        padding: const EdgeInsets.all(8.0),
                        child: MyImage(
                          url:controller.footerTabs[index] ,
                          height: 20,
                          width: 20,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                    ),
                    const SizedBox(height: 50,)
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
