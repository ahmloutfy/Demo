import 'package:flutter/material.dart';

class ThemeSample extends StatelessWidget {
  final String title;

  const ThemeSample({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Container(
          color: Theme.of(context).hintColor,
          child: Text(
            'Hello Geeks!',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(
          colorScheme:
              Theme.of(context).colorScheme.copyWith(secondary: Colors.red),
        ),
        child: const FloatingActionButton(
          onPressed: null,
          child: Icon(Icons.arrow_circle_up),
        ),
      ),
    );
  }
}
