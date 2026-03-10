import 'package:evently_app/models/category_model.dart';
import 'package:evently_app/tabs/home/tab_items.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: CategoryModel.categories.length + 1,
      vsync: this,
    );
    tabController.addListener(() {
      if (!tabController.indexIsChanging) return;
      setState(() {
        currentIndex = tabController.index;
      });
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Welcome Back ✨', style: textTheme.titleSmall),
          const SizedBox(height: 4),
          Text('UserName', style: textTheme.titleLarge),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: TabBar(
              controller: tabController,
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              dividerColor: Colors.transparent,
              indicatorColor: Colors.transparent,
              labelPadding: const EdgeInsets.only(left: 8),
              tabs: [
                TabItems(
                  label: 'all',
                  icon: Icons.category_outlined,
                  isSelected: currentIndex == 0,
                ),
                ...CategoryModel.categories.map((category) {
                  final index = CategoryModel.categories.indexOf(category) + 1;
                  return TabItems(
                    label: category.name,
                    icon: category.icon,
                    isSelected: currentIndex == index,
                  );
                }),
              ],
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                  // Optionally, do something with selected category:
                  // final selectedCategory =
                  //     index == 0 ? null : CategoryModel.categories[index - 1];
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
