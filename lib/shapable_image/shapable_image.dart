import 'package:flutter/material.dart';
import 'dart:math';

//This enum helps you choose what shape you want.
enum ShapeType {
  circle,
  oval,
  rectangle,
  rounded,
  customRadius,
  polygon,
}

class ShapableImage extends StatelessWidget {
  final ShapeType shape;
  final double width;
  final double height;

  final int polygonSides;

  // Individual border radius
  final double topLeft;
  final double topRight;
  final double bottomLeft;
  final double bottomRight;

  final Widget child;

  const ShapableImage({
    super.key,
    required this.shape,
    required this.child,
    this.width = 100,
    this.height = 100,
    this.polygonSides = 6,

    this.topLeft = 0,
    this.topRight = 0,
    this.bottomLeft = 0,
    this.bottomRight = 0,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _ShapeClipper(
        shape,
        polygonSides,
        topLeft,
        topRight,
        bottomLeft,
        bottomRight,
      ),
      child: SizedBox(
        width: width,
        height: height,
        child: child,
      ),
    );
  }
}

class _ShapeClipper extends CustomClipper<Path> {
  final ShapeType shape;
  final int polygonSides;

  final double tl;
  final double tr;
  final double bl;
  final double br;

  _ShapeClipper(
      this.shape,
      this.polygonSides,
      this.tl,
      this.tr,
      this.bl,
      this.br,
      );

  @override
  Path getClip(Size size) {
    switch (shape) {
      case ShapeType.circle:
        double d = min(size.width, size.height);
        return Path()..addOval(Rect.fromLTWH(0, 0, d, d));

      case ShapeType.oval:
        return Path()..addOval(Rect.fromLTWH(0, 0, size.width, size.height));

      case ShapeType.rectangle:
        return Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height));

      case ShapeType.rounded:
        return _rounded(size, 20);

      case ShapeType.customRadius:
        return _customRadius(size);

      case ShapeType.polygon:
        return _polygon(size, polygonSides);
    }
  }

  // Rounded with single radius
  Path _rounded(Size size, double radius) {
    return Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height),
          Radius.circular(radius),
        ),
      );
  }

  // Custom individual radius
  Path _customRadius(Size size) {
    return Path()
      ..addRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTWH(0, 0, size.width, size.height),
          topLeft: Radius.circular(tl),
          topRight: Radius.circular(tr),
          bottomLeft: Radius.circular(bl),
          bottomRight: Radius.circular(br),
        ),
      );
  }

  // Polygon shape
  Path _polygon(Size size, int sides) {
    final Path path = Path();
    final double angle = (2 * pi) / sides;
    final double radius = min(size.width, size.height) / 2;

    final Offset center = Offset(size.width / 2, size.height / 2);

    path.moveTo(
      center.dx + radius * cos(0),
      center.dy + radius * sin(0),
    );

    for (int i = 1; i < sides; i++) {
      path.lineTo(
        center.dx + radius * cos(angle * i),
        center.dy + radius * sin(angle * i),
      );
    }

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
