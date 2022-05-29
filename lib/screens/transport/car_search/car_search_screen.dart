import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wego_clone/components/transport/car_search/car_search_item_property.dart';
import 'package:wego_clone/models/car_rent_model.dart';
import 'package:wego_clone/state-management/provider.dart';

import '../../../app_colors.dart';

class CarSearchScreen extends StatelessWidget {
  CarSearchScreen({Key? key}) : super(key: key);

  List<CarRentModel> cars = [
    CarRentModel(
      carName: 'Chevrolet Aveo Sedan',
      carImage: 'assets/images/car_image.jpg',
      carRate: '6.1',
      carPrice: '150',
    ),
    CarRentModel(
      carName: 'Chevrolet Aveo Sedan',
      carImage: 'assets/images/audi.jpeg',
      carRate: '8.5',
      carPrice: '550',
    ),
    CarRentModel(
      carName: 'BMW',
      carImage: 'assets/images/bmw.jpeg',
      carRate: '8.0',
      carPrice: '450',
    ),
    CarRentModel(
      carName: 'Mercedes',
      carImage: 'assets/images/mercedes.jpg',
      carRate: '8.2',
      carPrice: '530',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    String pickupLocation = context.read<TransportProvider>().pickupLocation;
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
          pickupLocation,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 10.0),
        height: double.infinity,
        child: ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(15.0),
                height: 400.0,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cars[index].carName,
                      style: TextStyle(
                        color: AppColors.defaultGreyColor,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          cars[index].carImage,
                          width: MediaQuery.of(context).size.width * 0.43,
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Expanded(
                          child: Container(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Intermediate car with:',
                                    style: TextStyle(
                                      color: AppColors.defaultGreyColor,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    '5 seats | 5 doors',
                                    style: TextStyle(
                                      color: AppColors.defaultGreyColor,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  const CarSearchItemProperty(
                                    icon: Icons.ac_unit_rounded,
                                    title: 'Air Conditioning',
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  const CarSearchItemProperty(
                                    icon: CupertinoIcons.gear_solid,
                                    title: 'Automatic',
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  const CarSearchItemProperty(
                                    icon: CupertinoIcons.location,
                                    title: 'In Terminal',
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  const CarSearchItemProperty(
                                    icon: Icons.local_gas_station_outlined,
                                    title: 'Like for like',
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    'Mileage: ',
                                    style: TextStyle(
                                      color: AppColors.defaultGreyColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    '120 kilometers per rental',
                                    style: TextStyle(
                                      color: AppColors.defaultGreyColor,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 40.0,
                          width: 40.0,
                          child: Center(
                            child: Text(
                              cars[index].carRate,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.defaultThemeColor,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(3.0),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Price for 1 day',
                              style: TextStyle(
                                color: AppColors.defaultGreyColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              'EGP ${cars[index].carPrice}',
                              style: TextStyle(
                                color: AppColors.defaultGreyColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 22.0,
                              ),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              '(approx.)',
                              style: TextStyle(
                                color: AppColors.defaultGreyColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 10.0,
              );
            },
            itemCount: cars.length),
      ),
    );
  }
}
