import 'package:flutter/material.dart';
import 'package:wasil/core/app_constance/app_constance.dart';

import '../../../../../core/app_styles/app_styles.dart';
import 'custom_icon_button.dart';

//ignore: must_be_immutable
class CustomTextFormField extends StatefulWidget {
  final String title;
  bool isPassword;
  final bool isSuffixIconShown;
  final TextInputType? keyboardType ;
  final String? Function(String?)? validator ;
  final TextEditingController controller ;

  CustomTextFormField({
    super.key,
    required this.title,
    this.isPassword = false,
    this.isSuffixIconShown = false,
    this.keyboardType,
    required this.validator,
    required this.controller,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color(0xFF898A8D),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15,),
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        keyboardType: widget.keyboardType ,
        decoration: InputDecoration(
          border: InputBorder.none,
          label: Text(
              widget.title,
            style: const TextStyle(
              color: AppConstance.primaryAppColor,
            ),
          ),
          hintStyle: AppStyles.style18.copyWith(
            fontSize: 16,
          ),
          suffixIcon: widget.isSuffixIconShown == true
              ? CustomIconButton(
                  onPressed: () {
                    setState(() {
                      widget.isPassword = !widget.isPassword;
                    });
                  },
                  icon: widget.isPassword
                      ? Icons.remove_red_eye_outlined
                      : Icons.visibility_off_outlined,
                )
              : null,
        ),
        obscureText: widget.isPassword,
      ),
    );
  }
}

