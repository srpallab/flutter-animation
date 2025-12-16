import 'package:get/get.dart';

import '../controllers/example_tree_d_controller.dart';

class ExampleTreeDBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExampleTreeDController>(
      () => ExampleTreeDController(),
    );
  }
}
