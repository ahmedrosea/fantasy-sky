import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wego_clone/components/payments/payments_item.dart';
import 'package:wego_clone/state-management/provider.dart';

import '../../../app_colors.dart';

class PaymentsScreen extends StatelessWidget {
  PaymentsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool isVisaChoosed = context.watch<FlightProvider>().isVisaChoosed;
    bool isMasterCardChoosed =
        context.watch<FlightProvider>().isMasterCardChoosed;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.defaultThemeColor,
        elevation: 0.0,
        title: const Text('Payments'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.check_rounded,
                size: 34.0,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 30.0),
        padding: const EdgeInsets.only(top: 10.0, left: 10.0),
        height: 180.0,
        child: ListView(
          children: [
            PaymentItem(
              cardImage: 'assets/images/visa.png',
              cardTitle: 'Visa Debit',
              icon: Icon(
                Icons.check_rounded,
                color: AppColors.defaultThemeColor,
                size: isVisaChoosed ? 28.0 : 0,
              ),
              onPressed: () {
                context.read<FlightProvider>().toggleVisa();
              },
            ),
            PaymentItem(
              cardImage: 'assets/images/master-card.png',
              cardTitle: 'MasterCard Debit',
              icon: Icon(
                Icons.check_rounded,
                color: AppColors.defaultThemeColor,
                size: isMasterCardChoosed ? 28.0 : 0,
              ),
              onPressed: () {
                context.read<FlightProvider>().toggleMasterCard();
              },
            ),
          ],
        ),
      ),
    );
  }
}
