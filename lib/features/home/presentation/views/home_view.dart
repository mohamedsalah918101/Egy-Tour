import 'package:easy_localization/easy_localization.dart';
import 'package:egy_tour/core/utils/constants/constant_variables.dart';
import 'package:egy_tour/core/utils/theme/app_colors.dart';
import 'package:egy_tour/core/utils/theme/font_styles.dart';
import 'package:egy_tour/core/utils/widget/custom_places_card.dart';
import 'package:egy_tour/features/home/data/models/place_model.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 33, right: 33),
            child: TabBar(
              dividerColor: AppColors.black37,
              dividerHeight: 1.5,
              indicatorColor: AppColors.black37,
              labelColor: AppColors.black37,
              tabs: [
                Tab(
                  child: Text(
                    "home.suggestedPlaces".tr(),
                    style: AppTextStyles.regular16,
                  ),
                ),
                Tab(
                  child: Text(
                    "home.popularPlaces".tr(),
                    style: AppTextStyles.regular16,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: TabBarView(
              children: [
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 150 / 190),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return PlaceCard(
                      placeModel: List.generate(
                          10,
                          (index) => PlaceModel(
                              name: "Egyptian Muesem",
                              location: "Egypt,Cairo",
                              imageUrl: placeHolderImage,
                              isFavorite: true))[index],
                    );
                  },
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 250,
                      child: ListView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return PlaceCard(
                            placeModel: List.generate(
                                10,
                                (index) => PlaceModel(
                                    name: "Egyptian Muesem",
                                    location: "Egypt,Cairo",
                                    imageUrl: placeHolderImage,
                                    isFavorite: true))[index],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
