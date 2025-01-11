import 'package:egy_tour/core/utils/extensions/media_query.dart';
import 'package:egy_tour/core/utils/theme/app_colors.dart';
import 'package:egy_tour/core/utils/theme/font_styles.dart';
import 'package:flutter/material.dart';

class CustomBasicDrawer extends StatelessWidget {
  const CustomBasicDrawer({
    super.key,
    required this.userName,
  });
  final String userName;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.lightGrey1,
      width: context.screenWidth * 0.5,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
        child: Column(
          spacing: 10,
          children: [
            CircleAvatar(
              radius: context.screenWidth * 0.15,
              backgroundImage: AssetImage('assets/images/profile.jpg'),
            ),
            Text(
              userName,
              style: AppTextStyles.bold18,
            ),
            Spacer(),
            Divider(
              thickness: 4,
              color: AppColors.white,
            ),
            ListTile(
              title: Text(
                "Logout",
                style: AppTextStyles.regular16,
              ),
              leading: Icon(Icons.logout_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
