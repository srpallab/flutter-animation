import 'package:get/get.dart';

import '../controllers/example_one_controller.dart';

class ExampleOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExampleOneController>(
      () => ExampleOneController(),
    );
  }
}
