import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:egy_tour/core/utils/theme/app_colors.dart';
import 'package:egy_tour/core/utils/widget/custom_snack_bar.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool hiddenPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: arrowBackIcon(),
        actions: [
          changeLanguage(),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20,),
              // Title
              Text(
                'signup.title'.tr(),
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15),
              // Subtitle
              Text(
                'signup.subtitle'.tr(),
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              SizedBox(
                height: 20,
              ),

              // Form
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    spacing: 20,
                    children: [
                      // Username Field
                      usernameField(),

                      // Email Field
                      emailField(),

                      // Phone Field
                      phoneField(),

                      // Password Field
                      passwordField(),

                      SizedBox(
                        height: 25,
                      ),
                      // Sign Up Button
                      signUpButton(),

                      SizedBox(
                        height: 20,
                      ),

                      // Already Have Account
                      alreadyHaveAccount()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget arrowBackIcon() {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.blueDark,
        borderRadius: BorderRadius.circular(50),
      ),
      child: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget changeLanguage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
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
                child: const Text('English',style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),),
              ),
              DropdownMenuItem(
                value: 'ar',
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: const Text('العربية', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),),
                ),
              ),
            ],
            onChanged: (value) {
              setState(() {
                context.setLocale(Locale(value!)); // Update the state
              });
            },
            underline: SizedBox(), // Remove default underline
            isExpanded: true,
          ),
        ),
      ),
    );
  }

  Widget usernameField(){
    return Material(
      elevation: 4,
      shadowColor: Colors.grey,
      borderRadius: BorderRadius.circular(12),
      color: Colors.white,
      child: TextFormField(
        controller: nameController,
        decoration: InputDecoration(
            labelText: 'signup.username'.tr(),
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
            return 'Please enter your full name';
          }
          if (value[0] != value[0].toUpperCase()) {
            return 'First letter must be capitalized';
          }
          return null;
        },
      ),
    );
  }

  Widget emailField() {
    return Material(
      elevation: 4,
      shadowColor: Colors.grey,
      borderRadius: BorderRadius.circular(12),
      color: Colors.white,
      child: TextFormField(
        controller: emailController,
        decoration: InputDecoration(
            labelText: 'signup.email'.tr(),
            labelStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            prefixIcon: Icon(
              Icons.email,
              color: Colors.grey,
            )),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your email';
          }
          if (!value.contains('@')) {
            return 'Email must contain @';
          }
          return null;
        },
      ),
    );
  }

  Widget phoneField() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 4,
              offset: Offset(2, 4),
            )
          ]
      ),
      child: Row(
        children: [
          // Phone Icon
          Padding(
            padding: const EdgeInsets.only(left: 9),
            child: Icon(Icons.phone_android, color: Colors.grey, size: 24),
          ),

          // Country Code
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Text(
              '+20',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),

          // Phone Input
          Expanded(
            child: TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: 'signup.phone'.tr(),
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.transparent), // Transparent border when not focused
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.transparent), // Transparent border when focused
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your number';
                }
                if (value.length < 10) {
                  return 'phone must be at least 10 numbers';
                }
                return null;
              },
            ),
          ),

          // Country Picker
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade200),
              borderRadius: BorderRadius.circular(8),
            ),
            child: CountryCodePicker(
              initialSelection: 'EG',
              showCountryOnly: true,
              showOnlyCountryWhenClosed: true,
              favorite: const ['EG'],
              padding: EdgeInsets.zero,
              flagWidth: 24,
            ),
          ),
        ],
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
          labelText: 'signup.password'.tr(),
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
              hiddenPassword
                  ? Icons.visibility
                  : Icons.visibility_off,
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

  Widget signUpButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: ElevatedButton(
        onPressed: ()  {
          if (_formKey.currentState!.validate()) {
          } else {
            if (nameController.text.isEmpty || nameController.text[0] != nameController.text[0].toUpperCase()) {
              showCustomSnackBar(context, "Full name must start with a capital letter", backgroundColor: AppColors.red);
            } else if (!emailController.text.contains('@')) {
              showCustomSnackBar(context, "Email must contain @", backgroundColor: AppColors.red);
            } else if (passwordController.text.length < 6) {
              showCustomSnackBar(context, "Password must be at least 6 characters", backgroundColor: AppColors.red);
            } else if (phoneController.text.length < 10) {
              showCustomSnackBar(context, "phone must be at least 10 numbers", backgroundColor: AppColors.red);
            }
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.blueDark,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          'signup.signup_button'.tr(),
          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget alreadyHaveAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${'signup.already_have_account'.tr()} ',
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            'signup.login'.tr(),
            style: TextStyle(
                color: Colors.deepPurple,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w600,
                fontSize: 16
            ),
          ),
        ),
      ],
    );
  }

}
