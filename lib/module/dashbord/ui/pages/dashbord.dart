import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_store/core/string.dart';
import 'package:sample_store/core/thems/colors.dart';
import 'package:sample_store/module/card/bloc/cart/card_bloc.dart';
import '../../../../core/widget/custom_appbar.dart';
import '../../../card/bloc/cart/card_state.dart';
import '../../../card/ui/pages/view.dart';
import '../../../category/ui/pages/category.dart';
import '../../../product/ui/pages/product.dart';
import '../../../profile/ui/pages/profile.dart';
import '../../bloc/tab_index_bloc.dart';
import '../../bloc/tab_index_event.dart';
import '../../bloc/tab_index_state.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView>
    with TickerProviderStateMixin {
  @override
  void initState() {
    TabIndexBloc.control = TabController(initialIndex: 0, length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TabIndexBloc(),
      child:
          BlocBuilder<TabIndexBloc, TabIndexState>(builder: (context, state) {
        TabIndexBloc.control.addListener(() {
          context
              .read<TabIndexBloc>()
              .add(ChangeIndex(TabIndexBloc.control.index));
        });
        return Scaffold(
          appBar: CustomAppbar(
            title: getTitle(state.tabIndex),
          ),
          body: SafeArea(
            child: TabBarView(
                dragStartBehavior: DragStartBehavior.down,
                controller: TabIndexBloc.control..index = state.tabIndex,
                children: const [
                  ProductView(),
                  CategoryView(),
                  ProfileView(),
                  CartView(),
                ]),
          ),
          bottomNavigationBar: Container(
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: AppColors.iconColor,
                    blurRadius: 10,
                  ),
                ],
              ),
              ///---------bottom navigator
              child: BottomNavigationBar(
                  unselectedItemColor: Colors.black,
                  selectedItemColor: Colors.redAccent,
                  onTap: (index) {
                    context.read<TabIndexBloc>().add(ChangeIndex(index));
                  },
                  currentIndex: TabIndexBloc.control.index,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Colors.white,
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.apartment,
                          color: state.tabIndex == 0
                              ? AppColors.primaryColor
                              : Colors.grey,
                          size: 25,
                        ),
                        label: AppPagesTitle.product),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.category,
                          color: state.tabIndex == 1
                              ? AppColors.primaryColor
                              : Colors.grey,
                          size: 25,
                        ),
                        label: AppPagesTitle.category),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.person,
                          color: state.tabIndex == 2
                              ? AppColors.primaryColor
                              : Colors.grey,
                          size: 25,
                        ),
                        label: AppPagesTitle.profile),
                    BottomNavigationBarItem(
                        icon: Stack(children: <Widget>[
                          Icon(
                            Icons.add_shopping_cart_rounded,
                            color: state.tabIndex == 3
                                ? AppColors.primaryColor
                                : Colors.grey,
                            size: 25,
                          ),
                          Positioned(
                            child: BlocBuilder<CartBloc, CartState>(
                                builder: (context, state) {
                              if (state is CartLoaded &&
                                  state.cart.items.isNotEmpty) {
                                return Container(
                                  padding: EdgeInsets.all(3),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.red,
                                  ),
                                  child: Text(
                                    state.cart.items.length.toString(),
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            }),
                            top: -3,
                            right: 0,
                          ),
                        ]),
                        label: AppPagesTitle.card),
                  ])),
          // ),
        );
      }),
    );
  }
///-------------tab Appbar title
  String getTitle(int tabIndex) {
    switch (tabIndex) {
      case 0:
        return AppPagesTitle.product;
      case 1:
        return AppPagesTitle.category;
      case 2:
        return AppPagesTitle.profile;
      case 3:
        return AppPagesTitle.card;
      default:
        return AppPagesTitle.product;
    }
  }
}
