import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wego_clone/app_colors.dart';
import 'package:wego_clone/screens/account_screen.dart';
import 'package:wego_clone/screens/home_screen.dart';
import 'package:wego_clone/translations/locale_keys.g.dart';

class DefaultNavbar extends StatefulWidget {
  DefaultNavbar({Key? key}) : super(key: key);

  @override
  State<DefaultNavbar> createState() => _DefaultNavbarState();
}

class _DefaultNavbarState extends State<DefaultNavbar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentIndex == 0 ? const HomeScreen() : const AccountScreen(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: AppColors.defaultThemeColor,
        iconSize: 28.0,
        unselectedFontSize: 13.0,
        selectedFontSize: 13.0,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.home_outlined,
            ),
            label: LocaleKeys.home.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(CupertinoIcons.person_fill),
            label: LocaleKeys.account.tr(),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

//Icons.account_box_outlined