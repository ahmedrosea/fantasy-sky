import 'package:flutter/material.dart';

import '../../../app_colors.dart';

class FlightResultCard extends StatelessWidget {
  const FlightResultCard(
      {Key? key,
      required this.cardTitle,
      required this.cardPrice,
      required this.onPressed})
      : super(key: key);
  final String cardTitle;
  final String cardPrice;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 30.0,
          horizontal: 20.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              cardTitle,
              style: TextStyle(
                color: AppColors.defaultGreyColor,
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            Container(
              width: 100.0,
              height: 45.0,
              child: Center(
                child: Text(
                  '$cardPrice EGP',
                  style: const TextStyle(
                    color: Colors.orange,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
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
    );
  }
}
