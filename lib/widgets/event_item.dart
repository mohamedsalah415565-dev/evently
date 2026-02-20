import 'package:evently_app/app_theme.dart';
import 'package:flutter/material.dart';

class EventItem extends StatelessWidget {
  const EventItem({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);
    TextTheme textTheme = Theme.of(context).textTheme;
    Color primaryColor = Theme.of(context).primaryColor;
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(16),
          child: Image.asset(
            'assets/images/sport.png',
            height: screenSize.height * 0.23,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppTheme.background,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            '21 jan',
            style: textTheme.titleMedium!.copyWith(
              color: primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        Positioned(
          width: screenSize.width - 48,
          left: 8,
          bottom: 8,
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppTheme.background,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'This is a Birthday Party ',
                    style: textTheme.titleSmall!.copyWith(
                      color: AppTheme.black,
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Icon(Icons.favorite_outlined, color: primaryColor),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
