import 'package:flutter/material.dart';
import 'package:sample_store/core/string.dart';
import 'package:sample_store/core/widget/textfield.dart';
import 'package:sample_store/module/login/data/authentication_Api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../../../core/thems/colors.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  ///----------get instance of authentication repository
  AuthenticationRepository authenticationRepository =
      AuthenticationRepository();

  ///----------scaffold key to show snackbar
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  ///--------textfield controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 4,
            ),
            AppTextField(
              controller: emailController,
            ),
            const SizedBox(
              height: 20,
            ),
            AppTextField(
              password: true,
              controller: passwordController,
            ),
            const Spacer(),

            ///----------login button
            Align(
              alignment: Alignment.center,
              child: Container(
                width: MediaQuery.of(context).size.width - 10,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    border: Border.all(color: AppColors.iconColor, width: 1),
                    borderRadius: BorderRadius.circular(10)),
                child: InkWell(
                  onTap: () async {
                    try {
                      Map response = json.decode(
                          await authenticationRepository.login(
                              emailController.text, passwordController.text));
                      if (response.containsKey('message')) {
                        _scaffoldKey.currentState?.showSnackBar(SnackBar(
                            content: Text(response['message'].toString())));
                      } else {
                        (await SharedPreferences.getInstance())
                            .setString(AppString.token, response['token']);
                        Navigator.pushNamed(context, '/');
                      }
                    } catch (_) {
                      _scaffoldKey.currentState?.showSnackBar(const SnackBar(
                          content:
                              Text('Please Enter Correct Email/Password')));
                    }
                  },
                  child: const Text(
                    'Login',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            const Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}
