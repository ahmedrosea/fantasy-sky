import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wego_clone/app_colors.dart';
import 'package:wego_clone/state-management/provider.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:wego_clone/translations/locale_keys.g.dart';

class Languages extends StatelessWidget {
  const Languages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String language = context.watch<AccountProvider>().language;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.defaultThemeColor,
        elevation: 0.4,
        title: Text(
          LocaleKeys.language.tr(),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
          child: Column(
            children: [
              const Divider(
                thickness: 1,
              ),
              InkWell(
                onTap: () async {
                  context
                      .read<AccountProvider>()
                      .changeLanguage(languageCode: 'en', context: context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'English',
                        style: TextStyle(
                          color: AppColors.defaultGreyColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      context.locale == const Locale('en')
                          ? Icon(
                              Icons.check,
                              color: AppColors.defaultThemeColor,
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ),
              const Divider(
                thickness: 1,
              ),
              InkWell(
                onTap: () async {
                  context
                      .read<AccountProvider>()
                      .changeLanguage(languageCode: 'ar', context: context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'العربية',
                        style: TextStyle(
                          color: AppColors.defaultGreyColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      context.locale == const Locale('ar')
                          ? Icon(
                              Icons.check,
                              color: AppColors.defaultThemeColor,
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ),
              const Divider(
                thickness: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
