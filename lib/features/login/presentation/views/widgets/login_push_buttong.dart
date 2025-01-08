import 'package:egy_tour/core/utils/theme/app_colors.dart';
import 'package:egy_tour/core/utils/theme/font_styles.dart';
import 'package:flutter/material.dart';

class PushLoginButton extends StatelessWidget {
  const PushLoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25),
      padding: EdgeInsets.symmetric(vertical: 6),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: AppColors.blueLight,
      ),
      child: Center(
          child: Text(
        "Login",
        style: AppTextStyles.bold18.copyWith(color: AppColors.white),
      )),
    );
  }
}
