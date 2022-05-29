import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wego_clone/components/hotels/guests/guests_item.dart';
import 'package:wego_clone/state-management/provider.dart';
import 'package:wego_clone/translations/locale_keys.g.dart';

import '../../../app_colors.dart';

class GuestsScreen extends StatelessWidget {
  const GuestsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    int adultNumber = context.watch<HotelsProvider>().adultNumber;
    int childNumber = context.watch<HotelsProvider>().childNumber;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.defaultThemeColor,
        elevation: 0.0,
        title: Text(LocaleKeys.guests.tr()),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            context.read<HotelsProvider>().guestsDataInit();
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: () {
                context.read<HotelsProvider>().setGuestsData();
                context.read<HotelsProvider>().guestsDataInit();
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.check_rounded,
                size: 34.0,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          GuestsItem(
            icon: Icons.man_outlined,
            isFirst: true,
            text: '$adultNumber ${LocaleKeys.adult.tr()}',
            condition: '(>12 years)',
            whenMinusPressed: () {
              context.read<HotelsProvider>().decreaseAdultNumber();
            },
            whenPlusPressed: () {
              context.read<HotelsProvider>().increaseAdultNumber();
            },
          ),
          const SizedBox(
            height: 2.0,
          ),
          GuestsItem(
            icon: Icons.boy_outlined,
            text: '$childNumber ${LocaleKeys.child.tr()}',
            condition: '(2-12 years)',
            whenMinusPressed: () {
              context.read<HotelsProvider>().decreaseChildNumber();
            },
            whenPlusPressed: () {
              context.read<HotelsProvider>().increaseChildNumber();
            },
          ),
        ],
      ),
    );
  }
}
