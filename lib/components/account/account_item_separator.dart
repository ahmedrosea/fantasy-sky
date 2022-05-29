import 'package:flutter/material.dart';

class AccountItemSeparator extends StatelessWidget {
  const AccountItemSeparator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50.0),
      child: Divider(
        height: 0.0,
        thickness: 0.5,
        color: Colors.grey.shade200,
      ),
    );
  }
}
