import 'package:flutter/material.dart';
import 'package:wasil/core/functions/navigate.dart';
import 'package:wasil/features/auth/presentation/view/sign_up_view.dart';

import '../../../../../core/app_constance/app_constance.dart';
import '../../../../../core/app_styles/app_styles.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigate(
          context: context,
          screen: const SignUpView(),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
            color: AppConstance.primaryAppColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.white,
              width: 2,
            )),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Sign Up',
              style: AppStyles.style20,
            ),
            Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
