import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wego_clone/app_colors.dart';
import 'package:wego_clone/components/default_button.dart';
import 'package:wego_clone/components/flight/flight_result/flight_result_card.dart';

import '../../../../components/hotels/hotels_result/hotels_result_room_amenitiy.dart';

class HotelsResultRoomScreen extends StatefulWidget {
  const HotelsResultRoomScreen(
      {Key? key,
      required this.image,
      required this.hotelName,
      required this.price})
      : super(key: key);
  final String image;
  final String hotelName;
  final String price;
  @override
  State<HotelsResultRoomScreen> createState() => _HotelsResultRoomScreenState();
}

class _HotelsResultRoomScreenState extends State<HotelsResultRoomScreen> {
  bool isBottomBarVisible = false;
  bool isAppBarVisible = false;
  final ScrollController _controller = ScrollController();

  void checkTheArrowColor() {
    if (_controller.offset >= 98.90491832386283) {
      setState(() {
        isAppBarVisible = true;
      });
    } else {
      setState(() {
        isAppBarVisible = false;
      });
    }

    print(_controller.offset);
  }

  void checkTheVisibilityOfNavBar() {
    if (_controller.offset >= 348.97480823863685) {
      setState(() {
        isBottomBarVisible = true;
      });
    } else {
      setState(() {
        isBottomBarVisible = false;
      });
    }
  }

  @override
  void initState() {
    _controller.addListener(checkTheArrowColor);
    _controller.addListener(checkTheVisibilityOfNavBar);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isAppBarVisible
          ? AppBar(
              backgroundColor: AppColors.defaultThemeColor,
              elevation: 0.0,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.hotelName,
                        style: const TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      const Text(
                        '1',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      const Icon(
                        Icons.hotel_outlined,
                        size: 16.0,
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      const Text(
                        '2',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      const Icon(
                        Icons.people,
                        size: 16.0,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  const Text(
                    'Fri, 06 May - Sun, 08 May / 2 Nights',
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              centerTitle: true,
            )
          : null,
      body: Stack(
        children: [
          ListView(
            controller: _controller,
            children: [
              Stack(
                children: [
                  Image.asset(
                    widget.image,
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.28,
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    bottom: 10.0,
                    left: 15.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.hotelName,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 2.0,
                        ),
                        Text(
                          'from EGP${widget.price} / night',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          width: 100.0,
                          height: 20.0,
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
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                padding: const EdgeInsets.all(15.0),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Book With:',
                      style: TextStyle(
                        color: AppColors.defaultGreyColor,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      height: 35.0,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 5.0),
                              child: Center(
                                child: Text(
                                  'Pay at Hotel',
                                  style: TextStyle(
                                    color: AppColors.defaultGreyColor,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(3.0)),
                                border: Border.all(
                                  color: Colors.grey.shade300,
                                  width: 1.0,
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            width: 5.0,
                          );
                        },
                        itemCount: 5,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/booking.png',
                          width: 90.0,
                        ),
                        Container(
                          width: 110.0,
                          height: 40.0,
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${widget.price} EGP',
                                  style: const TextStyle(
                                    color: Colors.orange,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  size: 13.0,
                                  color: Colors.orange,
                                ),
                              ],
                            ),
                          ),
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(72, 255, 172, 64),
                            borderRadius: BorderRadius.all(
                              Radius.circular(3.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Three-bedroom Apartment',
                      style: TextStyle(
                        color: AppColors.defaultGreyColor,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      '2 rooms left!'.toUpperCase(),
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 13.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      width: double.infinity,
                      height: 40.0,
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Icon(
                              Icons.discount_outlined,
                              color: Colors.orange,
                              size: 20.0,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              'Getaway Deal',
                              style: TextStyle(
                                color: Colors.orange,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(72, 255, 172, 64),
                        borderRadius: BorderRadius.all(
                          Radius.circular(3.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Description',
                      style: TextStyle(
                        color: AppColors.defaultGreyColor,
                        fontSize: 17.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Apartment near City Stars is an apartment situated in Cairo. 300 meters walking distance from City Stars (one of Cairo\'s biggest malls) and 7 km from Cairo Festival mall (one of Cairo\'s biggest malls) and 2.7 km from palace of Baron Emban. The property feutures views of the city from Eighths floor with 2 elevators. Free WiFi is provided.\n\nThe deluxe apartment includes 2 bed rooms and a living room with a flat-screen TV. The apartment is air-conditioned and features a washing machine a dining area and a kitchen fitted with a microwavefridge and water kettle. The 2 private bathrooms are fitted with a shower.\n\nCleopatra hospital is 3.1 km and Heliopolis Basilika is 3.4 km. The nearest airport is Cairo international airport 7 km from the property. Free parking is available on-site.',
                      style: TextStyle(
                        color: AppColors.defaultGreyColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 15.0,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                padding: const EdgeInsets.all(15.0),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Policies',
                      style: TextStyle(
                        color: AppColors.defaultGreyColor,
                        fontSize: 17.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Check-In Date: 02:00 PM',
                      style: TextStyle(
                        color: AppColors.defaultGreyColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'Check-Out Date: 12:30 PM',
                      style: TextStyle(
                        color: AppColors.defaultGreyColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Amenities',
                      style: TextStyle(
                        color: AppColors.defaultGreyColor,
                        fontSize: 17.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const HotelsResultRoomAmenity(
                      amenyTitle: 'Restaurant',
                      icon: Icons.restaurant_outlined,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const HotelsResultRoomAmenity(
                      amenyTitle: 'Airconditioning',
                      icon: Icons.ac_unit_outlined,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const HotelsResultRoomAmenity(
                      amenyTitle: 'Casino',
                      icon: Icons.casino_outlined,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const HotelsResultRoomAmenity(
                      amenyTitle: 'Airport Shuttle',
                      icon: Icons.check_outlined,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 90.0,
              ),
            ],
          ),
          isAppBarVisible
              ? const SizedBox()
              : Positioned(
                  top: 40.0,
                  left: 0.0,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                ),
          isBottomBarVisible
              ? Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    height: 80.0,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Row(
                      children: [
                        Image.asset('assets/images/booking.png', width: 80.0),
                        const Spacer(),
                        Text(
                          '${widget.price} EGP',
                          style: TextStyle(
                            color: AppColors.defaultGreyColor,
                            fontSize: 21.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        MaterialButton(
                          minWidth: 30.0,
                          onPressed: () {},
                          child: const Center(
                            child: Text(
                              'VIEW',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                letterSpacing: 1.2,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          color: const Color.fromARGB(255, 255, 169, 41),
                        ),
                      ],
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
