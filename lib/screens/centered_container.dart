import 'package:flutter/material.dart';

class CenteredContainer extends StatelessWidget {
  const CenteredContainer({super.key});

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: CustomPaint(
            painter: SampleShape(),
            child: SizedBox(
              width: size.width,
              height: size.height,
            ),
          ),
        ),
      ),
    );
  }
}


class SampleShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Paint paint = Paint()
    ..color = Colors.pink
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2.5;

    Path path = Path()
      ..moveTo(0, size.height * 0.35)
    ..quadraticBezierTo(size.width * 0.25, size.height * 0.34, size.width * 0.25, size.height * 0.25);

      // ..lineTo(size.width / 2 , size.height)
      // ..lineTo(size.width, size.height / 2)
      // ..lineTo(size.width / 2, 0)
      // ..close();

    return canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

}