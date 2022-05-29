import 'package:flutter/material.dart';

import '../../../app_colors.dart';

class LocationItem extends StatelessWidget {
  const LocationItem({
    Key? key,
    required this.cardIcon,
    required this.cardTitle,
    required this.onPressed,
    required this.cardPlace,
  }) : super(key: key);
  final Icon cardIcon;
  final String cardTitle;
  final String cardPlace;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.only(top: 7.0, bottom: 7.0, right: 10.0),
        child: Row(
          children: [
            cardIcon,
            const SizedBox(
              width: 15.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cardTitle,
                  style: TextStyle(
                    color: AppColors.defaultGreyColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Text(
                  cardPlace,
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const Spacer(),
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
