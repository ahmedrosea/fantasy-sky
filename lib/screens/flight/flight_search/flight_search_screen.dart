import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:wego_clone/screens/flight/flight_result/flight_result_screen.dart';
import '../../../app_colors.dart';
import '../../../models/flight_search_model.dart';

class FlightSearchScreen extends StatelessWidget {
  FlightSearchScreen({Key? key}) : super(key: key);

  List<FlightSearchModel> flights = [
    FlightSearchModel(
        airlineName: 'Jazeera Airways',
        airlineImage: 'assets/images/jazeera_airway.png',
        airlinePrice: '2560'),
    FlightSearchModel(
        airlineName: 'Royal Jordanian',
        airlineImage: 'assets/images/jordanian.png',
        airlinePrice: '3800'),
    FlightSearchModel(
        airlineName: 'Saudia Airlines',
        airlineImage: 'assets/images/saudia_airlines.png',
        airlinePrice: '2300'),
    FlightSearchModel(
        airlineName: 'EgyptAir',
        airlineImage: 'assets/images/egypt_air.png',
        airlinePrice: '2100'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.defaultThemeColor,
        elevation: 0.4,
        title: const Text('Flight Search'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              height: 50.0,
              color: AppColors.defaultThemeColor,
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return CupertinoActionSheet(
                          cancelButton: CupertinoActionSheetAction(
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                color: AppColors.defaultGreyColor,
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context, 'Cancel');
                            },
                          ),
                          actions: [
                            SizedBox(
                              height: 300.0,
                              child: CupertinoPicker(
                                itemExtent: 64.0,
                                diameterRatio: 1,
                                onSelectedItemChanged: (index) {
                                  print(index);
                                },
                                children: [
                                  CupertinoActionSheetAction(
                                    child: Text(
                                      'Lowest Price',
                                      style: TextStyle(
                                        color: AppColors.defaultGreyColor,
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  CupertinoActionSheetAction(
                                    child: Text(
                                      'Shortest Duration',
                                      style: TextStyle(
                                        color: AppColors.defaultGreyColor,
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  CupertinoActionSheetAction(
                                    child: Text(
                                      'Best Experience',
                                      style: TextStyle(
                                        color: AppColors.defaultGreyColor,
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  CupertinoActionSheetAction(
                                    child: Text(
                                      'Earliest Departure',
                                      style: TextStyle(
                                        color: AppColors.defaultGreyColor,
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  CupertinoActionSheetAction(
                                    child: Text(
                                      'Latest Departure',
                                      style: TextStyle(
                                        color: AppColors.defaultGreyColor,
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  CupertinoActionSheetAction(
                                    child: Text(
                                      'Earliest Arrival',
                                      style: TextStyle(
                                        color: AppColors.defaultGreyColor,
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  CupertinoActionSheetAction(
                                    child: Text(
                                      'Latest Arrival',
                                      style: TextStyle(
                                        color: AppColors.defaultGreyColor,
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Icon(
                        Icons.sort_outlined,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        'SORT',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.flight,
                    size: 16.0,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'Open for Travel',
                    style: TextStyle(
                      color: AppColors.defaultGreyColor,
                      fontSize: 17.0,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FlightResultScreen(
                            image: flights[index].airlineImage,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 150.0,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Image.asset(
                                  flights[index].airlineImage,
                                  width: 75.0,
                                ),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12.0, horizontal: 5.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        flights[index].airlineName,
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.defaultGreyColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Divider(),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10.0,
                              vertical: 15.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'from 5 websites',
                                  style: TextStyle(
                                    color: AppColors.defaultGreyColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  '${flights[index].airlinePrice} EGP',
                                  style: TextStyle(
                                    color: AppColors.defaultThemeColor,
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 20.0,
                  );
                },
                itemCount: flights.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
