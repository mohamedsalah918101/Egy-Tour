import 'package:egy_tour/core/utils/constants/constant_variables.dart';
import 'package:egy_tour/core/utils/widget/custom_places_card.dart';
import 'package:egy_tour/features/home/data/models/place_model.dart';
import 'package:flutter/material.dart';

class FavouritesView extends StatefulWidget {
  const FavouritesView({super.key});

  @override
  State<FavouritesView> createState() => _FavouritesViewState();
}

class _FavouritesViewState extends State<FavouritesView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 150 / 180,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return PlaceCard(
            placeModel: List.generate(
                10,
                (index) => PlaceModel(
                    name: "Egyptian Meusem",
                    location: "Cairo,Egypt",
                    imageUrl: placeHolderImage,
                    isFavorite: false))[index],
          );
        });
  } //q
}
