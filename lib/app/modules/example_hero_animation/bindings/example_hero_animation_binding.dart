import 'package:get/get.dart';

import '../controllers/example_hero_animation_controller.dart';

class ExampleHeroAnimationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExampleHeroAnimationController>(
      () => ExampleHeroAnimationController(),
    );
  }
}
