import 'package:egy_tour/core/utils/theme/app_colors.dart';
import 'package:egy_tour/core/utils/theme/font_styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      this.maxLine,
      this.validator,
      this.controller,
      this.enableFocusBorder = true,
      this.textInputType,
      this.suffixText,
      this.suffixTextStyle,
      this.labelWidget,
      this.borderColor,
      this.borderRadius,
      this.borderWidth,
      this.prefixWidget,
      this.suffixWidget,
      this.textStyle,
      this.enableFill = true,
      this.fillColor,
      this.label,
      this.isObeseureText = false,
      this.labelStyle,
      this.focusBorderColor,
      this.floatingLabelBehavior, this.focusNode, this.textInputAction});
  final Widget? labelWidget;
  final double? borderRadius;
  final String? Function(String? value)? validator;
  final double? borderWidth;
  final Color? borderColor;
  final Color? fillColor;
  final bool enableFill;
  final Widget? suffixWidget;
  final String? suffixText;
  final TextStyle? suffixTextStyle;
  final Widget? prefixWidget;
  final int? maxLine;
  final TextInputType? textInputType;
  final bool enableFocusBorder;
  final TextEditingController? controller;
  final TextStyle? textStyle;
  final String? label;
  final TextStyle? labelStyle;
  final bool isObeseureText;
  final TextInputAction?textInputAction;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final Color?focusBorderColor;
  final FocusNode?focusNode;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObeseureText,
      validator: validator,
      focusNode: focusNode,
      textInputAction: textInputAction,
      controller: controller,
      maxLines: maxLine,
      keyboardType: textInputType,
      cursorColor: Colors.black,
      style: textStyle,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: labelStyle,
        errorStyle: AppTextStyles.regular12,
        focusColor: Colors.black,
        suffixIcon: suffixWidget,
        suffixText: suffixText,
        suffixStyle: suffixTextStyle,
        fillColor: fillColor ?? AppColors.white,
        filled: enableFill,
        prefixIcon: prefixWidget,
        label: labelWidget,
        floatingLabelBehavior:
            floatingLabelBehavior ?? FloatingLabelBehavior.always,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10),
            borderSide: BorderSide(
              color: borderColor ?? AppColors.lightGrey1,
              width: borderWidth ?? 2,
            )),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10),
            borderSide: BorderSide(
              color: borderColor ?? AppColors.lightGrey1,
              width: borderWidth ?? 2,
            )),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
          borderSide: enableFocusBorder
              ?  BorderSide(
                  color: focusBorderColor?? AppColors.black37,
                  width: 2,
                )
              : BorderSide.none,
        ),
        hoverColor: Colors.white,
      ),
    );
  }
}
