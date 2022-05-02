import 'package:flutter/material.dart';

import '../../app_colors.dart';

class PaymentItem extends StatelessWidget {
  const PaymentItem({
    Key? key,
    required this.cardImage,
    required this.cardTitle,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);
  final String cardImage;
  final String cardTitle;
  final Icon icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.only(top: 7.0, bottom: 7.0, right: 10.0),
        child: Row(
          children: [
            Image.asset(
              cardImage,
              height: 50.0,
            ),
            const SizedBox(
              width: 15.0,
            ),
            Text(
              cardTitle,
              style: TextStyle(
                color: AppColors.defaultGreyColor,
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            icon,
          ],
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey.shade300,
            ),
          ),
        ),
      ),
    );
  }
}
