import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class CardItem {
  String? title;
  String? description;

  CardItem({this.title, this.description});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
    };
  }

  static CardItem fromMap(Map<String, dynamic> map) {
    return CardItem(
      title: map['title'],
      description: map['description'],
    );
  }
}

class ObjectInteraction extends StatefulWidget {
  const ObjectInteraction({Key? key}) : super(key: key);

  @override
  ObjectInteractionState createState() => ObjectInteractionState();
}

class ObjectInteractionState extends State<ObjectInteraction> {
  List<CardItem> cardList = [];
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  int? selectedItemIndex;
  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    loadTasks();
  }

  Future<void> loadTasks() async {
    _prefs = await SharedPreferences.getInstance();
    final String? savedTasksJson = _prefs.getString('cardList');
    if (savedTasksJson != null) {
      final List<dynamic> savedTasks = json.decode(savedTasksJson);
      setState(() {
        cardList = savedTasks.map((task) => CardItem.fromMap(task)).toList();
      });
    }
  }

  Future<void> saveTasks() async {
    final List<Map<String, dynamic>> taskList =
        cardList.map((task) => task.toMap()).toList();
    final String taskListJson = json.encode(taskList);
    await _prefs.setString('cardList', taskListJson);
  }

  void addCard(CardItem card) {
    setState(() {
      cardList.add(card);
      _titleController.clear();
      _descriptionController.clear();
      saveTasks();
    });
  }

  void editCard(CardItem newCard) {
    setState(() {
      cardList[selectedItemIndex!] = newCard;
      selectedItemIndex = null;
      saveTasks();
    });
    _titleController.clear();
    _descriptionController.clear();
  }

  void deleteCard(int index) {
    setState(() {
      cardList.removeAt(index);
      saveTasks();
    });
  }

  void _showDialog({CardItem? card}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(card != null ? 'Edit Card' : 'Add Card'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(hintText: 'Enter title'),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _descriptionController,
                decoration:
                    const InputDecoration(hintText: 'Enter description'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                selectedItemIndex = null;
                _titleController.clear();
                _descriptionController.clear();
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(card != null ? 'Update' : 'Add'),
              onPressed: () {
                if (card != null) {
                  editCard(
                    CardItem(
                      title: _titleController.text,
                      description: _descriptionController.text,
                    ),
                  );
                } else {
                  addCard(
                    CardItem(
                      title: _titleController.text,
                      description: _descriptionController.text,
                    ),
                  );
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card List'),
      ),
      body: ListView.builder(
        itemCount: cardList.length,
        itemBuilder: (context, index) {
          final card = cardList[index];
          return ListTile(
            title: Text(card.title!),
            subtitle: Text(card.description!),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                deleteCard(index);
              },
            ),
            onTap: () {
              selectedItemIndex = index;
              _titleController.text = card.title!;
              _descriptionController.text = card.description!;
              _showDialog(card: card);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          _showDialog();
        },
      ),
    );
  }
}
