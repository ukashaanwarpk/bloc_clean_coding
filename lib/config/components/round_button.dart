import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

class RoundButton extends StatelessWidget {
  final double height;
  final double width;
  final String title;
  final VoidCallback onPress;
  final Color textColor;
  final Color bgColor;
  final double radius;
  const RoundButton({
    super.key,
    this.height = 55,
    this.width = 200,
    required this.title,
    required this.onPress,
    this.bgColor = AppColors.greenColor,
    this.textColor = AppColors.blackColor,
    this.radius = 15,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Text(title, style: TextStyle(color: textColor)),
      ),
    );
  }
}
