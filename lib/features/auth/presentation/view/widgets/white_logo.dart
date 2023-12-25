import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/app_assets/app_assets.dart';

class WhiteLogo extends StatelessWidget{
  const WhiteLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AppAssets.whiteLogo,
    );
  }
}