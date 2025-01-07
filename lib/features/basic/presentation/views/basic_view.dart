import 'package:egy_tour/core/utils/extensions/media_query.dart';
import 'package:egy_tour/core/utils/theme/app_colors.dart';
import 'package:egy_tour/core/utils/theme/font_styles.dart';
import 'package:flutter/material.dart';

List<IconData> selectedIcons = [
  Icons.home,
  Icons.location_on,
  Icons.favorite,
  Icons.person,
];

List<IconData> unSelectedIcons = [
  Icons.home_outlined,
  Icons.location_on_outlined,
  Icons.favorite_outline,
  Icons.person_outlined,
];
List<Widget> screens = [
  Text("screen1"),
  Text("screen2"),
  Text("screen3"),
  Text("screen4"),
];
int selectedIndex = 0;

class BasicView extends StatefulWidget {
  const BasicView({super.key});

  @override
  State<BasicView> createState() => _BasicViewState();
}

class _BasicViewState extends State<BasicView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      drawer: selectedIndex == 3
          ? null
          : Drawer(
              backgroundColor: AppColors.lightGrey1,
              width: MediaQueryValues(context).screenWidth * 0.66,
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Center(child: screens[selectedIndex])],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: customBottomNavigationBar(context),
          ),
        ],
      ),
    );
  }

  Widget customBottomNavigationBar(context) {
    return Container(
      margin: EdgeInsets.only(
        left: MediaQueryValues(context).screenWidth * 0.057,
        right: MediaQueryValues(context).screenWidth * 0.057,
        bottom: MediaQueryValues(context).screenHeight * 0.024,
      ),
      width: MediaQueryValues(context).screenWidth * 0.88,
      height: MediaQueryValues(context).screenHeight * 0.071,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(colors: [
          AppColors.blueLight,
          AppColors.purple,
        ]),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: unSelectedIcons.map((icon) {
          int currentIndex = unSelectedIcons.indexOf(icon);
          bool isSelected = selectedIndex == currentIndex;
          return Expanded(
            child: Material(
              color: Colors.transparent,
              child: GestureDetector(
                onTap: () {
                  selectedIndex = currentIndex;
                  setState(() {});
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      isSelected
                          ? selectedIcons[currentIndex]
                          : unSelectedIcons[currentIndex],
                      size: 25,
                      color: AppColors.white,
                    ),
                    SizedBox(
                      height: MediaQueryValues(context).screenHeight * 0.005,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        bottom: MediaQueryValues(context).screenHeight * 0.002,
                      ),
                      height: MediaQueryValues(context).screenHeight * 0.006,
                      width: MediaQueryValues(context).screenWidth * 0.09,
                      decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.white
                              : AppColors.white.withAlpha(0),
                          borderRadius: BorderRadius.circular(4)),
                    )
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
