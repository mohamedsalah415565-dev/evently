import 'package:evently_app/widgets/default_text_form_field.dart';
import 'package:evently_app/widgets/event_item.dart';
import 'package:flutter/material.dart';

class FavorateTab extends StatelessWidget {
  const FavorateTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          DefaultTextFormField(
            hintText: 'Search for event',
            onChanged: (qurey) {},
            suffixIconImageName: 'search',
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView.separated(
              itemBuilder: (_, index) => EventItem(),
              itemCount: 10,
              separatorBuilder: (_, _) => SizedBox(height: 10),
            ),
          ),
        ],
      ),
    );
  }
}
