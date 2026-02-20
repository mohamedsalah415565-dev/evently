import 'package:evently_app/tabs/favorate/favorate_tab.dart';
import 'package:evently_app/tabs/home/home_tab.dart';
import 'package:evently_app/tabs/profile/profile_tab.dart';
import 'package:evently_app/widgets/nav_bar_icon.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  static const String routeName = '/home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  List<Widget> tabs = [HomeTab(), FavorateTab(), ProfileTab()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: tabs[currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: NavBarIcon(imageName: 'home'),
            activeIcon: NavBarIcon(imageName: 'home_active'),
          ),
          BottomNavigationBarItem(
            label: 'Favorate',
            icon: NavBarIcon(imageName: 'heart'),
            activeIcon: NavBarIcon(imageName: 'heart_active'),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: NavBarIcon(imageName: 'profile'),
            activeIcon: NavBarIcon(imageName: 'profile_active'),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add, size: 28),
      ),
    );
  }
}
