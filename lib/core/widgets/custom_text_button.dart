import 'package:flutter/material.dart';

import '../app_styles/app_styles.dart';

class CustomTextButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  final Color titleColor;

  const CustomTextButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: AppStyles.style13.copyWith(
          color: titleColor,
        ),
      ),
    );
  }
}
