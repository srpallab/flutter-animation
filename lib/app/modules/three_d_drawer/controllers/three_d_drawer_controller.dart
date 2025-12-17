import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThreeDDrawerController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final RxBool isOpened = false.obs;
  final RxDouble height = 0.0.obs;
  final RxDouble width = 0.0.obs;
  final Rx<Curve> curve = Rx(Curves.bounceIn);

  void changeHeight() {
    isOpened.value = !isOpened.value;
    height.value = isOpened.value ? 400.0 : 0.0;
    width.value = isOpened.value ? 400.0 : 0.0;
  }
}
