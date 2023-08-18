// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class SpeedDialExample extends StatelessWidget {
  const SpeedDialExample({super.key});

  SpeedDial buildSpeedDial() {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: const IconThemeData(size: 28.0),
      backgroundColor: Colors.green[900],
      visible: true,
      children: [
        SpeedDialChild(
          child: const Icon(Icons.chrome_reader_mode, color: Colors.white),
          backgroundColor: Colors.green,
          onTap: () => print('Pressed Read Later'),
          label: 'Read',
          labelStyle:
              const TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          labelBackgroundColor: Colors.black,
        ),
        SpeedDialChild(
          child: const Icon(Icons.create, color: Colors.white),
          backgroundColor: Colors.green,
          onTap: () => print('Pressed Write'),
          label: 'Write',
          labelStyle:
              const TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          labelBackgroundColor: Colors.black,
        ),
        SpeedDialChild(
          child: const Icon(Icons.laptop_chromebook, color: Colors.white),
          backgroundColor: Colors.green,
          onTap: () => print('Pressed Code'),
          label: 'Code',
          labelStyle:
              const TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          labelBackgroundColor: Colors.black,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Geeks for Geeks'),
        backgroundColor: Colors.green,
      ),
      body: const SafeArea(
        child: Center(
          child: Text(
            'Welcome to GFG!',
            style: TextStyle(
              fontSize: 30.0,
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      floatingActionButton: buildSpeedDial(),
    );
  }
}
