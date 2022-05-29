import 'package:flutter/material.dart';
import 'package:wego_clone/app_colors.dart';

class DefaultCheckBox extends StatefulWidget {
  const DefaultCheckBox({Key? key, required this.checkInfo}) : super(key: key);
  final String checkInfo;

  @override
  State<DefaultCheckBox> createState() => _DefaultCheckBoxState();
}

class _DefaultCheckBoxState extends State<DefaultCheckBox> {
  bool? value = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Transform.scale(
          scale: 1.4,
          child: Checkbox(
            hoverColor: AppColors.defaultShadowedGreyColor,
            focusColor: AppColors.defaultShadowedGreyColor,
            checkColor: Colors.white,
            activeColor: AppColors.defaultThemeColor,
            value: value,
            onChanged: (bool? val) {
              setState(() {
                value = val;
              });
            },
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(2.0))),
            side: BorderSide(color: AppColors.defaultShadowedGreyColor),
          ),
        ),
        Text(
          widget.checkInfo,
          style: TextStyle(
            color: AppColors.defaultGreyColor,
            fontFamily: 'SFPro',
            fontSize: 15.0,
          ),
        ),
      ],
    );
  }
}
