import 'package:egy_tour/core/utils/extensions/media_query.dart';
import 'package:egy_tour/core/utils/theme/app_colors.dart';
import 'package:egy_tour/core/utils/theme/font_styles.dart';
import 'package:flutter/material.dart';

class PushLoginButton extends StatelessWidget {
  const PushLoginButton({
    super.key,
    this.onTap,
  });
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: context.screenWidth * 0.7,
        margin: EdgeInsets.symmetric(horizontal: 25),
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: AppColors.blueLight,
        ),
        child: Text(
          "Login",
          textAlign: TextAlign.center,
          style: AppTextStyles.bold18.copyWith(color: AppColors.white),
        ),
      ),
    );
  }
}
