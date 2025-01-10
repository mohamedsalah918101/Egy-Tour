import 'package:egy_tour/core/utils/theme/app_colors.dart';
import 'package:egy_tour/core/utils/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class CustomPasswordWithShadow extends StatelessWidget {
  const CustomPasswordWithShadow({
    super.key,
    this.focusNode,
    this.onFieldSubmitted,
    required this.passwordController,
    required this.isObeseureText,
    required this.changeObsecureText,
  });
  final FocusNode? focusNode;
  final TextEditingController passwordController;
  final void Function(String?)? onFieldSubmitted;
  final bool isObeseureText;
  final void Function() changeObsecureText;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
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
        label: "Passowrd",
        borderRadius: 12,
        enableFill: true,
        isObeseureText: isObeseureText,
        prefixWidget: Icon(
          Icons.lock,
          color: AppColors.grey21,
        ),
        suffixWidget: IconButton(
          onPressed: changeObsecureText,
          icon: Icon(
            isObeseureText
                ? Icons.visibility_off_rounded
                : Icons.visibility_rounded,
            color: AppColors.grey21,
          ),
        ));
  }
}
