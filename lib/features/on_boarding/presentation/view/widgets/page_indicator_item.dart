import 'package:flutter/material.dart';

class PageIndicatorItem extends StatelessWidget {
  final bool isSelected;

  const PageIndicatorItem({
    super.key,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color: isSelected? Colors.white : const Color(0XFFC3C8CF),
        shape: BoxShape.circle,
      ),
    );
  }
}
