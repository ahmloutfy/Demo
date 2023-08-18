// importing flutter and dart packages
import 'package:flutter/material.dart';
import 'dart:math';

class BallPage extends StatefulWidget {
  const BallPage({Key? key}) : super(key: key);

  @override
  BallPageState createState() => BallPageState();
}

class BallPageState extends State<BallPage> {
  int ballNumber = 1;

  @override

// Returns app with centered image Flatbutton
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        title: const Text('GeeksforGeeks'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              // Random.nextInt(n) returns random
              // integer from 0 to n-1
              ballNumber = Random().nextInt(5) + 1;
            });
          },

          // Adding images
          child: Image.asset('assets/images/balls/ball$ballNumber.png'),
        ),
      ),
    );
  }
}
