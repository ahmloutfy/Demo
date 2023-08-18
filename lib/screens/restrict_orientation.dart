import 'package:flutter/material.dart';

class RestrictOrientation extends StatelessWidget {
  const RestrictOrientation({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'This app can\'t be rotated to Landscape mode',
          style: TextStyle(color: Colors.green, fontSize: 17),
        ),
      ),
    );
  }
}
