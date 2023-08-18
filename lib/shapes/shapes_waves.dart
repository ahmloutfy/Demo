import 'package:flutter/material.dart';

class WavesShape extends StatelessWidget {
  const WavesShape({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: CustomPaint(
          painter: ShapeWaves(),
          child: SizedBox(
            width: size.width,
            height: size.height,
          ),
        )
      ),
    );
  }
}

class ShapeWaves extends CustomPainter  {
  @override
  void paint(Canvas canvas, Size size) {


    Path orangeShape = Path()
      ..moveTo(0, 230)
      ..quadraticBezierTo(140, 240, 150, 165)
      ..quadraticBezierTo(160, 90, 200, 75)
      ..quadraticBezierTo(240, 60, 280, 55)
      ..quadraticBezierTo(320, 50, 380, 55)
      ..quadraticBezierTo(440, 60, 510, 0)

      ..lineTo(0, 0) // Connect the last point to the top-left corner to close the clip
      ..close();

    final Path blackShape = Path()
      ..moveTo(0, 420)
      ..quadraticBezierTo(140, 450, 195, 470)
      ..quadraticBezierTo(250, 490, 325, 490)
      ..quadraticBezierTo(400, 490, 430, 405)
      ..quadraticBezierTo(460, 320, 520, 280)
      ..quadraticBezierTo(580, 240, 670, 245)
      ..quadraticBezierTo(760, 250, 850, 200);


    final Path blueShape = Path()
      ..moveTo(430, 400)
      ..quadraticBezierTo(530, 590, 605, 635)
      ..quadraticBezierTo(680, 680, 850, 640);





    final orangePaint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.fill;

    final blackPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    final bluePaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    canvas.drawPath(blackShape, blackPaint);
    canvas.drawPath(blueShape, bluePaint);
    canvas.drawPath(orangeShape, orangePaint);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;






}
