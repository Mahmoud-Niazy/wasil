import 'package:flutter/material.dart';

import '../../../../../core/app_styles/app_styles.dart';
import 'custom_icon_button.dart';

//ignore: must_be_immutable
class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final String label ;
  bool isPassword;
  final bool isSuffixIconShown;
  final TextInputType? keyboardType ;
  final String? Function(String?)? validator ;
  final TextEditingController controller ;
  final bool isPhoneNumber ;

  CustomTextFormField({
    super.key,
    required this.hintText,
    this.isPassword = false,
    this.isSuffixIconShown = false,
    this.keyboardType,
    required this.validator,
    required this.controller,
    this.isPhoneNumber = false,
    required this.label,
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
      child: Padding(
        padding: const EdgeInsets.only(
          top: 5,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.label,
              style: AppStyles.style11,
            ),
            Row(
              children: [
                if(widget.isPhoneNumber)
                  const Row(
                    children: [
                      Text(
                        '+962',
                        style: AppStyles.style14,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),

                Expanded(
                  child: TextFormField(
                    controller: widget.controller,
                    validator: widget.validator,
                    keyboardType: widget.keyboardType ,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: widget.hintText,
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

