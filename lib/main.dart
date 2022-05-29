import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:wego_clone/components/default_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:wego_clone/screens/splash/splash_screen.dart';
import 'package:wego_clone/state-management/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:wego_clone/translations/codegen_loader.g.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FlightProvider()),
        ChangeNotifierProvider(create: (context) => HotelsProvider()),
        ChangeNotifierProvider(create: (context) => AuthenticationProvider()),
        ChangeNotifierProvider(create: (context) => AccountProvider()),
        ChangeNotifierProvider(create: (context) => TransportProvider()),
      ],
      child: EasyLocalization(
        supportedLocales: const [
          Locale('en'),
          Locale('ar'),
        ],
        saveLocale: true,
        path: 'lib/translations',
        fallbackLocale: const Locale('en'),
        assetLoader: const CodegenLoader(),
        child: Phoenix(child: const MyApp()),
      ),
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
    //Flight Provider
    context.read<FlightProvider>().getDepartureDate();
    context.read<FlightProvider>().getReturnDate();
    context.read<FlightProvider>().passengersDataInit();
    context.read<FlightProvider>().paymentsDataInit();
    context.read<FlightProvider>().flightClassInit();
    context.read<FlightProvider>().departureDataInit();
    context.read<FlightProvider>().arrivalDataInit();
    //Hotels Provider
    context.read<HotelsProvider>().getCheckinDate();
    context.read<HotelsProvider>().getCheckoutDate();
    context.read<HotelsProvider>().guestsDataInit();
    context.read<HotelsProvider>().locationDataInit();
    //account Provider
    context.read<AccountProvider>().accountInfoInit();
    //Transport Provider
    context.read<TransportProvider>().transportDataInit();
    context.read<TransportProvider>().getPickupDate();
    context.read<TransportProvider>().getDropoffDate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
