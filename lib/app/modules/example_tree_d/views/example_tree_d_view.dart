import 'dart:math' show pi;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

import '../controllers/example_tree_d_controller.dart';

class ExampleTreeDView extends GetView<ExampleTreeDController> {
  const ExampleTreeDView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.xAnimCtl
      ..reset()
      ..repeat();
    controller.yAnimCtl
      ..reset()
      ..repeat();
    controller.zAnimCtl
      ..reset()
      ..repeat();
    return Scaffold(
      appBar: AppBar(title: const Text('ExampleTreeDView'), centerTitle: true),
      body: Column(
        mainAxisAlignment: .center,
        children: [
          SizedBox(height: 1, width: Get.width),
          AnimatedBuilder(
            animation: Listenable.merge([
              controller.xAnimCtl,
              controller.yAnimCtl,
              controller.zAnimCtl,
            ]),
            builder: (context, child) {
              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..rotateX(controller.animation.evaluate(controller.xAnimCtl))
                  ..rotateY(controller.animation.evaluate(controller.yAnimCtl))
                  ..rotateZ(controller.animation.evaluate(controller.zAnimCtl)),
                child: Stack(
                  children: [
                    //back
                    Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..translateByVector3(Vector3(0, 0, -100)),
                      child: Container(
                        color: Colors.purple,
                        width: 100,
                        height: 100,
                      ),
                    ),

                    // left side
                    Transform(
                      alignment: Alignment.centerLeft,
                      transform: Matrix4.identity()..rotateY(pi / 2),
                      child: Container(
                        color: Colors.brown,
                        width: 100,
                        height: 100,
                      ),
                    ),

                    // right side
                    Transform(
                      alignment: Alignment.centerRight,
                      transform: Matrix4.identity()..rotateY(-pi / 2),
                      child: Container(
                        color: Colors.blue,
                        width: 100,
                        height: 100,
                      ),
                    ),

                    // top side
                    Transform(
                      alignment: Alignment.topCenter,
                      transform: Matrix4.identity()..rotateX(-pi / 2),
                      child: Container(
                        color: Colors.red,
                        width: 100,
                        height: 100,
                      ),
                    ),
                    // bottom side
                    Transform(
                      alignment: Alignment.bottomCenter,
                      transform: Matrix4.identity()..rotateX(pi / 2),
                      child: Container(
                        color: Colors.yellow,
                        width: 100,
                        height: 100,
                      ),
                    ),
                    // front
                    Container(color: Colors.green, width: 100, height: 100),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
