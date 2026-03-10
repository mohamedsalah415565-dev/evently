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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HomeHeader(),
        Expanded(
          child: StreamBuilder<List<EventModel>>(
            stream: FirebaseService.streamEvents(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return const Center(child: Text("Something went wrong"));
              }

              final events = snapshot.data ?? [];

              if (events.isEmpty) {
                return const Center(child: Text("No Events Yet"));
              }

              return ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: events.length,
                itemBuilder: (_, index) => EventItem(events[index]),
                separatorBuilder: (_, __) => const SizedBox(height: 10),
              );
            },
          ),
        ),
      ],
    );
  }
}
