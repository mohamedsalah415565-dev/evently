import 'package:evently_app/tabs/home/home_header.dart';
import 'package:evently_app/widgets/event_item.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeHeader(),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (_, index) => EventItem(),
            itemCount: 10,
            separatorBuilder: (_, _) => SizedBox(height: 10),
          ),
        ),
      ],
    );
  }
}
