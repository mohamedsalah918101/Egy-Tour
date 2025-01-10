import 'package:egy_tour/core/utils/constants/constant_variables.dart';
import 'package:egy_tour/core/utils/extensions/media_query.dart';
import 'package:egy_tour/core/utils/theme/app_colors.dart';
import 'package:egy_tour/core/utils/theme/font_styles.dart';
import 'package:egy_tour/core/utils/widget/custom_snack_bar.dart';
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
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final formKey = GlobalKey<FormState>();

class _LoginBodyState extends State<LoginBody> {
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    _focusNode1.dispose();
    _focusNode2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
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
                  style:
                      AppTextStyles.regular14.copyWith(color: AppColors.grey21),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomEmailWithShadow(
                  emailController: emailController,
                  focusNode: _focusNode1,
                ),
                SizedBox(
                  height: 5,
                ),
                CustomPasswordWithShadow(
                  onFieldSubmitted: (value) {
                    _focusNode2.unfocus();
                    if (formKey.currentState!.validate()) {
                      showCustomSnackBar(context, "SuccessLogin");
                    }
                  },
                  passwordController: passwordController,
                  focusNode: _focusNode2,
                ),

              SizedBox(height: 10,)
              ],
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                PushLoginButton(
                  onTap: () {
                    _focusNode1.unfocus();
                    _focusNode2.unfocus();
                    if (formKey.currentState!.validate()) {
                      showCustomSnackBar(context, "SuccessLogin");
                    }
                  },
                ),
                HavingAccountLogin(),
                SizedBox()
              ],
            ),
          ),
         
        ],
      ),
    );
  }
}
