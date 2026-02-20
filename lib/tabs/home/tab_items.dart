import 'package:evently_app/app_theme.dart';
import 'package:flutter/material.dart';

class TabItems extends StatelessWidget {
  final bool isSelected;
  final String label;
  final IconData icon;

  const TabItems({
    super.key,
    required this.label,
    required this.icon,
    required this.isSelected,
  });

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
          Icon(icon, color: isSelected ? AppTheme.white : AppTheme.black),
          SizedBox(width: 8),
          Text(
            label,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: isSelected ? AppTheme.white : AppTheme.black,
            ),
          ),
        ],
      ),
    );
  }
}
