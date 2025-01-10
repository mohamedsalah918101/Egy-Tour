import 'package:egy_tour/core/utils/theme/font_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HavingAccountLogin extends StatelessWidget {
  const HavingAccountLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(
      text: "Don’t have an account?",
      style: AppTextStyles.regular15,
      children: [
        TextSpan(
          text: "Create",
          style: AppTextStyles.regular15
              .copyWith(decoration: TextDecoration.underline),
          recognizer: TapGestureRecognizer()..onTap = () {},
        ),
      ],
    ));
  }
}
