import 'package:evently_app/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TabItems extends StatelessWidget {
  final bool isSelected;

  const TabItems({super.key, required this.isSelected});
  
  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? primaryColor : AppTheme.background,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/icons/sport.svg',
            colorFilter: ColorFilter.mode(
              isSelected ? AppTheme.background : primaryColor,
              BlendMode.srcIn,
            ),
          ),
          SizedBox(width: 8),
          Text(
            'Sport',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: isSelected ? AppTheme.white : AppTheme.black,
            ),
          ),
        ],
      ),
    );
  }
}
