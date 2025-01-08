import 'package:egy_tour/core/utils/theme/app_colors.dart';
import 'package:egy_tour/core/utils/theme/font_styles.dart';
import 'package:egy_tour/core/utils/widget/custom_box_shadow.dart';
import 'package:egy_tour/core/utils/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class CustomEmailWithShadow extends StatelessWidget {
  const CustomEmailWithShadow({super.key, this.focusNode});
  final FocusNode? focusNode;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        customBoxShadow(),
      ]),
      child: CustomTextFormField(
        focusNode: focusNode,
        textInputAction: TextInputAction.next,
        maxLine: 1,
        label: "Email",
        focusBorderColor: AppColors.lightGrey8,
        labelStyle:
            AppTextStyles.regular15.copyWith(color: AppColors.lightGrey8),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        borderRadius: 12,
        borderColor: AppColors.white,
        enableFill: true,
        fillColor: AppColors.white,
        prefixWidget: Icon(
          Icons.email_rounded,
          color: AppColors.grey21,
        ),
      ),
    );
  }
}
