import 'package:evently_app/models/category_model.dart';
import 'package:evently_app/tabs/home/tab_items.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});
  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Welcome Back ✨', style: textTheme.titleSmall),
          SizedBox(height: 4),
          Text('UserName', style: textTheme.titleLarge),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 24),
            child: DefaultTabController(
              length: CategoryModel.categories.length + 1,
              child: TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                dividerColor: Colors.transparent,
                indicatorColor: Colors.transparent,
                labelPadding: EdgeInsets.only(left: 8),
                tabs: [
                  TabItems(
                    label: 'all',
                    icon: Icons.category_outlined,
                    isSelected: currentIndex == 0,
                  ),
                  ...CategoryModel.categories.map(
                    (category) => TabItems(
                      label: category.name,
                      icon: category.icon,
                      isSelected:
                          currentIndex ==
                          CategoryModel.categories.indexOf(category) + 1,
                    ),
                  ),
                ],

                onTap: (index) {
                  if (currentIndex == index) return;
                  currentIndex = index;
                  setState(() {});
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
