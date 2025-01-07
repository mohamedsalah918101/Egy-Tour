import 'package:egy_tour/core/utils/extensions/media_query.dart';
import 'package:egy_tour/features/governments/presentation/views/widgets/government_card.dart';
import 'package:flutter/material.dart';

class GovernmentView extends StatefulWidget {
  const GovernmentView({super.key});

  @override
  State<GovernmentView> createState() => _GovernmentViewState();
}

class _GovernmentViewState extends State<GovernmentView> {
  List governments = [
    {
      "title": "Alexandria, Egypt",
      "description": "A bustling coastal city with a rich history, once home to the legendary Library of Alexandria and the ancient Lighthouse of Pharos.",
      "url": "assets/images/Flag_of_Alexandria.png"
    },
    {
      "title": "Giza, Egypt",
      "description": "A vibrant metropolis known for its rich history and proximity to iconic landmarks like the Great Pyramids of Giza and the Sphinx.",
      "url": "assets/images/Flag_of_Giza_Governorate.png"
    },
    {
      "title": "Luxor, Egypt",
      "description": "Referred to as the \"world's greatest open-air museum,\" is renowned for its ancient monuments, including the Valley of the Kings, Karnak Temple, and Luxor Temple.",
      "url": "assets/images/Flag_of_Luxor_Governorate.png"
    }
  ];

  @override
  Widget build(BuildContext context) {    
    return SizedBox(
      width: context.screenWidth,
      height: context.screenHeight*0.8,
      child: ListView.builder(
        itemCount: governments.length,
        itemBuilder: (context, index) {
          return GovernmentCard(
            imageURL: governments[index]['url'],
            title: governments[index]['title'],
            description: governments[index]['description'],
          );
        },
      ),
    );
  }
}