import 'dart:ui';

import '../enums/circle_side.dart';

extension ToPath on CircleSide {
  Path toPath(Size size) {
    final Path path = Path();
    late Offset offset;
    late bool clockWise;

    // Fix the path positions for left and right
    switch (this) {
      case CircleSide.left:
        // Move Point to x = width, y = 0
        path.moveTo(size.width, 0);
        offset = Offset(size.width, size.height);
        clockWise = false;
        break;
      case CircleSide.right:
        // Point already x = 0, y = 0
        offset = Offset(0, size.height);
        clockWise = true;
        break;
      case CircleSide.up:
        // Move Point to x = 0, y = height
        path.moveTo(0, size.height);
        // move line to
        offset = Offset(size.width, size.height);
        clockWise = true;
        break;
      case CircleSide.down:
        // Point already x = 0, y = 0
        offset = Offset(size.width, 0);
        clockWise = false;
        break;
    }

    path.arcToPoint(
      offset,
      radius: Radius.circular(size.width / 2),
      clockwise: clockWise,
    );

    path.close();
    return path;
  }
}
