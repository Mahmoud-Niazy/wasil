import 'package:flutter/material.dart';

import '../../../../../core/app_constance/app_constance.dart';
import '../../../../../core/app_styles/app_styles.dart';

//ignore: must_be_immutable
class CustomCheckBocListTile extends StatefulWidget {
  final String title;

  bool isSelected;

  CustomCheckBocListTile({
    super.key,
    required this.title,
    this.isSelected = true,
  });

  @override
  State<CustomCheckBocListTile> createState() => _CustomCheckBocListTileState();
}

class _CustomCheckBocListTileState extends State<CustomCheckBocListTile> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: widget.isSelected,
          onChanged: (value) {
            setState(() {
              widget.isSelected = value!;
            });
          },
          activeColor: AppConstance.primaryAppColor,
        ),
        const Text(
          'Remember me ',
          style: AppStyles.style13,
        ),
      ],
    );
  }
}
