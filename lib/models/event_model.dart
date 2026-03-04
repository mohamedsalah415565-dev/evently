import 'package:evently_app/models/category_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {
  String id;
  CategoryModel category;
  String title;
  String description;
  DateTime dateTime;

  EventModel({
    this.id = '',
    required this.title,
    required this.description,
    required this.dateTime,
    required this.category,
  });

  EventModel.fromJson(Map<String, dynamic> json)
    : this(
        id: json['id'] ?? '',
        title: json['title'] ?? '',
        description: json['description'] ?? '',
        dateTime: (json['timestamp'] as Timestamp).toDate(),
        category: CategoryModel.categories.firstWhere(
          (category) => category.id == json['categoryId'],
        ),
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'categoryId': category.id,
    'timestamp': Timestamp.fromDate(dateTime),
  };
}
