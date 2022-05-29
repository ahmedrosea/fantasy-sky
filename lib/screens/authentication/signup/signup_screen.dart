import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wego_clone/translations/locale_keys.g.dart';

import '../../../app_colors.dart';
import '../../../components/default_button.dart';
import '../../../components/default_text_form_field.dart';
import '../../../state-management/provider.dart';

class Signup extends StatelessWidget {
  Signup({Key? key}) : super(key: key);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    LocaleKeys.haveAccount.tr(),
                    style: TextStyle(
                      color: AppColors.defaultGreyColor,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      context
                          .read<AuthenticationProvider>()
                          .authenticationToggle();
                    },
                    child: Text(
                      LocaleKeys.login.tr(),
                      style: const TextStyle(
                        color: Color.fromARGB(255, 255, 169, 41),
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30.0,
              ),
              DefaultTextFormField(
                hint: LocaleKeys.emailAddress.tr(),
                icon: Icons.mail_outline_outlined,
                errorText: LocaleKeys.emailCantBeEmpty.tr(),
              ),
              const SizedBox(
                height: 15.0,
              ),
              DefaultTextFormField(
                hint: LocaleKeys.password.tr(),
                icon: Icons.lock_outline_rounded,
                errorText: LocaleKeys.passwordCantBeEmpty.tr(),
                isPassword: true,
              ),
              const SizedBox(
                height: 15.0,
              ),
              DefaultTextFormField(
                hint: LocaleKeys.repeatPassword.tr(),
                icon: Icons.lock_outline_rounded,
                errorText: LocaleKeys.repeatPasswordCantBeEmpty.tr(),
                isPassword: true,
              ),
              const SizedBox(
                height: 30.0,
              ),
              DefaultButton(
                text: LocaleKeys.signUp.tr(),
                onPressed: () {
                  formKey.currentState!.validate();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
