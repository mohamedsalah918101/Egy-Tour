import 'package:egy_tour/core/utils/extensions/media_query.dart';
import 'package:egy_tour/core/utils/theme/app_colors.dart';
import 'package:egy_tour/core/utils/theme/font_styles.dart';
import 'package:egy_tour/features/basic/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:egy_tour/features/governments/presentation/views/government_view.dart';
import 'package:egy_tour/features/home/presentation/views/home_view.dart';
import 'package:egy_tour/features/profile/presentation/views/profile_view.dart';
import 'package:egy_tour/features/sign_up/data/models/user_model.dart';
import 'package:flutter/material.dart';

import '../../../favourites/presentation/views/favourites_view.dart';

class BasicView extends StatefulWidget {
  const BasicView({super.key, this.userModel});
  final User? userModel;
  @override
  State<BasicView> createState() => _BasicViewState();
}

class _BasicViewState extends State<BasicView> {
  int selectedIndex = 0;

  late var changeScreen = ({int currentIndex = 0}) {
    setState(() {
      selectedIndex = currentIndex;
    });
  };
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      drawer: selectedIndex == 3
          ? null
          : Drawer(
              backgroundColor: AppColors.lightGrey1,
              width: context.screenWidth * 0.66,
            ),
      appBar: selectedIndex == 3
          ? null
          : AppBar(
              backgroundColor: AppColors.white,
              title: Text(
                "Egy-Tour",
                style: AppTextStyles.bold36,
              ),
            ),
      body: Column(
        children: [
          [
            Expanded(child: HomeView()),
            Expanded(child: GovernmentView()),
            Expanded(child: FavouritesView()),
            Expanded(child: ProfileScreen()),
          ][selectedIndex],
          Align(
            alignment: Alignment.bottomCenter,
            child: customBottomNavigationBar(
              context: context,
              changeScreen: changeScreen,
              selectedIndex: selectedIndex,
            ),
          ),
        ],
      ),
    );
  }
}
