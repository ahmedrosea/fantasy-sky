import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wego_clone/components/hotels/location/location_item.dart';
import 'package:wego_clone/state-management/provider.dart';
import 'package:wego_clone/translations/locale_keys.g.dart';
import '../../../app_colors.dart';
import '../../../components/departure/departure_item.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.defaultThemeColor,
        elevation: 0.0,
        title: Text(LocaleKeys.location.tr()),
        centerTitle: true,
      ),
      body: Align(
        alignment: Alignment.topLeft,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 20.0),
          padding: const EdgeInsets.only(top: 10.0, left: 10.0),
          height: 250.0,
          child: ListView(
            children: [
              Text(
                LocaleKeys.nearestCities.tr(),
                style: TextStyle(
                  color: AppColors.defaultShadowedGreyColor,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              LocationItem(
                cardTitle: 'Cairo',
                onPressed: () {
                  context.read<HotelsProvider>().setLocation('Cairo');
                  Navigator.pop(context);
                },
                cardIcon: Icon(
                  Icons.location_on,
                  size: 26.0,
                  color: Colors.grey.shade600,
                ),
                cardPlace: 'Egypt',
              ),
              LocationItem(
                cardTitle: 'Giza',
                onPressed: () {
                  context.read<HotelsProvider>().setLocation('Giza');
                  Navigator.pop(context);
                },
                cardIcon: Icon(
                  Icons.location_on,
                  size: 26.0,
                  color: Colors.grey.shade600,
                ),
                cardPlace: 'Egypt',
              ),
              LocationItem(
                cardTitle: 'Alexandria',
                onPressed: () {
                  context.read<HotelsProvider>().setLocation('Alexandria');
                  Navigator.pop(context);
                },
                cardIcon: Icon(
                  Icons.location_on,
                  size: 26.0,
                  color: Colors.grey.shade600,
                ),
                cardPlace: 'Egypt',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
