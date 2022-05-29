import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wego_clone/app_colors.dart';
import 'package:wego_clone/components/default_text_form_field.dart';
import 'package:wego_clone/components/departure/departure_item.dart';
import 'package:wego_clone/components/flight/flight_item.dart';
import 'package:wego_clone/state-management/provider.dart';
import 'package:wego_clone/translations/locale_keys.g.dart';

class FindDestinationScreen extends StatelessWidget {
  FindDestinationScreen({Key? key, required this.isPickup}) : super(key: key);
  final bool isPickup;
  List<String> destinations = [
    'Cairo',
    'Alexandria',
    'Banha',
  ];
  List<String> locations = [
    'Cairo, Egypt',
    'Alexandria, Egypt',
    'Banha, Egypt',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: 70.0,
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: DefaultTextFormField(
                        icon: Icons.search_outlined,
                        hint: LocaleKeys.enterDestination.tr(),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        LocaleKeys.cancel.tr(),
                        style: TextStyle(
                          color: AppColors.defaultGreyColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(10.0),
                  itemBuilder: (context, index) {
                    return FlightItem(
                      icon: Icons.location_on_outlined,
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            destinations[index],
                            style: TextStyle(
                              color: AppColors.defaultGreyColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 18.0,
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            locations[index],
                            style: TextStyle(
                              color: AppColors.defaultShadowedGreyColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        isPickup
                            ? context
                                .read<TransportProvider>()
                                .setPickupLocation(
                                    location: destinations[index])
                            : context
                                .read<TransportProvider>()
                                .setdropoffLocation(
                                    location: destinations[index]);
                        Navigator.pop(context);
                      },
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 5.0,
                    );
                  },
                  itemCount: destinations.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
