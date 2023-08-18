import 'package:flutter/material.dart';

class ExampleShapes extends StatelessWidget {
  const ExampleShapes({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Example Shapes"),
        backgroundColor: Colors.green,
      ),
      body: CustomPaint(
        painter: LinePainter(),
        size: const Size(200, 2),
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2;

    Offset startPoint = Offset(100, size.height / 2);
    Offset endPoint = Offset(300, size.height);

    canvas.drawLine(startPoint, endPoint, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
