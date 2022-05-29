import 'package:flutter/material.dart';

import '../../app_colors.dart';

class AccountItem extends StatelessWidget {
  const AccountItem(
      {Key? key,
      required this.title,
      required this.icon,
      required this.onPressed,
      this.extraData})
      : super(key: key);
  final String title;
  final IconData icon;
  final VoidCallback onPressed;
  final String? extraData;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        height: 50.0,
        child: Row(
          children: [
            Icon(
              icon,
              color: AppColors.defaultThemeColor,
              size: 25.0,
            ),
            const SizedBox(
              width: 25.0,
            ),
            Text(
              title,
              style: TextStyle(
                color: AppColors.defaultGreyColor,
                fontWeight: FontWeight.w400,
                fontSize: 18.0,
              ),
            ),
            const Spacer(),
            extraData != null
                ? Text(
                    extraData!,
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w400,
                      fontSize: 18.0,
                    ),
                  )
                : const SizedBox(),
            const SizedBox(
              width: 10.0,
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey.shade500,
              size: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
