import 'package:flutter/material.dart';
import 'package:wasil/core/app_constance/app_constance.dart';
import 'package:wasil/features/auth/presentation/view/widgets/sign_in_button.dart';
import 'package:wasil/features/auth/presentation/view/widgets/sign_up_button.dart';
import 'package:wasil/features/auth/presentation/view/widgets/white_logo.dart';

class ChooseToLogInOrRegisterView extends StatelessWidget{
  const ChooseToLogInOrRegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppConstance.primaryAppColor,
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                WhiteLogo(),
                SizedBox(
                  height: 100,
                ),
                SignInButton(),
                SizedBox(
                  height: 40,
                ),
                SignUpButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}