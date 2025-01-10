import 'package:egy_tour/core/utils/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class UserNameField extends StatelessWidget {
  const UserNameField({
    super.key,
    required this.nameController,
  });

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: nameController,
      label: "User Name",
      prefixWidget: Icon(
        Icons.person,
        color: Colors.grey,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your full name';
        }
        if (value[0] != value[0].toUpperCase()) {
          return 'First letter must be capitalized';
        }
        return null;
      },
    );
  }
}
