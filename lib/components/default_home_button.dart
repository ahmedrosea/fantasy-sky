import 'package:flutter/material.dart';
import 'package:wego_clone/app_colors.dart';
import 'package:wego_clone/screens/flight/flight_screen.dart';

class DefaultHomeButton extends StatelessWidget {
  const DefaultHomeButton(
      {Key? key,
      required this.icon,
      required this.onPressed,
      required this.title})
      : super(key: key);
  final Icon icon;
  final String title;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12.withAlpha(15),
                offset: const Offset(
                  0,
                  3,
                ),
                blurRadius: 20.0,
                spreadRadius: 2.0,
              ),
            ],
            borderRadius: const BorderRadius.all(
              Radius.circular(7.0),
            ),
          ),
        ),
      ),
    );
  }
}
