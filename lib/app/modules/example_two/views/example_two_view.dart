import 'package:flutter/material.dart';
import 'package:flutter_animation/app/modules/example_two/enums/circle_side.dart';
import 'package:flutter_animation/app/modules/example_two/widgets/half_circle_clipper.dart';
import 'package:get/get.dart';

import '../controllers/example_two_controller.dart';

class ExampleTwoView extends GetView<ExampleTwoController> {
  const ExampleTwoView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ExampleTwoView'), centerTitle: true),
      body: Column(
        mainAxisAlignment: .spaceAround,
        children: [
          AnimatedBuilder(
            animation: controller.counterClockWiseRotationAnimCtl,
            builder: (ctx, child) {
              return Transform(
                alignment: .center,
                transform: Matrix4.identity()
                  ..rotateZ(controller.counterClockWiseRotationAnim.value),
                child: Row(
                  mainAxisAlignment: .center,
                  children: [
                    AnimatedBuilder(
                      animation: controller.flipAnimCtl,
                      builder: (context, child) {
                        return Transform(
                          alignment: Alignment.centerRight,

                          transform: Matrix4.identity()
                            ..rotateY(controller.flipAnim.value),
                          child: ClipPath(
                            clipper: HalfCircleClipper(side: CircleSide.left),
                            child: Container(
                              height: 200,
                              width: 200,
                              color: Colors.blue,
                            ),
                          ),
                        );
                      },
                    ),
                    AnimatedBuilder(
                      animation: controller.flipAnimCtl,
                      builder: (context, child) {
                        return Transform(
                          alignment: Alignment.centerLeft,
                          transform: Matrix4.identity()
                            ..rotateY(controller.flipAnim.value),

                          child: ClipPath(
                            clipper: HalfCircleClipper(side: CircleSide.right),
                            child: Container(
                              height: 200,
                              width: 200,
                              color: Colors.yellow,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
          Column(
            mainAxisAlignment: .center,
            children: [
              ClipPath(
                clipper: HalfCircleClipper(side: CircleSide.up),
                child: Container(
                  height: 200,
                  width: 200,
                  color: Colors.redAccent,
                ),
              ),
              ClipPath(
                clipper: HalfCircleClipper(side: CircleSide.down),
                child: Container(height: 200, width: 200, color: Colors.green),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
