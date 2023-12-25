import 'package:flutter/material.dart';
import 'package:wasil/core/app_constance/app_constance.dart';

class CustomCircularProgressIndicator extends StatelessWidget{
  const CustomCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator(
      backgroundColor: AppConstance.primaryAppColor,
    ));
  }
}