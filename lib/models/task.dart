import 'package:hive/hive.dart';


part 'task.g.dart';

@HiveType(typeId: 1)
class Task {
  Task({required this.name, required this.description});
  @HiveField(0)
  String name;

  @HiveField(1)
  String description;

 
}
