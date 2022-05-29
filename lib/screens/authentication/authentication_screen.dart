import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wego_clone/app_colors.dart';
import 'package:wego_clone/screens/authentication/login/login_screen.dart';
import 'package:wego_clone/screens/authentication/signup/signup_screen.dart';
import 'package:wego_clone/state-management/provider.dart';
import 'package:wego_clone/translations/locale_keys.g.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool isLogin = context.watch<AuthenticationProvider>().isLogin;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            context.read<AuthenticationProvider>().setDefault();
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.defaultThemeColor,
          ),
        ),
        title: Text(
          isLogin ? LocaleKeys.login.tr() : LocaleKeys.signUp.tr(),
          style: TextStyle(
            color: AppColors.defaultGreyColor,
          ),
        ),
        centerTitle: true,
      ),
      body: isLogin ? Login() : Signup(),
    );
  }
}
