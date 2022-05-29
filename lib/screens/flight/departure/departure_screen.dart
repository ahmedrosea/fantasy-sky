import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wego_clone/components/departure/departure_item.dart';
import 'package:wego_clone/state-management/provider.dart';

import '../../../app_colors.dart';

class DepartureScreen extends StatelessWidget {
  const DepartureScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.defaultThemeColor,
        elevation: 0.0,
        title: const Text('Departure'),
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
                'Nearest airports',
                style: TextStyle(
                  color: AppColors.defaultShadowedGreyColor,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              DepartureItem(
                cardTitle: 'Cairo Airport',
                onPressed: () {
                  context
                      .read<FlightProvider>()
                      .setDeparture('Cairo Airport', 'CAI');
                  Navigator.pop(context);
                },
                cardIcon: Icon(
                  Icons.flight_outlined,
                  size: 26.0,
                  color: Colors.grey.shade600,
                ),
                cardPlace: 'Egypt',
                placeCode: 'CAI',
              ),
              DepartureItem(
                cardTitle: 'Sphinix International Airport',
                onPressed: () {
                  context
                      .read<FlightProvider>()
                      .setDeparture('Sphinix International Airport', 'SPX');
                  Navigator.pop(context);
                },
                cardIcon: Icon(
                  Icons.flight_outlined,
                  size: 26.0,
                  color: Colors.grey.shade600,
                ),
                cardPlace: 'Egypt',
                placeCode: 'SPX',
              ),
              DepartureItem(
                cardTitle: 'Alexandria Airport',
                onPressed: () {
                  context
                      .read<FlightProvider>()
                      .setDeparture('Alexandria Airport', 'HBE');
                  Navigator.pop(context);
                },
                cardIcon: Icon(
                  Icons.flight_outlined,
                  size: 26.0,
                  color: Colors.grey.shade600,
                ),
                cardPlace: 'Egypt',
                placeCode: 'HBE',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
