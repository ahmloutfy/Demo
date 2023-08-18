import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // The GestureDetector wraps the button.
    return Scaffold(
      appBar: AppBar(
        title: const Text('GeeksForGeeks'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: GestureDetector(
          // show snackbar on tap of child
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(" You just Tapped on the Button"),
              ),
            );
          },
          // The tap button
          child: Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              // ignore: deprecated_member_use
              color: Colors.amber,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: const Text('Tap Button'),
          ),
        ),
      ),
    );
  }
}
