import 'package:get/get.dart';

import '../controllers/custom_painter_polygons_controller.dart';

class CustomPainterPolygonsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomPainterPolygonsController>(
      () => CustomPainterPolygonsController(),
    );
  }
}
