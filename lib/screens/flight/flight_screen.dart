import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wego_clone/app_colors.dart';
import 'package:wego_clone/screens/flight/one_way_screen/one_way_screen.dart';
import 'package:wego_clone/screens/flight/round_trip/round_trip_screen.dart';
import 'package:wego_clone/translations/locale_keys.g.dart';

class FlightScreen extends StatelessWidget {
  const FlightScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.defaultThemeColor,
        elevation: 0.0,
        title: Text(LocaleKeys.flight.tr()),
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
      body: DefaultTabController(
        length: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 280.0,
              child: TabBar(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                labelPadding: EdgeInsets.zero,
                unselectedLabelColor: Colors.grey,
                labelColor: AppColors.defaultThemeColor,
                indicatorColor: AppColors.defaultThemeColor,
                indicatorPadding: EdgeInsets.zero,
                indicatorWeight: 4.0,
                tabs: [
                  Tab(
                    text: LocaleKeys.oneWay.tr(),
                  ),
                  Tab(
                    text: LocaleKeys.roundTrip.tr(),
                  ),
                ],
              ),
            ),
            Divider(
              height: 1.0,
              thickness: 1.0,
              color: Colors.grey[150],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  OneWayScreen(),
                  RoundTripScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
