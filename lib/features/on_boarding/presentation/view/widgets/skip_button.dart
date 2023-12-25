import 'package:flutter/material.dart';

import '../../../../../core/app_styles/app_styles.dart';
import '../../../../../core/functions/navigate.dart';
import '../../../../auth/presentation/view/choose_to_log_in_or_register_view.dart';

class SkipButton extends StatelessWidget{
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateAndRemoveUntil(
          context: context,
          screen: const ChooseToLogInOrRegisterView(),
        );
      },
      child: const Row(
        children: [
          Text(
            'Skip',
            style: AppStyles.style22,
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}