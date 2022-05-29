import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wego_clone/app_colors.dart';
import 'package:wego_clone/components/account/account_item.dart';
import 'package:wego_clone/components/account/account_item_separator.dart';
import 'package:wego_clone/screens/authentication/authentication_screen.dart';
import 'package:country_picker/country_picker.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:wego_clone/screens/flight/payments/payments_screen.dart';
import 'package:wego_clone/screens/help_center/help_center_screen.dart';
import 'package:wego_clone/screens/languages/languages_screen.dart';
import 'package:wego_clone/state-management/provider.dart';
import 'package:wego_clone/translations/locale_keys.g.dart';
import 'package:restart_app/restart_app.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String region = context.watch<AccountProvider>().region == 'Choose a region'
        ? LocaleKeys.chooseARegion.tr()
        : context.watch<AccountProvider>().region;
    String currency =
        context.watch<AccountProvider>().currency == 'Choose a currency'
            ? LocaleKeys.ChooseACurrency.tr()
            : context.watch<AccountProvider>().currency;
    int selectedCardsNumber =
        context.watch<FlightProvider>().selectedCardsNumber;
    String language = context.watch<AccountProvider>().language;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 90.0,
              color: Colors.white,
              alignment: Alignment.bottomLeft,
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              child: Text(
                LocaleKeys.account.tr(),
                style: TextStyle(
                  color: AppColors.defaultGreyColor,
                  fontSize: 38.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 20.0, right: 8.0),
                    color: Colors.white,
                    child: Column(
                      children: [
                        AccountItem(
                          title: LocaleKeys.login.tr(),
                          icon: Icons.login,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const AuthenticationScreen(),
                              ),
                            );
                          },
                        ),
                        const AccountItemSeparator(),
                        AccountItem(
                          title: LocaleKeys.wallet.tr(),
                          icon: Icons.account_balance_wallet_outlined,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20.0, right: 8.0),
                    color: Colors.white,
                    child: Column(
                      children: [
                        AccountItem(
                          title: LocaleKeys.region.tr(),
                          icon: Icons.flag_outlined,
                          onPressed: () {
                            showCountryPicker(
                              context: context,
                              countryListTheme: CountryListThemeData(
                                flagSize: 25,
                                backgroundColor: Colors.white,
                                textStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.blueGrey,
                                ),
                                bottomSheetHeight:
                                    500, // Optional. Country list modal height
                                //Optional. Sets the border radius for the bottomsheet.
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0),
                                ),
                                inputDecoration: InputDecoration(
                                  hintText: 'Search',
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: AppColors.defaultShadowedGreyColor,
                                  ),
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: const Color(0xFF8C98A8)
                                          .withOpacity(0.2),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.defaultShadowedGreyColor,
                                    ),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.defaultShadowedGreyColor,
                                    ),
                                  ),
                                ),
                              ),
                              onSelect: (Country country) {
                                context
                                    .read<AccountProvider>()
                                    .setRegion(choosedRegion: country.name);
                              },
                            );
                          },
                          extraData: region,
                        ),
                        const AccountItemSeparator(),
                        AccountItem(
                          title: LocaleKeys.currency.tr(),
                          icon: Icons.currency_pound,
                          onPressed: () {
                            showCurrencyPicker(
                              context: context,
                              showFlag: true,
                              showCurrencyName: true,
                              showCurrencyCode: true,
                              onSelect: (Currency currency) {
                                context.read<AccountProvider>().setCurrency(
                                    choosedCurrency: currency.code);
                              },
                            );
                          },
                          extraData: currency,
                        ),
                        const AccountItemSeparator(),
                        AccountItem(
                          title: LocaleKeys.language.tr(),
                          icon: Icons.abc_outlined,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Languages(),
                              ),
                            );
                          },
                          extraData: context.locale == const Locale('en')
                              ? 'English'
                              : 'العربية',
                        ),
                        const AccountItemSeparator(),
                        AccountItem(
                          title: LocaleKeys.paymentTypes.tr(),
                          icon: Icons.credit_card_outlined,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PaymentsScreen(),
                              ),
                            );
                          },
                          extraData:
                              '$selectedCardsNumber ${LocaleKeys.selected.tr()}',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20.0, right: 8.0),
                    color: Colors.white,
                    child: Column(
                      children: [
                        AccountItem(
                          title: LocaleKeys.helpCenter.tr(),
                          icon: Icons.chat_bubble_outline_outlined,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HelpCenterScreen(),
                              ),
                            );
                          },
                        ),
                        const AccountItemSeparator(),
                        AccountItem(
                          title: LocaleKeys.legalInforamtion.tr(),
                          icon: Icons.info_outline,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
