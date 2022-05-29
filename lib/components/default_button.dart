import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18.0,
          letterSpacing: 2.0,
          fontWeight: FontWeight.w500,
        ),
      ),
      color: const Color.fromARGB(255, 255, 169, 41),
    );
  }
}
