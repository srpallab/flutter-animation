import 'package:get/get.dart';

import '../controllers/example_implicit_animation_controller.dart';

class ExampleImplicitAnimationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExampleImplicitAnimationController>(
      () => ExampleImplicitAnimationController(),
    );
  }
}
