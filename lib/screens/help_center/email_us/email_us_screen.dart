import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wego_clone/components/default_button.dart';
import 'package:wego_clone/components/default_text_form_field.dart';
import 'package:wego_clone/translations/locale_keys.g.dart';

import '../../../app_colors.dart';

class EmailUsScreen extends StatelessWidget {
  const EmailUsScreen({Key? key}) : super(key: key);

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
          LocaleKeys.emailUs.tr(),
          style: TextStyle(
            color: AppColors.defaultGreyColor,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 10.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              DefaultTextFormField(
                hint: LocaleKeys.leaveFeedback.tr(),
                maxLines: 6,
              ),
              const SizedBox(
                height: 20.0,
              ),
              DefaultTextFormField(
                hint: LocaleKeys.emailAddress.tr(),
                icon: Icons.mail_outline,
              ),
              const SizedBox(
                height: 30.0,
              ),
              DefaultButton(
                text: LocaleKeys.send.tr(),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
