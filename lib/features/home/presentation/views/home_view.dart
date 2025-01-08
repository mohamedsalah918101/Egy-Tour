import 'package:egy_tour/core/utils/constants/constant_variables.dart';
import 'package:egy_tour/core/utils/extensions/media_query.dart';
import 'package:egy_tour/core/utils/theme/font_styles.dart';
import 'package:egy_tour/features/home/presentation/views/widgets/places_card.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: context.screenHeight * 0.005),
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 33, right: 33),
              child: TabBar(
                dividerColor: Colors.black,
                dividerHeight: 1,
                indicatorColor: Colors.black,
                labelColor: Colors.black,
                tabs: [
                  Tab(
                    child: Text(
                      "Suggested Places",
                      style: AppTextStyles.regular16,
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Popular Places",
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
                    itemCount: places.length,
                    itemBuilder: (context, index) {
                      return PlaceCard(
                        name: places[index].name,
                        location: places[index].location,
                        imageUrl: places[index].imageUrl,
                        isFavorite: places[index].isFavorite,
                      );
                    },
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 250,
                        child: ListView.builder(
                          itemCount: places.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return PlaceCard(
                              name: places[index].name,
                              location: places[index].location,
                              imageUrl: places[index].imageUrl,
                              isFavorite: places[index].isFavorite,
                            );
                          },
                        ),
                      ),
                      // SizedBox(
                      //   height: 452,
                      // ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
