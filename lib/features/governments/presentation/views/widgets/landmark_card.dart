import 'package:egy_tour/core/utils/extensions/media_query.dart';
import 'package:egy_tour/core/utils/theme/app_colors.dart';
import 'package:egy_tour/core/utils/theme/font_styles.dart';
import 'package:flutter/material.dart';

class LandmarkCard extends StatefulWidget {
  const LandmarkCard({
    super.key, 
    required this.imageURL,
    required this.title,
    required this.city
  });

  final String imageURL;
  final String title;
  final String city;

  @override
  State<LandmarkCard> createState() => _LandmarkCardState();
}

class _LandmarkCardState extends State<LandmarkCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.hardEdge,
        margin: EdgeInsets.symmetric(vertical: context.screenWidth*0.025, horizontal: context.screenWidth*0.05),
        elevation: 5,
        color: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(context.screenWidth*0.05),
        ),
        child: InkWell(
          splashColor: AppColors.lightGrey1,
          onTap: () {
            debugPrint('Card tapped.');
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(context.screenWidth*0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  widget.imageURL,
                  height: context.screenHeight * 0.25,
                  fit: BoxFit.cover,
                ),
        
                Padding(
                  padding: EdgeInsets.all(context.screenWidth*0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        widget.title,
                        style: AppTextStyles.bold18.copyWith(color: AppColors.black37)
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.location_pin,
                            color: AppColors.grey21
                          ),
                          SizedBox(width: 5),
                          Text(
                            widget.city,
                            style: AppTextStyles.regular16.copyWith(color: AppColors.darkGrey)
                          ),
                          SizedBox(width: context.screenWidth*0.3),
                          Icon(
                            Icons.favorite_outline,
                            size: 32
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}