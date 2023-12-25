import 'package:flutter/material.dart';

import '../app_constance/app_constance.dart';
import '../app_styles/app_styles.dart';

class CustomButton extends StatelessWidget {
  final double height;

  final double width;

  final String title;
  final bool thereIsShadow ;
  final void Function()? onPressed;

  const CustomButton({
    super.key,
    required this.width,
    this.height = 60,
    required this.title,
    required this.onPressed,
    this.thereIsShadow = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: thereIsShadow ? [
          BoxShadow(
            color: Color(0x331B39FF),
            blurRadius: 13.65,
            offset: Offset(0, 6.82),
            spreadRadius: 0,
          ),
        ] : null ,
      ),
      child: MaterialButton(
        minWidth: width,
        height: height,
        color: AppConstance.primaryAppColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: AppStyles.style20,
        ),
      ),
    );
  }
}
