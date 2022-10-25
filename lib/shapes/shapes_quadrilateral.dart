import 'package:flutter/material.dart';

class QuadrilateralShape extends StatelessWidget {
  const QuadrilateralShape({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ClipPath(
          clipper: ShapeQuadrilateral(),
          child: Container(
            color: Colors.amber,
          ),
        ),
      ),
    );
  }
}

class ShapeQuadrilateral extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width / 2, 300.0);
    path.lineTo(40.0, size.height / 2);
    path.lineTo(size.width / 2, size.height - 300.0);
    path.lineTo(size.width - 40.0, size.height / 2);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
