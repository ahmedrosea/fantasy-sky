import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wego_clone/app_colors.dart';
import 'package:wego_clone/translations/locale_keys.g.dart';

class FlightProvider with ChangeNotifier {
  //Departure Date
  String date = '';
  late int year;
  late int month;
  late int day;

  void getDepartureDate() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    date = pref.getString('Departure Date') ?? 'Select';
    year = pref.getInt('Departure Year') ?? DateTime.now().year;
    month = pref.getInt('Departure Month') ?? DateTime.now().month;
    day = pref.getInt('Departure Day') ?? DateTime.now().day;
    notifyListeners();
  }

  void setDepartureDate(BuildContext context) async {
    DateTime initialDate = DateTime(year, month, day);
    SharedPreferences pref = await SharedPreferences.getInstance();
    final newDepartureDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(DateTime.now().year + 5),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: AppColors.defaultThemeColor,
                onPrimary: Colors.white,
                onSurface: AppColors.defaultThemeColor,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: AppColors.defaultThemeColor,
                ),
              ),
            ),
            child: child!,
          );
        });
    if (newDepartureDate == null) {
      return;
    } else {
      date = DateFormat.MMMMEEEEd().format(newDepartureDate);
      pref.setString('Departure Date', date);
      pref.setInt('Departure Year', newDepartureDate.year);
      pref.setInt('Departure Month', newDepartureDate.month);
      pref.setInt('Departure Day', newDepartureDate.day);
      getDepartureDate();
    }
    notifyListeners();
  }

  //Return Date
  String returnDate = '';
  late int returnYear;
  late int returnMonth;
  late int returnDay;

  void getReturnDate() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    returnDate = pref.getString('Return Date') ?? 'Select';
    returnYear = pref.getInt('Return Year') ?? DateTime.now().year;
    returnMonth = pref.getInt('Return Month') ?? DateTime.now().month;
    returnDay = pref.getInt('Return Day') ?? DateTime.now().day;
    notifyListeners();
  }

  void setReturnDate(BuildContext context) async {
    DateTime initialDate = DateTime(returnYear, returnMonth, returnDay);
    SharedPreferences pref = await SharedPreferences.getInstance();
    final newReturnDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(DateTime.now().year + 5),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: AppColors.defaultThemeColor,
                onPrimary: Colors.white,
                onSurface: AppColors.defaultThemeColor,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: AppColors.defaultThemeColor,
                ),
              ),
            ),
            child: child!,
          );
        });
    if (newReturnDate == null) {
      return;
    } else {
      returnDate = DateFormat.MMMMEEEEd().format(newReturnDate);
      pref.setString('Return Date', returnDate);
      pref.setInt('Return Year', newReturnDate.year);
      pref.setInt('Return Month', newReturnDate.month);
      pref.setInt('Return Day', newReturnDate.day);
      getReturnDate();
    }
    notifyListeners();
  }

  //Passengers Data
  int adultNumber = 1;
  int childNumber = 0;
  int infantNumber = 0;

  void passengersDataInit() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    adultNumber = pref.getInt('Adult Number') ?? 1;
    childNumber = pref.getInt('Child Number') ?? 0;
    infantNumber = pref.getInt('Infant Number') ?? 0;
    notifyListeners();
  }

  void setPassengersData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt('Adult Number', adultNumber);
    pref.setInt('Child Number', childNumber);
    pref.setInt('Infant Number', infantNumber);
    notifyListeners();
  }

  void increaseAdultNumber() async {
    adultNumber++;
    notifyListeners();
  }

  void decreaseAdultNumber() async {
    if (adultNumber > 1) {
      adultNumber--;
    }
    notifyListeners();
  }

  void increaseChildNumber() async {
    childNumber++;
    notifyListeners();
  }

  void decreaseChildNumber() async {
    if (childNumber > 0) {
      childNumber--;
    }
    notifyListeners();
  }

  void increaseInfantNumber() async {
    if (infantNumber < 1) {
      infantNumber++;
    }
    notifyListeners();
  }

  void decreaseInfantNumber() async {
    if (infantNumber > 0) {
      infantNumber--;
    }
    notifyListeners();
  }

  // payments
  late bool isVisaChoosed;
  late bool isMasterCardChoosed;
  int selectedCardsNumber = 0;
  void paymentsDataInit() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    isVisaChoosed = pref.getBool('isVisaChoosed') ?? false;
    isMasterCardChoosed = pref.getBool('isMasterCardChoosed') ?? false;
    selectedCardsNumber = isVisaChoosed && isMasterCardChoosed
        ? 2
        : (isVisaChoosed || isMasterCardChoosed ? 1 : 0);
    notifyListeners();
  }

  void toggleVisa() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    isVisaChoosed = !isVisaChoosed;
    pref.setBool('isVisaChoosed', isVisaChoosed);
    selectedCardsNumber = isVisaChoosed && isMasterCardChoosed
        ? 2
        : (isVisaChoosed || isMasterCardChoosed ? 1 : 0);
    notifyListeners();
  }

  void toggleMasterCard() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    isMasterCardChoosed = !isMasterCardChoosed;
    pref.setBool('isMasterCardChoosed', isMasterCardChoosed);
    selectedCardsNumber = isVisaChoosed && isMasterCardChoosed
        ? 2
        : (isVisaChoosed || isMasterCardChoosed ? 1 : 0);
    notifyListeners();
  }

  //Flight class
  int choosedFlightClassIndex = 0;
  void flightClassInit() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    choosedFlightClassIndex = pref.getInt('choosedFlightClassIndex') ?? 0;
    notifyListeners();
  }

  void setFlightClass(int choosedItem) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    choosedFlightClassIndex = choosedItem;
    pref.setInt('choosedFlightClassIndex', choosedFlightClassIndex);
    notifyListeners();
  }

  //departure Data
  String departurePlace = '';
  String departurePlaceCode = '';
  void departureDataInit() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    departurePlace = pref.getString('DeparturePlace') ?? 'Choose Departure';
    departurePlaceCode = pref.getString('DeparturePlaceCode') ?? '';
    notifyListeners();
  }

  void setDeparture(String departure, String code) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    departurePlace = departure;
    departurePlaceCode = code;
    pref.setString('DeparturePlace', departure);
    pref.setString('DeparturePlaceCode', code);
    notifyListeners();
  }

  //arrival Data
  String arrivalPlace = '';
  String arrivalPlaceCode = '';
  void arrivalDataInit() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    arrivalPlace = pref.getString('ArrivalPlace') ?? 'Choose Arrival';
    arrivalPlaceCode = pref.getString('ArrivalPlaceCode') ?? '';
    notifyListeners();
  }

  void setArrival(String arrival, String code) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    arrivalPlace = arrival;
    arrivalPlaceCode = code;
    pref.setString('ArrivalPlace', arrival);
    pref.setString('ArrivalPlaceCode', code);
    notifyListeners();
  }
}

class HotelsProvider with ChangeNotifier {
//CHECK-IN Date
  String checkinDate = '';
  late int checkinYear;
  late int checkinMonth;
  late int checkinDay;

  void getCheckinDate() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    checkinDate = pref.getString('Checkin Date') ?? 'Select';
    checkinYear = pref.getInt('Checkin Year') ?? DateTime.now().year;
    checkinMonth = pref.getInt('Checkin Month') ?? DateTime.now().month;
    checkinDay = pref.getInt('Checkin Day') ?? DateTime.now().day;
    notifyListeners();
  }

  void setCheckinDate(BuildContext context) async {
    DateTime initialDate = DateTime(checkinYear, checkinMonth, checkinDay);
    SharedPreferences pref = await SharedPreferences.getInstance();
    final newCheckinDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(DateTime.now().year + 5),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: AppColors.defaultThemeColor,
                onPrimary: Colors.white,
                onSurface: AppColors.defaultThemeColor,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: AppColors.defaultThemeColor,
                ),
              ),
            ),
            child: child!,
          );
        });
    if (newCheckinDate == null) {
      return;
    } else {
      checkinDate = DateFormat.MMMMEEEEd().format(newCheckinDate);
      pref.setString('Checkin Date', checkinDate);
      pref.setInt('Checkin Year', newCheckinDate.year);
      pref.setInt('Checkin Month', newCheckinDate.month);
      pref.setInt('Checkin Day', newCheckinDate.day);
      getCheckinDate();
    }
    notifyListeners();
  }

  //CHECK-OUT Date
  String checkoutDate = '';
  late int checkoutYear;
  late int checkoutMonth;
  late int checkoutDay;

  void getCheckoutDate() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    checkoutDate = pref.getString('Checkout Date') ?? 'Select';
    checkoutYear = pref.getInt('Checkout Year') ?? DateTime.now().year;
    checkoutMonth = pref.getInt('Checkout Month') ?? DateTime.now().month;
    checkoutDay = pref.getInt('Checkout Day') ?? DateTime.now().day;
    notifyListeners();
  }

  void setCheckoutDate(BuildContext context) async {
    DateTime initialDate = DateTime(checkoutYear, checkoutMonth, checkoutDay);
    SharedPreferences pref = await SharedPreferences.getInstance();
    final newCheckoutDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(DateTime.now().year + 5),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: AppColors.defaultThemeColor,
                onPrimary: Colors.white,
                onSurface: AppColors.defaultThemeColor,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: AppColors.defaultThemeColor,
                ),
              ),
            ),
            child: child!,
          );
        });
    if (newCheckoutDate == null) {
      return;
    } else {
      checkoutDate = DateFormat.MMMMEEEEd().format(newCheckoutDate);
      pref.setString('Checkout Date', checkoutDate);
      pref.setInt('Checkout Year', newCheckoutDate.year);
      pref.setInt('Checkout Month', newCheckoutDate.month);
      pref.setInt('Checkout Day', newCheckoutDate.day);
      getCheckoutDate();
    }
    notifyListeners();
  }

  //guests data

  int adultNumber = 1;
  int childNumber = 0;

  void guestsDataInit() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    adultNumber = pref.getInt('Guests Adult Number') ?? 1;
    childNumber = pref.getInt('Guests Child Number') ?? 0;
    notifyListeners();
  }

  void setGuestsData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt('Guests Adult Number', adultNumber);
    pref.setInt('Guests Child Number', childNumber);
    notifyListeners();
  }

  void increaseAdultNumber() async {
    adultNumber++;
    notifyListeners();
  }

  void decreaseAdultNumber() async {
    if (adultNumber > 1) {
      adultNumber--;
    }
    notifyListeners();
  }

  void increaseChildNumber() async {
    childNumber++;
    notifyListeners();
  }

  void decreaseChildNumber() async {
    if (childNumber > 0) {
      childNumber--;
    }
    notifyListeners();
  }

  //location data
  String location = '';
  void locationDataInit() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    location = pref.getString('hotelLocation') ?? 'Choose Location';
    notifyListeners();
  }

  void setLocation(String hotelLocation) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    location = hotelLocation;
    pref.setString('hotelLocation', hotelLocation);
    notifyListeners();
  }
}

class AuthenticationProvider with ChangeNotifier {
  //toggle between login and signup screens
  bool isLogin = true;
  void setDefault() {
    isLogin = true;
    notifyListeners();
  }

  void authenticationToggle() {
    isLogin = !isLogin;
    notifyListeners();
  }
}

class AccountProvider with ChangeNotifier {
  //account infos
  void accountInfoInit() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    region = pref.getString('accountRegion') ?? 'Choose a region';
    currency = pref.getString('accountCurrency') ?? 'Choose a currency';
    notifyListeners();
  }

  //account region
  String region = '';
  void setRegion({required String choosedRegion}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    region = choosedRegion;
    pref.setString('accountRegion', region);
    notifyListeners();
  }

  //account currency
  String currency = '';
  void setCurrency({required String choosedCurrency}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    currency = choosedCurrency;
    pref.setString('accountCurrency', currency);
    notifyListeners();
  }

  //account language
  String language = 'en';

  void changeLanguage(
      {required String languageCode, required BuildContext context}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    language = languageCode;
    pref.setString('language', language);
    context.setLocale(Locale(language));
    notifyListeners();
  }
}

class TransportProvider with ChangeNotifier {
  //transport data
  void transportDataInit() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pickupLocation = pref.getString('pickupLocation') ?? 'Pickup location';
    dropoffLocation = pref.getString('dropoffLocation') ?? 'Drop-off location';
    notifyListeners();
  }

  //Pickup location
  String pickupLocation = '';
  void setPickupLocation({
    required String location,
  }) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pickupLocation = location;
    pref.setString('pickupLocation', pickupLocation);
    notifyListeners();
  }

  //Drop-off location
  String dropoffLocation = '';
  void setdropoffLocation({
    required String location,
  }) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    dropoffLocation = location;
    pref.setString('dropoffLocation', dropoffLocation);
    notifyListeners();
  }

  //Pickup Date
  String pickupDate = '';
  late int pickupYear;
  late int pickupMonth;
  late int pickupDay;

  void getPickupDate() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pickupDate = pref.getString('Pickup Date') ?? 'Select';
    pickupYear = pref.getInt('Pickup Year') ?? DateTime.now().year;
    pickupMonth = pref.getInt('Pickup Month') ?? DateTime.now().month;
    pickupDay = pref.getInt('Pickup Day') ?? DateTime.now().day;
    notifyListeners();
  }

  void setPickupDate(BuildContext context) async {
    DateTime initialDate = DateTime(pickupYear, pickupMonth, pickupDay);
    SharedPreferences pref = await SharedPreferences.getInstance();
    final newPickupDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(DateTime.now().year + 5),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: AppColors.defaultThemeColor,
                onPrimary: Colors.white,
                onSurface: AppColors.defaultThemeColor,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: AppColors.defaultThemeColor,
                ),
              ),
            ),
            child: child!,
          );
        });
    if (newPickupDate == null) {
      return;
    } else {
      pickupDate = DateFormat.MMMMEEEEd().format(newPickupDate);
      pref.setString('Pickup Date', pickupDate);
      pref.setInt('Pickup Year', newPickupDate.year);
      pref.setInt('Pickup Month', newPickupDate.month);
      pref.setInt('Pickup Day', newPickupDate.day);
      getPickupDate();
    }
    notifyListeners();
  }

  //CHECK-OUT Date
  String dropoffDate = '';
  late int dropoffYear;
  late int dropoffMonth;
  late int dropoffDay;

  void getDropoffDate() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    dropoffDate = pref.getString('Dropoff Date') ?? 'Select';
    dropoffYear = pref.getInt('Dropoff Year') ?? DateTime.now().year;
    dropoffMonth = pref.getInt('Dropoff Month') ?? DateTime.now().month;
    dropoffDay = pref.getInt('Dropoff Day') ?? DateTime.now().day;
    notifyListeners();
  }

  void setDropoffDate(BuildContext context) async {
    DateTime initialDate = DateTime(dropoffYear, dropoffMonth, dropoffDay);
    SharedPreferences pref = await SharedPreferences.getInstance();
    final newDropoffDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(DateTime.now().year + 5),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: AppColors.defaultThemeColor,
                onPrimary: Colors.white,
                onSurface: AppColors.defaultThemeColor,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: AppColors.defaultThemeColor,
                ),
              ),
            ),
            child: child!,
          );
        });
    if (newDropoffDate == null) {
      return;
    } else {
      dropoffDate = DateFormat.MMMMEEEEd().format(newDropoffDate);
      pref.setString('Dropoff Date', dropoffDate);
      pref.setInt('Dropoff Year', newDropoffDate.year);
      pref.setInt('Dropoff Month', newDropoffDate.month);
      pref.setInt('Dropoff Day', newDropoffDate.day);
      getDropoffDate();
    }
    notifyListeners();
  }
}
