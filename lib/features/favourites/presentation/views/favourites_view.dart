import 'package:egy_tour/core/utils/constants/constant_variables.dart';
import 'package:egy_tour/core/utils/widget/custom_places_card.dart';
import 'package:flutter/material.dart';

import '../../../home/data/models/place_model.dart';

class FavouritesView extends StatefulWidget {
  const FavouritesView({super.key});

  @override
  State<FavouritesView> createState() => _FavouritesViewState();
}

class _FavouritesViewState extends State<FavouritesView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          Place item = favorites[index];
          return PlaceCard(
              name: item.name,
              location: item.location,
              imageUrl: item.imageUrl,
              isFavorite: item.isFavorite);
        });
  }//q
}
