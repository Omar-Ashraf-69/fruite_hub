import 'package:flutter/material.dart';

class DirectionalCurveClipper extends CustomClipper<Path> {
  final TextDirection textDirection;

  DirectionalCurveClipper({required this.textDirection});

  @override
  Path getClip(Size size) {
    Path path = Path();
    final bool isRtl = textDirection == TextDirection.rtl;
    final double radius = 8.0; // Matches your card's outer radius boundary

    if (isRtl) {
      // --- ARABIC (RTL) ---
      // Container sits on the RIGHT. Curve happens on its LEFT edge.
      path.moveTo(size.width, radius);

      // Top right outer corner round
      path.quadraticBezierTo(size.width, 0, size.width - radius, 0);
      path.lineTo(size.width * 0.1, 0);

      // Inner Left Edge Smooth Curve
      path.quadraticBezierTo(
        0,
        size.height * 0.5,
        size.width * 0.1,
        size.height,
      );

      path.lineTo(size.width - radius, size.height);
      // Bottom right outer corner round
      path.quadraticBezierTo(
        size.width,
        size.height,
        size.width,
        size.height - radius,
      );
    } else {
      // --- ENGLISH (LTR) ---
      // Container sits on the LEFT. Curve happens on its RIGHT edge.
      path.moveTo(radius, 0);

      // Top left outer corner round
      path.quadraticBezierTo(0, 0, 0, radius);
      path.lineTo(0, size.height - radius);

      // Bottom left outer corner round
      path.quadraticBezierTo(0, size.height, radius, size.height);
      path.lineTo(size.width * 0.9, size.height);

      // Inner Right Edge Smooth Curve
      path.quadraticBezierTo(
        size.width,
        size.height * 0.5,
        size.width * 0.9,
        0,
      );
    }

    path.close();
    return path;
  }

  bool shouldReclip(covariant DirectionalCurveClipper oldClipper) {
    return oldClipper.textDirection != textDirection;
  }
}
