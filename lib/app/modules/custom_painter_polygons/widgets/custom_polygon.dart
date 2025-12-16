import 'dart:math' show pi, cos, sin;

import 'package:flutter/material.dart';

class CustomPolygon extends CustomPainter {
  final int sides;

  CustomPolygon({super.repaint, required this.sides});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3;

    final Path path = Path();
    final Offset center = Offset(size.width / 2, size.height / 2);
    final double angle = 2 * pi / sides;
    final List angles = List.generate(sides, (int index) => index * angle);
    final double radius = size.width / 2;
    /*
    * x = center.x + radius * cos(angle)
    * y = center.y + radius * sing(angle)
    * */
    path.moveTo(center.dx + radius * cos(0), center.dy + radius * sin(0));

    for (final ng in angles) {
      path.lineTo(center.dx + radius * cos(ng), center.dy + radius * sin(ng));
    }

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>
      oldDelegate is CustomPolygon && oldDelegate.sides != sides;
}
