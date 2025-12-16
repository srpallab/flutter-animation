import 'dart:math' show pi;

import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class ExampleTreeDController extends GetxController
    with GetTickerProviderStateMixin {
  late AnimationController xAnimCtl;
  late AnimationController yAnimCtl;
  late AnimationController zAnimCtl;
  late Tween<double> animation;

  @override
  void onInit() {
    super.onInit();
    xAnimCtl = AnimationController(
      vsync: this,
      duration: Duration(seconds: 20),
    );
    yAnimCtl = AnimationController(
      vsync: this,
      duration: Duration(seconds: 30),
    );
    zAnimCtl = AnimationController(
      vsync: this,
      duration: Duration(seconds: 40),
    );

    animation = Tween<double>(begin: 0, end: pi * 2);
  }

  @override
  void onClose() {
    super.onClose();
    xAnimCtl.dispose();
    yAnimCtl.dispose();
    zAnimCtl.dispose();
  }
}
