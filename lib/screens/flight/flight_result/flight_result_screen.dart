import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wego_clone/components/flight/flight_result/flight_result_card.dart';

import '../../../app_colors.dart';

class FlightResultScreen extends StatelessWidget {
  FlightResultScreen({Key? key, required this.image}) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.defaultThemeColor,
        elevation: 0.0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'CAI',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Icon(
                  Icons.arrow_forward,
                  size: 18.0,
                ),
                Text(
                  'JED',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  width: 15.0,
                ),
                Text(
                  '1',
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Icon(
                  Icons.man_outlined,
                  size: 18.0,
                ),
              ],
            ),
            const Text(
              'Tue, 31 May',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: ListView(
          children: [
            Container(
              height: 110.0,
              width: double.infinity,
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        image,
                        width: 60.0,
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'CAI',
                                  style: TextStyle(
                                    color: AppColors.defaultGreyColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 19.0,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  '10:50',
                                  style: TextStyle(
                                    color: AppColors.defaultGreyColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 17.0,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                Icon(
                                  CupertinoIcons.airplane,
                                  size: 15.0,
                                  color: AppColors.defaultShadowedGreyColor,
                                ),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  'JED',
                                  style: TextStyle(
                                    color: AppColors.defaultGreyColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 19.0,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  '13:55',
                                  style: TextStyle(
                                    color: AppColors.defaultGreyColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 17.0,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              'Tue, 31 May - 02h 05m',
                              style: TextStyle(
                                color: AppColors.defaultShadowedGreyColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Icon(
                        Icons.restaurant,
                        color: AppColors.defaultShadowedGreyColor,
                        size: 18.0,
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Icon(
                        Icons.play_arrow_outlined,
                        color: AppColors.defaultShadowedGreyColor,
                        size: 18.0,
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Icon(
                        Icons.wifi,
                        color: AppColors.defaultShadowedGreyColor,
                        size: 18.0,
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Icon(
                        Icons.electrical_services_outlined,
                        color: AppColors.defaultShadowedGreyColor,
                        size: 18.0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        'Booking Options (5)',
                        style: TextStyle(
                          color: AppColors.defaultShadowedGreyColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    FlightResultCard(
                      cardTitle: 'Tripjet',
                      cardPrice: '388',
                      onPressed: () {},
                    ),
                    const Divider(
                      thickness: 0.4,
                    ),
                    FlightResultCard(
                      cardTitle: 'Gotogate',
                      cardPrice: '407',
                      onPressed: () {},
                    ),
                    const Divider(
                      thickness: 0.4,
                    ),
                    FlightResultCard(
                      cardTitle: 'Wingie',
                      cardPrice: '443',
                      onPressed: () {},
                    ),
                    const Divider(
                      thickness: 0.4,
                    ),
                    FlightResultCard(
                      cardTitle: 'Travelstart',
                      cardPrice: '457',
                      onPressed: () {},
                    ),
                    const Divider(
                      thickness: 0.4,
                    ),
                    FlightResultCard(
                      cardTitle: 'Air Cairo',
                      cardPrice: '490',
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
