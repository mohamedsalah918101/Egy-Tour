import 'package:egy_tour/core/utils/theme/font_styles.dart';
import 'package:flutter/material.dart';

class HavingAccountLogin extends StatelessWidget {
  const HavingAccountLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don’t have an account?",
          style: AppTextStyles.regular15,
        ),
        Text(
          "Create",
          style: AppTextStyles.regular15
              .copyWith(decoration: TextDecoration.underline),
        ),
      ],
    );
  }
}
