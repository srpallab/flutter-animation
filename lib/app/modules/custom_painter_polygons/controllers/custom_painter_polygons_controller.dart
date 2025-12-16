import 'dart:math' show pi;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomPainterPolygonsController extends GetxController
    with GetTickerProviderStateMixin {
  late AnimationController sidesAnimController;
  late Animation<int> sidesAnimation;

  late AnimationController radiusAnimCtl;
  late Animation<double> radiusAnimation;

  late AnimationController rotationAnimCtl;
  late Animation<double> rotationAnimation;

  @override
  void onInit() {
    super.onInit();

    sidesAnimController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    sidesAnimation = IntTween(begin: 3, end: 10).animate(sidesAnimController);

    radiusAnimCtl = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    radiusAnimation = Tween(
      begin: 20.0,
      end: 400.0,
    ).chain(CurveTween(curve: Curves.bounceInOut)).animate(radiusAnimCtl);

    rotationAnimCtl = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    rotationAnimation = Tween(
      begin: 0.0,
      end: 2 * pi,
    ).chain(CurveTween(curve: Curves.easeInOut)).animate(rotationAnimCtl);
  }

  @override
  void onReady() {
    super.onReady();
    sidesAnimController.repeat(reverse: true);
    radiusAnimCtl.repeat(reverse: true);
    rotationAnimCtl.repeat(reverse: true);
  }

  @override
  void onClose() {
    sidesAnimController.dispose();
    radiusAnimCtl.dispose();
    rotationAnimCtl.dispose();
    super.onClose();
  }
}
