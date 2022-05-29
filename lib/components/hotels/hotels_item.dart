import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class HotelsItem extends StatelessWidget {
  const HotelsItem(
      {Key? key, required this.icon, required this.content, this.onPressed})
      : super(key: key);

  final IconData icon;
  final Widget content;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18.0),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.grey.shade600,
              size: 26.0,
            ),
            const SizedBox(
              width: 10.0,
            ),
            content
          ],
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade300),
          ),
        ),
      ),
    );
  }
}
