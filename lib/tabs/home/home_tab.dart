import 'package:evently_app/firebase_service.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:evently_app/tabs/home/home_header.dart';
import 'package:evently_app/widgets/event_item.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<EventModel> events = [];
  @override
  Widget build(BuildContext context) {
    if (events.isEmpty) {
      getEvent();
    }
    return Column(
      children: [
        HomeHeader(),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (_, index) => EventItem(events[index]),
            itemCount: events.length,
            separatorBuilder: (_, _) => SizedBox(height: 10),
          ),
        ),
      ],
    );
  }

  Future<void> getEvent() async {
    events = await FirebaseService.getEvents();
    setState(() {});
  }
}
