import 'dart:developer';

import 'package:egy_tour/core/utils/extensions/media_query.dart';
import 'package:egy_tour/core/utils/theme/app_colors.dart';
import 'package:egy_tour/core/utils/widget/custom_text_form_field.dart';
import 'package:egy_tour/features/profile/presentation/views/widgets/custom_clip_path.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _state = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _nameController.text = 'Ahmed';
    _emailController.text = 'example.com';
    _phoneController.text = '1234567890';
    _passwordController.text = 'password';
    log('ProfileScreen build ${context.screenHeight * 0.3}');
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: context.isLandscape
                ? context.screenHeight * 0.5
                : context.screenHeight * 0.3,
            child:
                // Top section with clip-path
                Stack(
              children: [
                ClipPath(
                  clipper: CustomClipPath(),
                  child: Container(
                    height: context.screenHeight * 0.3,
                    color: AppColors.blueDark,
                  ),
                ),
                // Profile Image and Edit Icon
                Positioned(
                  top: context.screenHeight * 0.16,
                  left: context.screenWidth * 0.5 - 60,
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage(
                            'assets/images/profile.jpg'), // Replace with your image
                      ),
                      Positioned(
                        bottom: 5,
                        right: 5,
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.white,
                          child:
                              Icon(Icons.edit, size: 15, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Form(
            key: _state,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                children: [
                  CustomTextFormField(
                    prefixWidget: Icon(Icons.person, color: AppColors.black37),
                    controller: _nameController,
                    enabled: false,
                    textStyle: TextStyle(color: AppColors.black37),
                    borderColor: AppColors.white,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    prefixWidget: Icon(
                      Icons.email,
                      color: AppColors.black37,
                    ),
                    controller: _emailController,
                    borderColor: AppColors.white,
                    enabled: false,
                    textStyle: TextStyle(color: AppColors.black37),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    prefixWidget: Icon(
                      Icons.phone,
                      color: AppColors.black37,
                    ),
                    controller: _phoneController,
                    borderColor: AppColors.white,
                    enabled: false,
                    textStyle: TextStyle(color: AppColors.black37),
                    suffixWidget: Padding(
                      padding: const EdgeInsets.all(
                        8.0,
                      ),
                      child: SizedBox(
                        width: 80,
                        height: 30, // Set a fixed width for the dropdown
                        // Add some padding if needed
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 8), // Adjust padding
                          ),
                          value: '+20',
                          items: const [
                            DropdownMenuItem(
                              value: '+20',
                              child: Text('+20'),
                            ),
                            DropdownMenuItem(
                              value: '+1',
                              child: Text('+1'),
                            ),
                          ],
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  CustomTextFormField(
                    prefixWidget: Icon(Icons.lock, color: AppColors.black37),
                    controller: _passwordController,
                    borderColor: AppColors.white,
                    enabled: false,
                    textStyle: TextStyle(color: AppColors.black37),
                    isObeseureText: true,
                    maxLine: 1,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
  }
}

// Custom Clipper for the background
