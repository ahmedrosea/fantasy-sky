import 'package:flutter/material.dart';

import '../../../app_colors.dart';

class HotelsResultRoomAmenity extends StatelessWidget {
  const HotelsResultRoomAmenity(
      {Key? key, required this.amenyTitle, required this.icon})
      : super(key: key);
  final String amenyTitle;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18.0,
          color: AppColors.defaultGreyColor,
        ),
        const SizedBox(
          width: 20.0,
        ),
        Text(
          amenyTitle,
          style: TextStyle(
            color: AppColors.defaultGreyColor,
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
