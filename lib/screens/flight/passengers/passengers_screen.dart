import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wego_clone/components/passengers/passengers_item.dart';
import 'package:wego_clone/state-management/provider.dart';

import '../../../app_colors.dart';

class PassengersScreen extends StatelessWidget {
  const PassengersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int adultNumber = context.watch<FlightProvider>().adultNumber;
    int childNumber = context.watch<FlightProvider>().childNumber;
    int infantNumber = context.watch<FlightProvider>().infantNumber;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.defaultThemeColor,
        elevation: 0.0,
        title: const Text('Passengers'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            context.read<FlightProvider>().passengersDataInit();
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
                context.read<FlightProvider>().setPassengersData();
                context.read<FlightProvider>().passengersDataInit();
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
          PassengerItem(
            icon: Icons.man_outlined,
            isFirst: true,
            text: '$adultNumber Adult',
            condition: '(>12 years)',
            whenMinusPressed: () {
              context.read<FlightProvider>().decreaseAdultNumber();
            },
            whenPlusPressed: () {
              context.read<FlightProvider>().increaseAdultNumber();
            },
          ),
          const SizedBox(
            height: 2.0,
          ),
          PassengerItem(
            icon: Icons.boy_outlined,
            text: '$childNumber Child',
            condition: '(2-12 years)',
            whenMinusPressed: () {
              context.read<FlightProvider>().decreaseChildNumber();
            },
            whenPlusPressed: () {
              context.read<FlightProvider>().increaseChildNumber();
            },
          ),
          const SizedBox(
            height: 2.0,
          ),
          PassengerItem(
            icon: Icons.child_care_rounded,
            text: '$infantNumber Infant',
            condition: '(<2 years)',
            whenMinusPressed: () {
              context.read<FlightProvider>().decreaseInfantNumber();
            },
            whenPlusPressed: () {
              context.read<FlightProvider>().increaseInfantNumber();
            },
          ),
        ],
      ),
    );
  }
}
