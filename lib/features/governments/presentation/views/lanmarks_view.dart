import 'package:egy_tour/core/utils/extensions/media_query.dart';
import 'package:egy_tour/core/utils/extensions/navigation.dart';
import 'package:egy_tour/core/utils/theme/app_colors.dart';
import 'package:egy_tour/features/governments/presentation/views/widgets/landmark_card.dart';
import 'package:flutter/material.dart';

class LandmarkView extends StatefulWidget {
  const LandmarkView({
    super.key,
    required this.government
  });

  final String government;

  @override
  State<LandmarkView> createState() => _LandmarkViewState();
}

class _LandmarkViewState extends State<LandmarkView> {
  Map landmarks = {
    "Alexandria, Egypt": [
      {
        "title": "Citadel of Qaitbay",
        "url": "assets/images/Citadel_of_Qaitbay.jpg"
      },
      {
        "title": "Al Montazah Palace",
        "url": "assets/images/Al_Montazah_Palace.jpg"
      }
    ],
    "Giza, Egypt": [
      {
        "title": "Pyramids of Giza",
        "url": "assets/images/pyramids.jpg"
      },
      {
        "title": "The Sphinx",
        "url": "assets/images/sphinx.jfif"
      }
    ],
    "Luxor, Egypt": [
      {
        "title": "Karnak Temple",
        "url": "assets/images/Karnak_Temple.jpg"
      },
      {
        "title": "Queen Hatshepsut Temple",
        "url": "assets/images/Queen_Hatshepsut_Temple.jpg"
      }
    ]
  };

  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      appBar: AppBar(
        leadingWidth: context.screenWidth*0.25,
        leading: IconButton(
          onPressed: () {
            context.pop();
          }, 
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.white,
            size: 32
          ),
          style:  ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.blueDark),
          )
        ),

        titleSpacing: context.screenWidth*0.3,
        
      ),
      body: Container(
        color: AppColors.white,
        width: context.screenWidth,
        child: ListView.builder(
          itemCount: landmarks[widget.government].length,
          itemBuilder: (context, index) {
            return LandmarkCard(
              imageURL: landmarks[widget.government][index]['url'],
              title: landmarks[widget.government][index]['title'],
              city: widget.government,
            );
          },
        ),
      )
    );
  }
}