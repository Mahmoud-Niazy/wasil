import 'package:flutter/material.dart';
import 'package:wasil/core/api_services/api_services.dart';
import 'package:wasil/core/service_locator/service_locator.dart';
import 'package:wasil/features/splash/presentation/view/splash_view.dart';

void main(){
  ApiServices.init();
  ServicesLocator().init();
  runApp(const Wasil());
}

class Wasil extends StatelessWidget{
  const Wasil({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}