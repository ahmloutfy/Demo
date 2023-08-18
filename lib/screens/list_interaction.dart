import 'package:flutter/material.dart';

class ListIteraction extends StatefulWidget {
  const ListIteraction({super.key});

  @override
  ListIteractionState createState() => ListIteractionState();
}

class ListIteractionState extends State<ListIteraction> {
  List<String> itemList = [];
  final TextEditingController _textEditingController = TextEditingController();
  int? selectedItemIndex;

  void addItem(String? item) {
    setState(() {
      itemList.add(item!);
    });
  }

  void editItem(String newItem) {
    setState(() {
      itemList[selectedItemIndex!] = newItem;
      selectedItemIndex = null;
    });
    _textEditingController.clear();
  }

  void deleteItem(int index) {
    setState(() {
      itemList.removeAt(index);
    });
  }

  void _showDialog({String? item}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(item != null ? 'Edit Item' : 'Add Item'),
          content: TextField(
            controller: _textEditingController,
            decoration: const InputDecoration(hintText: 'Enter item name'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                selectedItemIndex = null;
                _textEditingController.clear();
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(item != null ? 'Update' : 'Add'),
              onPressed: () {
                if (item != null) {
                  editItem(_textEditingController.text);
                } else {
                  addItem(_textEditingController.text);
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
        title: const Text('Item List'),
      ),
      body: ListView.builder(
        itemCount: itemList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(itemList[index]),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                deleteItem(index);
              },
            ),
            onTap: () {
              selectedItemIndex = index;
              _textEditingController.text = itemList[index];
              _showDialog(item: itemList[index]);
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
