import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/task.dart';
import 'pages/homepage.dart';

void main()async {
await Hive.initFlutter();
Hive.registerAdapter(TaskAdapter());
var box = await Hive.openBox<Task>('taskBox');
runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
    debugShowCheckedModeBanner: false,
    home:  HomePage());
  }
}
