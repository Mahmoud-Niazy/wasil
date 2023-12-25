import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../app_assets/app_assets.dart';

class BlackLogo extends StatelessWidget {
  final double height;

  final double width;

  const BlackLogo({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AppAssets.blackLogo,
      width: width,
      height: height,
    );
  }
}
