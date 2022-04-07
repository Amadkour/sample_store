import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_store/core/string.dart';
import 'package:sample_store/module/card/data/repository/repository.dart';
import 'package:sample_store/module/category/bloc/category_bloc.dart';
import 'package:sample_store/module/category/bloc/category_event.dart';
import 'package:sample_store/module/category/data/repository/category_Api.dart';
import 'package:sample_store/module/login/data/authentication_Api.dart';
import 'package:sample_store/module/profile/bloc/profile_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'module/card/bloc/cart/card_bloc.dart';
import 'module/card/bloc/cart/card_event.dart';
import 'module/dashbord/ui/pages/dashbord.dart';
import 'module/login/ui/login.dart';
import 'module/product/bloc/product_bloc.dart';
import 'module/product/bloc/product_event.dart';
import 'module/product/data/repository/productApi.dart';
import 'module/profile/bloc/profile_event.dart';
bool type=false;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getType();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  CartRepository cartRepository = CartRepository();

  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) =>
                CartBloc(
                  cartRepository: cartRepository,
                )
                  ..add(CartStarted()),
              ),
              BlocProvider(
                create: (_) =>
                ProductBloc(
                  productRepository: ProductRepository(),
                )
                  ..add(FetchProducts()),
              ),
              BlocProvider(
                create: (_) =>
                ProfileBloc(profileRepository: AuthenticationRepository()

                )
                  ..add(FetchProfile()),
              ),
              BlocProvider(
                create: (_) =>
                CategoryBloc(categoryRepository: CategoryRepository(),
                )
                  ..add(FetchCategories()),
              )
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Bloc Shopping Cart',
              initialRoute: type ? '/' : '/login',
              routes: {
                '/': (_) => const DashboardView(),
                '/login': (_) => const LoginView(),
              },
            )));
  }
}
  getType()  async {type=(await SharedPreferences.getInstance()).containsKey(AppString.token);}





