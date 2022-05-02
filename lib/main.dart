import 'package:flutter/material.dart';
import 'package:wego_clone/components/default_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:wego_clone/state-management/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FlightProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    context.read<FlightProvider>().getDepartureDate();
    context.read<FlightProvider>().passengersDataInit();
    context.read<FlightProvider>().paymentsDataInit();
    context.read<FlightProvider>().flightClassInit();
    context.read<FlightProvider>().departureDataInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultNavbar(),
    );
  }
}
