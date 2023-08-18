import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TapCoordinatesPage extends StatefulWidget {
  const TapCoordinatesPage({Key? key}) : super(key: key);

  @override
  TapCoordinatesPageState createState() => TapCoordinatesPageState();
}

class TapCoordinatesPageState extends State<TapCoordinatesPage> {
  List<Offset> tappedPoints = [];

  void clearCoordinates() {
    setState(() {
      tappedPoints.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTapDown: (TapDownDetails details) {
          final RenderBox box = context.findRenderObject() as RenderBox;
          final Offset tapPosition = box.globalToLocal(details.globalPosition);
          setState(() {
            tappedPoints.add(tapPosition);
            printCoordinates(tapPosition);
          });
        },
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                color: Colors.white,
              ),
            ),
            ...tappedPoints.map((offset) {
              return Positioned(
                left: offset.dx - 8,
                top: offset.dy - 8,
                child: Container(
                  width: 16,
                  height: 16,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: clearCoordinates,
        child: const Icon(Icons.clear),
      ),
    );
  }

  void printCoordinates(Offset offset) {
    if (kDebugMode) {
      print(
          'X: ${offset.dx.toStringAsFixed(2)}, Y: ${offset.dy.toStringAsFixed(2)}');
    }
  }
}
