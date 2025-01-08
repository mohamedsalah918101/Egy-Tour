import 'package:egy_tour/core/utils/constants/constant_variables.dart';
import 'package:egy_tour/core/utils/extensions/media_query.dart';
import 'package:egy_tour/core/utils/theme/app_colors.dart';
import 'package:egy_tour/core/utils/theme/font_styles.dart';
import 'package:egy_tour/features/login/presentation/views/widgets/custom_email_field.dart';
import 'package:egy_tour/features/login/presentation/views/widgets/custom_password_field.dart';
import 'package:egy_tour/features/login/presentation/views/widgets/have_account_login.dart';
import 'package:egy_tour/features/login/presentation/views/widgets/login_push_buttong.dart';
import 'package:egy_tour/features/login/presentation/views/widgets/title_with_changing_lang.dart';
import 'package:flutter/material.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({
    super.key,
  });

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

final _focusNode1 = FocusNode();
final _focusNode2 = FocusNode();

class _LoginBodyState extends State<LoginBody> {
  @override 
  void dispose(){
    _focusNode1.dispose();
    _focusNode2.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        SizedBox(
          height: context.screenHeight * 0.025,
        ),
        const TitleWithLangaugeChanging(),
        SizedBox(
          height: context.screenHeight * 0.125,
        ),
        Text(
          "Welcome To Egypt",
          style: AppTextStyles.bold28,
        ),
        Text(
          secondaryTitle,
          textAlign: TextAlign.center,
          style: AppTextStyles.regular14.copyWith(color: AppColors.grey21),
        ),
        const SizedBox(
          height: 10,
        ),
        CustomEmailWithShadow(
          focusNode: _focusNode1,
        ),
        SizedBox(
          height: 5,
        ),
        CustomPasswordWithShadow(
          focusNode: _focusNode2,
        ),
        Expanded(flex: 2, child: SizedBox()),
        PushLoginButton(),
        Expanded(flex: 2, child: SizedBox()),
        HavingAccountLogin(),
        Expanded(flex: 2, child: SizedBox()),
      ],
    );
  }
}
