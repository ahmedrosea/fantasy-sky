import 'package:flutter/material.dart';

import '../../../app_colors.dart';

class GuestsItem extends StatelessWidget {
  const GuestsItem({
    Key? key,
    this.isFirst = false,
    required this.icon,
    required this.text,
    required this.condition,
    required this.whenPlusPressed,
    required this.whenMinusPressed,
  }) : super(key: key);
  final bool isFirst;
  final IconData icon;
  final String text;
  final String condition;
  final VoidCallback whenPlusPressed;
  final VoidCallback whenMinusPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        margin: isFirst == true ? const EdgeInsets.only(top: 30.0) : null,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Row(
            children: [
              Icon(
                icon,
                color: AppColors.defaultShadowedGreyColor,
                size: 28.0,
              ),
              const SizedBox(
                width: 15.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      color: AppColors.defaultGreyColor,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    condition,
                    style: TextStyle(
                      color: AppColors.defaultShadowedGreyColor,
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                width: 110.0,
                height: 35.0,
                child: Row(
                  children: [
                    Expanded(
                      child: MaterialButton(
                        onPressed: whenMinusPressed,
                        child: const Icon(Icons.remove),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: VerticalDivider(
                        width: 0.0,
                      ),
                    ),
                    Expanded(
                      child: MaterialButton(
                        onPressed: whenPlusPressed,
                        child: const Icon(Icons.add),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: const BorderRadius.all(Radius.circular(8.0))),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
          border: Border(
            top: isFirst == true
                ? BorderSide(
                    color: Colors.grey.shade300,
                    width: 0.5,
                  )
                : BorderSide.none,
            bottom: BorderSide(
              color: Colors.grey.shade300,
              width: 0.5,
            ),
          ),
        ),
      ),
    );
  }
}
