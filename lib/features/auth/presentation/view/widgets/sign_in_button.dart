import 'package:flutter/material.dart';
import 'package:wasil/core/functions/navigate.dart';
import 'package:wasil/features/auth/presentation/view/sign_in_view.dart';

import '../../../../../core/app_constance/app_constance.dart';
import '../../../../../core/app_styles/app_styles.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigate(
          context: context,
          screen: const SignInView(),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Sign In',
              style: AppStyles.style20.copyWith(
                color: AppConstance.primaryAppColor,
              ),
            ),
            const Icon(
              Icons.arrow_forward,
              color: AppConstance.primaryAppColor,
            ),
          ],
        ),
      ),
    );
  }
}
