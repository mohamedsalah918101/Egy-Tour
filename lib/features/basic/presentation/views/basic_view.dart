import 'package:egy_tour/core/utils/extensions/media_query.dart';
import 'package:egy_tour/core/utils/theme/app_colors.dart';
import 'package:egy_tour/core/utils/theme/font_styles.dart';
import 'package:egy_tour/features/basic/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:egy_tour/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
class BasicView extends StatefulWidget {
  const BasicView({super.key});

  @override
  State<BasicView> createState() => _BasicViewState();
}

class _BasicViewState extends State<BasicView> {
  int selectedIndex = 0;

  late var changeScreen = ({ int currentIndex = 0}) {
    setState(() {
      selectedIndex = currentIndex;
    });
  };

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
      body: Stack(
        children: [
          [
            HomeView(),
            Text("Governments Screen"),
            Text("Favorites Screen"),
            Text("Profile Screen"),
          ][selectedIndex],
          Align(
            alignment: Alignment.bottomCenter,
            child: customBottomNavigationBar(
                context: context,
                changeScreen: changeScreen,
                selectedIndex: selectedIndex,),
          ),
        ],
      ),
    );
  }
}
