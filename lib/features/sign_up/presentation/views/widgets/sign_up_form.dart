import 'package:egy_tour/core/utils/extensions/navigation.dart';
import 'package:egy_tour/core/utils/widget/custom_snack_bar.dart';
import 'package:egy_tour/features/login/presentation/views/widgets/custom_email_field.dart';
import 'package:egy_tour/features/login/presentation/views/widgets/custom_password_field.dart';
import 'package:egy_tour/features/login/presentation/views/widgets/have_account_login.dart';
import 'package:egy_tour/features/login/presentation/views/widgets/login_push_buttong.dart';
import 'package:egy_tour/features/sign_up/presentation/views/widgets/custom_phone_field.dart';
import 'package:egy_tour/features/sign_up/presentation/views/widgets/user_name_field.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.hiddenPassword,
    required this.passwordController,
    required this.onChangeObsecure,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final bool hiddenPassword;
  final TextEditingController passwordController;
  final void Function() onChangeObsecure;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 20,
        children: [
          // Username Field
          UserNameField(
            nameController: nameController,
          ),

          // Email Field
          CustomEmailField(
            emailController: emailController,
            formKey: formKey,
          ),

          // Phone Field
          CustomPhoneFormField(
            phoneController: phoneController,
          ),

          // Password Field
          CustomPasswordWithShadow(
              isObeseureText: hiddenPassword,
              changeObsecureText: onChangeObsecure,
              passwordController: passwordController),

          SizedBox(
            height: 25,
          ),
          // Sign Up Button
          CustomPushButton(
            onTap: () {
              if (formKey.currentState!.validate()) {
                showCustomSnackBar(context, "Success Register");
              }
            },
            title: "Sign Up",
          ),

          SizedBox(
            height: 20,
          ),

          // Already Have Account
          HavingAccountLoginOrSignUp(
            mainText: 'Already Have an Account?',
            actionText: 'Login',
            onTapActionText: () {
              context.pop();
            },
          )
        ],
      ),
    );
  }
}
