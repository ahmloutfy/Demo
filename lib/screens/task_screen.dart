import 'package:flutter/material.dart';

class Task {
  final String? taskName;
  final String? description;

  Task(this.taskName, this.description);
}

// Home screen
class TodosScreen extends StatelessWidget {
  final List<Task> tasks;

  const TodosScreen({Key? key, required this.tasks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GeeksForGeeks'),
        backgroundColor: Colors.green,
      ),
      // List builder
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tasks[index].taskName!),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(task: tasks[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// detail screen
class DetailScreen extends StatelessWidget {
  final Task? task;
  const DetailScreen({Key? key, @required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(task!.taskName!),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(task!.description!),
      ),
    );
  }
}
