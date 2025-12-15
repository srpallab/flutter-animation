import 'dart:math';

import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class ExampleTwoController extends GetxController
    with GetTickerProviderStateMixin {
  late AnimationController counterClockWiseRotationAnimCtl;
  late Animation<double> counterClockWiseRotationAnim;
  late AnimationController flipAnimCtl;
  late Animation<double> flipAnim;

  @override
  void onInit() {
    super.onInit();
    counterClockWiseRotationAnimCtl = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    counterClockWiseRotationAnim = Tween<double>(begin: 0, end: -(pi / 2))
        .animate(
          CurvedAnimation(
            parent: counterClockWiseRotationAnimCtl,
            curve: Curves.bounceOut,
          ),
        );
    counterClockWiseRotationAnimCtl
      ..reset()
      ..forward();

    flipAnimCtl = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    flipAnim = Tween<double>(
      begin: 0,
      end: pi,
    ).animate(CurvedAnimation(parent: flipAnimCtl, curve: Curves.bounceOut));

    counterClockWiseRotationAnimCtl.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        flipAnim =
            Tween<double>(
              begin: flipAnim.value,
              end: flipAnim.value + pi,
            ).animate(
              CurvedAnimation(parent: flipAnimCtl, curve: Curves.bounceOut),
            );
        flipAnimCtl
          ..reset()
          ..forward();
      }
    });

    flipAnimCtl.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        counterClockWiseRotationAnim =
            Tween<double>(
              begin: counterClockWiseRotationAnimCtl.value,
              end: counterClockWiseRotationAnimCtl.value + (-(pi / 2.0)),
            ).animate(
              CurvedAnimation(
                parent: counterClockWiseRotationAnimCtl,
                curve: Curves.bounceOut,
              ),
            );
        counterClockWiseRotationAnimCtl
          ..reset()
          ..forward();
      }
    });
  }

  @override
  void onClose() {
    counterClockWiseRotationAnimCtl.dispose();
    flipAnimCtl.dispose();
    super.onClose();
  }
}
