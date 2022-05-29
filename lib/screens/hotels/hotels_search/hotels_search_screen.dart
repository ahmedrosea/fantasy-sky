import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wego_clone/models/hotels_search_model.dart';
import 'package:wego_clone/screens/hotels/hotels_search/hotels_result/hotels_result_room_screen.dart';

import '../../../app_colors.dart';

class HotelsSearchScreen extends StatelessWidget {
  HotelsSearchScreen({Key? key}) : super(key: key);

  List<HotelsSearchModel> hotels = [
    HotelsSearchModel(
      hotelName: 'Le Meridien Riyadh',
      hotelLocation: 'Nasr City',
      hotelPrice: '2560',
      hotelRate: '8.3',
      hotelImage: 'assets/images/hotel_room.jpg',
    ),
    HotelsSearchModel(
      hotelName: 'TheCastle Hotel',
      hotelLocation: 'Cairo',
      hotelPrice: '4220',
      hotelRate: '8.0',
      hotelImage: 'assets/images/hotel_room2.jpg',
    ),
    HotelsSearchModel(
      hotelName: 'Zayed Hotel',
      hotelLocation: 'Cairo',
      hotelPrice: '2220',
      hotelRate: '8.5',
      hotelImage: 'assets/images/hotel_room3.jpg',
    ),
    HotelsSearchModel(
      hotelName: 'Cairo House',
      hotelLocation: 'Cairo',
      hotelPrice: '2650',
      hotelRate: '8.6',
      hotelImage: 'assets/images/hotel_room4.jpg',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.defaultThemeColor,
        elevation: 0.4,
        title: const Text('Hotels Search'),
        centerTitle: true,
      ),
      body: Column(
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
          const SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HotelsResultRoomScreen(
                          image: hotels[index].hotelImage,
                          hotelName: hotels[index].hotelName,
                          price: hotels[index].hotelPrice,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 170.0,
                    color: Colors.white,
                    child: Row(
                      children: [
                        Image.asset(
                          hotels[index].hotelImage,
                          height: double.infinity,
                          width: 110.0,
                          fit: BoxFit.fill,
                        ),
                        Expanded(
                          child: Container(
                            height: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                              vertical: 12.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  hotels[index].hotelName,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.defaultGreyColor,
                                  ),
                                ),
                                SizedBox(
                                  width: 100.0,
                                  height: 30.0,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return const Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                        size: 18.0,
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return const SizedBox(
                                        width: 0.0,
                                      );
                                    },
                                    itemCount: 5,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      CupertinoIcons.location,
                                      size: 18.0,
                                      color: AppColors.defaultShadowedGreyColor,
                                    ),
                                    const SizedBox(
                                      width: 5.0,
                                    ),
                                    Text(
                                      hotels[index].hotelLocation,
                                      style: TextStyle(
                                        color:
                                            AppColors.defaultShadowedGreyColor,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                SizedBox(
                                  height: 40.0,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 35.0,
                                        width: 35.0,
                                        child: Center(
                                          child: Text(
                                            hotels[index].hotelRate,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                            color: AppColors.defaultThemeColor,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(4.0))),
                                      ),
                                      const SizedBox(
                                        width: 10.0,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Very Good',
                                            style: TextStyle(
                                              color:
                                                  AppColors.defaultThemeColor,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5.0,
                                          ),
                                          Text(
                                            '235 Reviews',
                                            style: TextStyle(
                                              color: AppColors.defaultGreyColor,
                                              fontSize: 12.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 120.0,
                                      height: 20.0,
                                      child: Center(
                                        child: Text(
                                          'Free Cancellation',
                                          style: TextStyle(
                                              color: AppColors.defaultGreyColor,
                                              fontSize: 13.0),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade300,
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(
                                            2.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '${hotels[index].hotelPrice} EGP',
                                      style: TextStyle(
                                        color: AppColors.defaultThemeColor,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10.0,
                );
              },
              itemCount: hotels.length,
            ),
          ),
        ],
      ),
    );
  }
}
