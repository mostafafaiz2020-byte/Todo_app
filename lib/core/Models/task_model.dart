// core/Models/task_model.dart
import 'package:hive_flutter/adapters.dart';
part 'task_model.g.dart';

@HiveType(typeId: 6)
class TaskModel {
  @HiveField(1)
  String titel;

  @HiveField(2)
  String description;

  @HiveField(3)
  String date;

  @HiveField(4)
  String time;

  @HiveField(5)
  String status;

  @HiveField(6)
  int color;

  TaskModel({
    required this.titel,
    required this.description,
    required this.date,
    required this.time,
    required this.status,
    required this.color,
  });
}
