import 'package:get/get.dart';

import '../controllers/example_two_controller.dart';

class ExampleTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExampleTwoController>(
      () => ExampleTwoController(),
    );
  }
}
