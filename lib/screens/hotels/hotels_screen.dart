import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wego_clone/components/hotels/hotels_item.dart';
import 'package:wego_clone/screens/hotels/guests/guests_screen.dart';
import 'package:wego_clone/screens/hotels/location/location_screen.dart';
import 'package:wego_clone/translations/locale_keys.g.dart';

import '../../app_colors.dart';
import '../../components/default_button.dart';
import '../../components/default_check_box.dart';
import '../../state-management/provider.dart';
import 'hotels_search/hotels_search_screen.dart';

class HotelsScreen extends StatelessWidget {
  const HotelsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String checkinDate = context.watch<HotelsProvider>().checkinDate == 'Select'
        ? LocaleKeys.select.tr()
        : context.watch<HotelsProvider>().checkinDate;
    String checkoutDate =
        context.watch<HotelsProvider>().checkoutDate == 'Select'
            ? LocaleKeys.select.tr()
            : context.watch<HotelsProvider>().checkoutDate;
    int adultNumber = context.watch<HotelsProvider>().adultNumber;
    int childNumber = context.watch<HotelsProvider>().childNumber;
    String hotelLocation =
        context.watch<HotelsProvider>().location == 'Choose Location'
            ? LocaleKeys.chooseLocation.tr()
            : context.watch<HotelsProvider>().location;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.defaultThemeColor,
        elevation: 0.0,
        title: Text(LocaleKeys.hotels.tr()),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.history_rounded,
                size: 34.0,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            HotelsItem(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LocationScreen(),
                  ),
                );
              },
              icon: Icons.map_sharp,
              content: Text(
                hotelLocation,
                style: TextStyle(
                  fontSize: 15.0,
                  color: AppColors.defaultGreyColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: HotelsItem(
                    onPressed: () async {
                      context.read<HotelsProvider>().setCheckinDate(context);
                    },
                    icon: Icons.calendar_month_rounded,
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          LocaleKeys.checkInDate.tr(),
                          style: TextStyle(
                            color: AppColors.defaultShadowedGreyColor,
                            fontSize: 13.0,
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          checkinDate,
                          style: TextStyle(
                            color: AppColors.defaultGreyColor,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Expanded(
                  child: HotelsItem(
                    onPressed: () async {
                      context.read<HotelsProvider>().setCheckoutDate(context);
                    },
                    icon: Icons.calendar_month_rounded,
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          LocaleKeys.checkOutDate.tr(),
                          style: TextStyle(
                            color: AppColors.defaultShadowedGreyColor,
                            fontSize: 13.0,
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          checkoutDate,
                          style: TextStyle(
                            color: AppColors.defaultGreyColor,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            HotelsItem(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GuestsScreen(),
                  ),
                );
              },
              icon: Icons.people,
              content: Text(
                '${adultNumber + childNumber} ${LocaleKeys.guests.tr()}',
                style: TextStyle(
                    color: AppColors.defaultGreyColor, fontSize: 16.0),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            DefaultCheckBox(
              checkInfo: LocaleKeys.includeHomes.tr(),
            ),
            const Spacer(),
            DefaultButton(
              text: LocaleKeys.searchHotels.tr(),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HotelsSearchScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
