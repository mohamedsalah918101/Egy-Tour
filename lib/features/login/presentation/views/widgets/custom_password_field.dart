import 'package:egy_tour/core/utils/theme/app_colors.dart';
import 'package:egy_tour/core/utils/theme/font_styles.dart';
import 'package:egy_tour/core/utils/widget/custom_box_shadow.dart';
import 'package:egy_tour/core/utils/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class CustomPasswordWithShadow extends StatelessWidget {
  const CustomPasswordWithShadow({
    super.key,
    this.focusNode,
    this.onFieldSubmitted,
    required this.passwordController,
  });
  final FocusNode? focusNode;
  final TextEditingController passwordController;
  final void Function(String?)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        customBoxShadow(),
      ]),
      child: CustomTextFormField(
        validator: (value) {
          if (value != null && value.trim().isEmpty) {
            return 'Password Can\'t be empty ';
          }
          return null;
        },
        onFieldSubmitted: onFieldSubmitted,
        controller: passwordController,
        focusNode: focusNode,
        maxLine: 1,
        textInputAction: TextInputAction.done,
        focusBorderColor: AppColors.lightGrey8,
        label: "Passowrd",
        labelStyle:
            AppTextStyles.regular15.copyWith(color: AppColors.lightGrey8),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        borderRadius: 12,
        borderColor: AppColors.white,
        enableFill: true,
        fillColor: AppColors.white,
        isObeseureText: true,
        prefixWidget: Icon(
          Icons.lock,
          color: AppColors.grey21,
        ),
        suffixWidget: Icon(
          Icons.visibility_off_rounded,
          color: AppColors.grey21,
        ),
      ),
    );
  }
}
