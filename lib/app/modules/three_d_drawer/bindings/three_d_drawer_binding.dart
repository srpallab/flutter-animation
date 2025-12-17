import 'package:get/get.dart';

import '../controllers/three_d_drawer_controller.dart';

class ThreeDDrawerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ThreeDDrawerController>(
      () => ThreeDDrawerController(),
    );
  }
}
