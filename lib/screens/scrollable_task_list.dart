import 'package:flutter/material.dart';

class Task {
  String? title;
  String? details;

  Task(this.title, this.details);
}

class ScrollableTaskList extends StatefulWidget {
  const ScrollableTaskList({super.key});

  @override
  ScrollableTaskListState createState() => ScrollableTaskListState();
}

class ScrollableTaskListState extends State<ScrollableTaskList> {
  final _formKey = GlobalKey<FormState>();
  Task? _task = Task('', '');
  final List<Task> _submittedForms = [
    Task('Ahmed', 'Loutfy'),
    Task('Ahmed', 'Loutfy'),
    Task('Ahmed', 'Loutfy'),
    Task('Ahmed', 'Loutfy'),
    Task('Ahmed', 'Loutfy'),
    Task('Ahmed', 'Loutfy'),
    Task('Ahmed', 'Loutfy'),
    Task('Ahmed', 'Loutfy'),
    Task('Ahmed', 'Loutfy'),
    Task('Ahmed', 'Loutfy'),
    Task('Ahmed', 'Loutfy'),
    Task('Ahmed', 'Loutfy'),
    Task('Ahmed', 'Loutfy'),
    Task('Ahmed', 'Loutfy'),
    Task('Ahmed', 'Loutfy'),
    Task('Ahmed', 'Loutfy'),
    Task('Ahmed', 'Loutfy'),
    Task('Ahmed', 'Loutfy'),
    Task('Ahmed', 'Loutfy'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        decoration:
                            const InputDecoration(labelText: 'Task Title'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a title';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _task!.title = value;
                        },
                      ),
                      TextFormField(
                        decoration:
                            const InputDecoration(labelText: 'Task Details'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter task details';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _task!.details = value;
                        },
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _submitForm,
                        child: const Text('Submit'),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Submitted Forms',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: MediaQuery.of(context)
                    .size
                    .height, // Set the desired height of the list
                child: ListView.builder(
                  itemCount: _submittedForms.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Title: ${_submittedForms[index].title}'),
                      subtitle:
                          Text('Details: ${_submittedForms[index].details}'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _submittedForms.add(_task!);
      _task = Task('', ''); // Reset the task
      _formKey.currentState!.reset();
      setState(
          () {}); // Trigger a rebuild to show the submitted form in the list
    }
  }
}
