import 'package:flutter/material.dart';
import 'package:wego_clone/app_colors.dart';
import 'package:wego_clone/components/default_home_button.dart';

import 'flight/flight_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        ClipRRect(
          child: Image.asset(
            'assets/images/home_background_hero_image.jpg',
          ),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.elliptical(
                  MediaQuery.of(context).size.width * 0.5, 30.0),
              bottomRight: Radius.elliptical(
                  MediaQuery.of(context).size.width * 0.5, 30.0)),
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
                      title: 'Flight',
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
                      onPressed: () {},
                      title: 'Hotels',
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
                      onPressed: () {},
                      title: 'Transport',
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
                      onPressed: () {},
                      title: 'VR Tours',
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
