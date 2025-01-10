import 'package:flutter/material.dart';

import '../../../features/home/data/models/place_model.dart';

const String fontFamily = 'Almarai';

const String placeHolderImage = "assets/images/placeholder.jpg";

const List<IconData> unSelectedIcons = [
  Icons.home_outlined,
  Icons.location_on_outlined,
  Icons.favorite_outline,
  Icons.person_outlined,
];

const List<IconData> selectedIcons = [
  Icons.home,
  Icons.location_on,
  Icons.favorite,
  Icons.person,
];

List<Place> places = [
  Place(
      name: 'Egyptian Museum',
      location: "Cairo, Egypt",
      imageUrl: placeHolderImage,
      isFavorite: false),
  Place(
      name: 'Egyptian Museum',
      location: "Cairo, Egypt",
      imageUrl: placeHolderImage,
      isFavorite: false),
  Place(
      name: 'Egyptian Museum',
      location: "Cairo, Egypt",
      imageUrl: placeHolderImage,
      isFavorite: false),
  Place(
      name: 'Egyptian Museum',
      location: "Cairo, Egypt",
      imageUrl: placeHolderImage,
      isFavorite: false),
  Place(
      name: 'Egyptian Museum',
      location: "Cairo, Egypt",
      imageUrl: placeHolderImage,
      isFavorite: false),
  Place(
      name: 'Egyptian Museum',
      location: "Cairo, Egypt",
      imageUrl: placeHolderImage,
      isFavorite: false),
];

List <Place> favorites=[

];