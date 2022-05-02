import 'package:flutter/material.dart';

import '../../../app_colors.dart';
import '../../../components/departure/departure_item.dart';

class ArrivalScreen extends StatelessWidget {
  const ArrivalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.defaultThemeColor,
        elevation: 0.0,
        title: const Text('Arrival'),
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
                onPressed: () {},
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
                onPressed: () {},
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
                onPressed: () {},
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
