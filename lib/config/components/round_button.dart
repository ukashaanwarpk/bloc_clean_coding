import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

class RoundButton extends StatelessWidget {
  final double height;
  final double width;
 
  final VoidCallback onPress;
  final Color textColor;
  final Color bgColor;
  final double radius;
  final Widget child;

  const RoundButton({
    super.key,
    this.height = 55,
    this.width = 200,
   
    required this.onPress,
    this.bgColor = AppColors.greenColor,
    this.textColor = AppColors.whiteColor,
    this.radius = 15,
    required this.child,
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
        child: Center(child: child,),
      ),
    );
  }
}
