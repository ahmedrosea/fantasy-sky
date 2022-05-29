import 'package:flutter/material.dart';

import '../../../app_colors.dart';

class CarSearchItemProperty extends StatelessWidget {
  const CarSearchItemProperty(
      {Key? key, required this.icon, required this.title})
      : super(key: key);
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: AppColors.defaultGreyColor,
          size: 21.0,
        ),
        const SizedBox(
          width: 5.0,
        ),
        Text(
          title,
          style: TextStyle(
              color: AppColors.defaultGreyColor,
              fontSize: 14.0,
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
