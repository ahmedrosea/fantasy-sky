import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wego_clone/screens/help_center/email_us/email_us_screen.dart';
import 'package:wego_clone/translations/locale_keys.g.dart';

import '../../app_colors.dart';
import '../../components/account/account_item.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.defaultThemeColor,
          ),
        ),
        title: Text(
          LocaleKeys.helpCenter.tr(),
          style: TextStyle(
            color: AppColors.defaultGreyColor,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Container(
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 8.0,
          ),
          color: Colors.white,
          child: Column(
            children: [
              AccountItem(
                title: LocaleKeys.faqs.tr(),
                icon: Icons.question_mark_outlined,
                onPressed: () {},
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50.0),
                child: Divider(
                  height: 1.0,
                  thickness: 0.5,
                  color: Colors.grey.shade200,
                ),
              ),
              AccountItem(
                title: LocaleKeys.emailUs.tr(),
                icon: Icons.email_outlined,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EmailUsScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
