import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wasil/core/functions/navigate.dart';
import 'package:wasil/core/widgets/black_logo.dart';
import 'package:wasil/features/on_boarding/presentation/view/on_boarding_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});


  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        navigateAndRemoveUntil(
          context: context,
          screen: const OnBoardingView(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(child: BlackLogo(
        height: screenSize.height/10,
        width: screenSize.width/10,
      )),
    );
  }
}
