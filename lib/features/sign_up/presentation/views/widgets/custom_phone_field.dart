import 'package:egy_tour/core/utils/widget/custom_text_form_field.dart';
import 'package:egy_tour/features/sign_up/presentation/views/widgets/prefix_in_phone_field.dart';
import 'package:egy_tour/features/sign_up/presentation/views/widgets/suffix_in_phone_field.dart';
import 'package:flutter/material.dart';

class CustomPhoneFormField extends StatelessWidget {
  const CustomPhoneFormField({super.key, required this.phoneController});
  final TextEditingController phoneController;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      prefixWidget: PrefixInPhoneFormField(),
      suffixWidget: SuffixInPhoneFormField(),
      controller: phoneController,
      maxLine: 1,
      textInputType: TextInputType.phone,
      label: "Phone Number",
    );
  }
}
