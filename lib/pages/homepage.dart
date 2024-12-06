import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/task.dart';
import 'package:hive/hive.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Box<Task> box = Hive.box<Task>('taskBox');

  @override
  void initState() {
    
    super.initState();
    Hive.openBox<Task>('taskBox');
  }

final TextEditingController _taskController = TextEditingController();
final TextEditingController _descriptionController = TextEditingController();

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
               setState(() {
                  box.clear();
                  });
            },
          )
        ],
      ),
      body: Column(
  
        children: [
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
             controller: _taskController,
              decoration: const InputDecoration(
                hintText: 'Enter your task',
                border: OutlineInputBorder()
              ),
            ),
          ),
       
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                hintText: 'Enter your description',
                border: OutlineInputBorder()
              ),
            ),
          ),
            const SizedBox(height: 10,),
            ElevatedButton(onPressed: (){
              setState(() {
                box.put(
                  'key_$_taskController.text',
                 Task(
                  name: _taskController.text, 
                  description: _descriptionController.text));
                  _taskController.clear();
                  _descriptionController.clear();
              });
            }
            , child: const Text('Add Task')),
           const Divider(),
            Expanded(child: ListView.builder(
             itemCount: box.length,
              itemBuilder: (context, index){
                Task? task = box.getAt(index);
              return ListTile(
                title: Text(task!.name),
                subtitle: Text(task.description),
                trailing: IconButton(onPressed: (){
                  setState(() {
                    box.deleteAt(index);
                  });
                }, icon: const Icon(Icons.delete)),
              );
            }))
        ],
      ),
    );
  }
}