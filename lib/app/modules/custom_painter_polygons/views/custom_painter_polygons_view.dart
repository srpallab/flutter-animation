import 'package:flutter/material.dart';
import 'package:flutter_animation/app/modules/custom_painter_polygons/widgets/custom_polygon.dart';
import 'package:get/get.dart';

import '../controllers/custom_painter_polygons_controller.dart';

class CustomPainterPolygonsView
    extends GetView<CustomPainterPolygonsController> {
  const CustomPainterPolygonsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CustomPainter And Polygons'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: AnimatedBuilder(
            animation: Listenable.merge([
              controller.sidesAnimController,
              controller.radiusAnimCtl,
              controller.rotationAnimCtl,
            ]),
            builder: (context, child) {
              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..rotateX(controller.rotationAnimCtl.value)
                  ..rotateY(controller.rotationAnimCtl.value)
                  ..rotateZ(controller.rotationAnimCtl.value),
                child: CustomPaint(
                  painter: CustomPolygon(
                    sides: controller.sidesAnimation.value,
                  ),
                  child: SizedBox(
                    width: controller.radiusAnimation.value,
                    height: controller.radiusAnimation.value,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
