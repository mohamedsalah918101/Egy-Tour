import 'package:easy_localization/easy_localization.dart';
import 'package:egy_tour/core/utils/theme/app_colors.dart';
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
        title: Container(
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
        ),
        actions: [
          Padding(
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
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20,),
              Text(
                'signup.title'.tr(),
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15),
              Text(
                'signup.subtitle'.tr(),
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              SizedBox(
                height: 20,
              ),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    spacing: 20,
                    children: [
                      TextFormField(
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
                      TextFormField(
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

                      TextFormField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.mobile_screen_share,
                            color: Colors.grey,
                          ),
                          labelText: 'signup.phone'.tr(),
                          labelStyle: TextStyle(color: Colors.grey),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset('assets/images/egypt_flag.png', width: 30),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty || value.length < 11) {
                            return 'Please enter your number correctly';
                          }
                          return null;
                        },
                      ),

                      TextFormField(
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
                      SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                            } else {
                              if (nameController.text.isEmpty ||
                                  nameController.text[0] !=
                                      nameController.text[0].toUpperCase()) {
                                showErrorSnackBar(
                                    "Full name must start with a capital letter");
                              } else if (!emailController.text.contains('@')) {
                                showErrorSnackBar("Email must contain @");
                              } else if (passwordController.text.length < 6) {
                                showErrorSnackBar(
                                    "Password must be at least 6 characters");
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
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
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
                      )
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

  togglePassword() {
    hiddenPassword = !hiddenPassword;
    setState(() {});
  }

  showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
    ));
  }
}
