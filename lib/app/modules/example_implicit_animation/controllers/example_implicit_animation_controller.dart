import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ExampleImplicitAnimationController extends GetxController {
  final RxBool isZoomedIn = false.obs;
  final RxString btnTitle = "Zoom In".obs;
  final RxDouble width = 100.0.obs;

  final Rx<Curve> curve = Rx(Curves.bounceIn);

  void changeWidth() {
    isZoomedIn.value = !isZoomedIn.value;
    width.value = isZoomedIn.value ? Get.width : 100;
    btnTitle.value = isZoomedIn.value ? "Zoom Out" : "Zoom In";
    curve.value = isZoomedIn.value ? Curves.bounceIn : Curves.bounceOut;
  }
}
