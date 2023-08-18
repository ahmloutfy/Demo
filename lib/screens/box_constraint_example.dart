import 'package:flutter/material.dart';

class BoxConstraintExample extends StatelessWidget {
  const BoxConstraintExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GeeksforGeeks'),
        backgroundColor: Colors.greenAccent[400],
        centerTitle: true,
      ), //AppBar
      body: Center(
        child: Container(
          color: Colors.green,
          padding: const EdgeInsets.all(20), //Text
          /** BoxConstraints Widget **/
          constraints: const BoxConstraints(
              minHeight: 150, minWidth: 150, maxHeight: 200, maxWidth: 200),
          child: const Center(
            child: Text(
              'GfG',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ), //BoxConstraints
        ), //container
      ), //Center
    );
  }
}
