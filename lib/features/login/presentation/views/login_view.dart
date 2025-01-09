import 'package:easy_localization/easy_localization.dart';
import 'package:egy_tour/features/sign_up/presentation/views/sign_up_view.dart';
import 'package:egy_tour/features/sign_up/presentation/views/test_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../core/utils/theme/app_colors.dart';
import '../../../../core/utils/widget/custom_snack_bar.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool hiddenPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          // Custom curved background
          Positioned(
            left: -110,
            top: -175,
            child: Container(
              width: 342,
              height: 342,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFFF6FD8), // Deep purple
                    Color(0xFF3813C2), // Darker purple
                  ],
                ),
              ),
            ),
          ),

          // Main content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Language selector
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: changeLanguage(),
                      ),
                    ),

                    // Logo text
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0, bottom: 20),
                      child: Text(
                        'login.app_name'.tr(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    // Welcome text
                    const SizedBox(height: 60),

                    Center(
                      child: Text(
                        'login.welcome_title'.tr(),
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'login.welcome_subtitle'.tr(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),

                    // Login form
                    const SizedBox(height: 40),

                    Form(
                        key: _formKey,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            spacing: 20,
                            children: [
                              // Username Field
                              usernameField(),

                              // Password Field
                              passwordField(),

                              SizedBox(
                                height: 25,
                              ),

                              // Login Button
                              loginButton(),

                              SizedBox(
                                height: 20,
                              ),

                              // Don't have Account
                              doNotHaveAccount()
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget changeLanguage() {
    return Container(
      width: 73,
      height: 28,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.blueDark, width: 2),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: DropdownButton<String>(
          value: context.locale.languageCode,
          icon: Icon(Icons.keyboard_arrow_down_sharp),
          items: [
            DropdownMenuItem(
              value: 'en',
              child: const Text(
                'English',
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
              ),
            ),
            DropdownMenuItem(
              value: 'ar',
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: const Text(
                  'العربية',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
          onChanged: (value) {
            setState(() {
              context.setLocale(Locale(value!)); // Update the state
            });
          },
          underline: SizedBox(),
          // Remove default underline
          isExpanded: true,
        ),
      ),
    );
  }

  Widget usernameField() {
    return Material(
      elevation: 4,
      shadowColor: Colors.grey,
      borderRadius: BorderRadius.circular(12),
      color: Colors.white,
      child: TextFormField(
        controller: emailController,
        decoration: InputDecoration(
            labelText: 'login.username'.tr(),
            labelStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            prefixIcon: Icon(
              Icons.person,
              color: Colors.grey,
            )),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your email';
          }
          return null;
        },
      ),
    );
  }

  Widget passwordField() {
    return Material(
      elevation: 4,
      shadowColor: Colors.grey,
      borderRadius: BorderRadius.circular(12),
      color: Colors.white,
      child: TextFormField(
        controller: passwordController,
        obscureText: hiddenPassword,
        decoration: InputDecoration(
          labelText: 'login.password'.tr(),
          labelStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          prefixIcon: Icon(
            Icons.lock,
            color: Colors.grey,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              togglePassword();
            },
            icon: Icon(
              hiddenPassword ? Icons.visibility : Icons.visibility_off,
              color: Colors.black,
            ),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your password';
          }
          if (value.length < 6) {
            return 'Password must be at least 6 characters';
          }
          return null;
        },
      ),
    );
  }

  togglePassword() {
    hiddenPassword = !hiddenPassword;
    setState(() {});
  }

  Widget loginButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            final box = Hive.box('userBox');
            final userData = box.get('user');
            if (userData != null &&
                userData['email'] == emailController.text &&
                userData['password'] == passwordController.text) {
              Navigator.pushReplacement(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  alignment: Alignment.topCenter,
                  duration: Duration(milliseconds: 500),
                  // Navigate it to The Home Screen
                  child: TestScreen(),
                ),
              );
            } else {
              showCustomSnackBar(context, 'Invalid email or password',
                  backgroundColor: AppColors.red);
            }
          } else {
            if (!emailController.text.contains('@')) {
              showCustomSnackBar(context, "Email must contain @",
                  backgroundColor: AppColors.red);
            } else if (passwordController.text.length < 6) {
              showCustomSnackBar(
                  context, "Password must be at least 6 characters",
                  backgroundColor: AppColors.red);
            }
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.blueLight,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          'login.login_button'.tr(),
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget doNotHaveAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${'login.no_account'.tr()} ',
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
        GestureDetector(
          onTap: () {
            // animation using PageTransition Package
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.leftToRight,
                alignment: Alignment.topCenter,
                duration: Duration(milliseconds: 500),
                child: SignUpView(),
              ),
            );
          },
          child: Text(
            'login.create'.tr(),
            style: TextStyle(
                color: Colors.deepPurple,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w600,
                fontSize: 16),
          ),
        ),
      ],
    );
  }
}
