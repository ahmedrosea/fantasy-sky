import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wego_clone/components/default_text_form_field.dart';
import 'package:wego_clone/components/flight/flight_item.dart';
import 'package:wego_clone/screens/transport/car_search/car_search_screen.dart';
import 'package:wego_clone/screens/transport/find_destination/find_destination_screen.dart';
import 'package:wego_clone/state-management/provider.dart';
import 'package:wego_clone/translations/locale_keys.g.dart';
import '../../app_colors.dart';
import '../../components/default_button.dart';

class TransportScreen extends StatefulWidget {
  TransportScreen({Key? key}) : super(key: key);

  @override
  State<TransportScreen> createState() => _TransportScreenState();
}

class _TransportScreenState extends State<TransportScreen> {
  bool returnToSameLocation = true;

  @override
  Widget build(BuildContext context) {
    String pickupLocation =
        context.watch<TransportProvider>().pickupLocation == 'Pickup location'
            ? LocaleKeys.pickupLocation.tr()
            : context.watch<TransportProvider>().pickupLocation;
    String dropoffLocation =
        context.watch<TransportProvider>().dropoffLocation ==
                'Drop-off location'
            ? LocaleKeys.dropOffLocation.tr()
            : context.watch<TransportProvider>().dropoffLocation;
    String pickupDate =
        context.watch<TransportProvider>().pickupDate == 'Select'
            ? LocaleKeys.select.tr()
            : context.watch<TransportProvider>().pickupDate;
    String dropoffDate =
        context.watch<TransportProvider>().dropoffDate == 'Select'
            ? LocaleKeys.select.tr()
            : context.watch<TransportProvider>().dropoffDate;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.defaultThemeColor,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          LocaleKeys.transport.tr(),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          height: MediaQuery.of(context).size.height * 0.89,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    LocaleKeys.returnToSameLocation.tr(),
                    style: TextStyle(
                      color: AppColors.defaultGreyColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    returnToSameLocation
                        ? LocaleKeys.yes.tr()
                        : LocaleKeys.no.tr(),
                    style: TextStyle(
                      color: AppColors.defaultGreyColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Switch(
                    splashRadius: 10.0,
                    activeColor: AppColors.defaultThemeColor,
                    value: returnToSameLocation,
                    onChanged: (same) {
                      setState(() {
                        returnToSameLocation = same;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                width: 15.0,
              ),
              FlightItem(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FindDestinationScreen(
                        isPickup: true,
                      ),
                    ),
                  );
                },
                icon: Icons.car_rental_outlined,
                content: Text(
                  pickupLocation,
                  style: TextStyle(
                    color: AppColors.defaultGreyColor,
                    fontSize: 16.0,
                  ),
                ),
              ),
              returnToSameLocation
                  ? const SizedBox()
                  : FlightItem(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FindDestinationScreen(
                              isPickup: false,
                            ),
                          ),
                        );
                      },
                      icon: Icons.car_rental_outlined,
                      content: Text(
                        dropoffLocation,
                        style: TextStyle(
                            color: AppColors.defaultGreyColor, fontSize: 16.0),
                      ),
                    ),
              Row(
                children: [
                  Expanded(
                    child: FlightItem(
                      onPressed: () async {
                        context
                            .read<TransportProvider>()
                            .setPickupDate(context);
                      },
                      icon: Icons.calendar_month_rounded,
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            LocaleKeys.pickupDate.tr(),
                            style: TextStyle(
                              color: AppColors.defaultShadowedGreyColor,
                              fontSize: 13.0,
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            pickupDate,
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
                    child: FlightItem(
                      onPressed: () async {
                        context
                            .read<TransportProvider>()
                            .setDropoffDate(context);
                      },
                      icon: Icons.calendar_month_rounded,
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            LocaleKeys.dropoffDate.tr(),
                            style: TextStyle(
                              color: AppColors.defaultShadowedGreyColor,
                              fontSize: 13.0,
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            dropoffDate,
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
              const SizedBox(
                width: 5.0,
              ),
              DefaultTextFormField(
                borderColor: Colors.grey.shade300,
                icon: Icons.person_outline_outlined,
                hint: LocaleKeys.driverAge.tr(),
              ),
              const Spacer(),
              DefaultButton(
                text: LocaleKeys.search.tr(),
                onPressed: () {
                  if (pickupLocation != LocaleKeys.pickupLocation.tr() &&
                      pickupDate != LocaleKeys.select.tr() &&
                      dropoffDate != LocaleKeys.select.tr()) {
                    if (returnToSameLocation == true) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CarSearchScreen(),
                        ),
                      );
                    } else {
                      if (dropoffLocation != LocaleKeys.dropOffLocation.tr()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CarSearchScreen(),
                          ),
                        );
                      } else {
                        showDialog<void>(
                          context: context,
                          barrierDismissible: false, // user must tap button!
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                'Select fields',
                                style: TextStyle(
                                    color: AppColors.defaultGreyColor),
                              ),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget>[
                                    Text(
                                      'You must select all the data.',
                                      style: TextStyle(
                                          color: AppColors.defaultGreyColor),
                                    ),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: Text(
                                    'OK',
                                    style: TextStyle(
                                      color: AppColors.defaultThemeColor,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
