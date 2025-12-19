import 'package:get/get.dart';

import '../controllers/animated_prompt_controller.dart';

class AnimatedPromptBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnimatedPromptController>(
      () => AnimatedPromptController(),
    );
  }
}
