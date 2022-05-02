import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wego_clone/app_colors.dart';

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
  void paymentsDataInit() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    isVisaChoosed = pref.getBool('isVisaChoosed') ?? false;
    isMasterCardChoosed = pref.getBool('isMasterCardChoosed') ?? false;
    notifyListeners();
  }

  void toggleVisa() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    isVisaChoosed = !isVisaChoosed;
    pref.setBool('isVisaChoosed', isVisaChoosed);
    notifyListeners();
  }

  void toggleMasterCard() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    isMasterCardChoosed = !isMasterCardChoosed;
    pref.setBool('isMasterCardChoosed', isMasterCardChoosed);
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
    departurePlace = pref.getString('DeparturePlace') ?? '';
    departurePlaceCode = pref.getString('DeparturePlaceCode') ?? '';
  }

  void setDeparture(String departure, String code) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    departurePlace = departure;
    pref.setString('DeparturePlace', departurePlace);
    pref.setString('DeparturePlaceCode', code);
    notifyListeners();
  }
}
