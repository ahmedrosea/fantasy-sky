import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wego_clone/app_colors.dart';
import 'package:wego_clone/components/default_home_button.dart';
import 'package:wego_clone/screens/hotels/hotels_screen.dart';
import 'package:wego_clone/screens/transport/transport_screen.dart';
import 'package:wego_clone/screens/vr_tours/vr_tours_screen.dart';
import 'package:wego_clone/translations/locale_keys.g.dart';

import 'flight/flight_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Image.asset(
            'assets/images/home_background_hero_image.jpg',
            fit: BoxFit.fill,
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                height: 120.0,
                child: Row(
                  children: [
                    DefaultHomeButton(
                      icon: Icon(
                        Icons.flight,
                        size: 40.0,
                        color: AppColors.defaultThemeColor,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FlightScreen(),
                          ),
                        );
                      },
                      title: LocaleKeys.flight.tr(),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    DefaultHomeButton(
                      icon: Icon(
                        Icons.hotel,
                        size: 40.0,
                        color: AppColors.defaultThemeColor,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HotelsScreen(),
                          ),
                        );
                      },
                      title: LocaleKeys.hotels.tr(),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                height: 120.0,
                child: Row(
                  children: [
                    DefaultHomeButton(
                      icon: Icon(
                        Icons.emoji_transportation,
                        size: 40.0,
                        color: AppColors.defaultThemeColor,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TransportScreen(),
                          ),
                        );
                      },
                      title: LocaleKeys.transport.tr(),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    DefaultHomeButton(
                      icon: Icon(
                        Icons.vrpano,
                        size: 40.0,
                        color: AppColors.defaultThemeColor,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VRToursScreen(),
                          ),
                        );
                      },
                      title: LocaleKeys.vrtours.tr(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
