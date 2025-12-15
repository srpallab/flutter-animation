import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/example_one_controller.dart';

class ExampleOneView extends GetView<ExampleOneController> {
  const ExampleOneView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Example One"), centerTitle: true),
      body: Center(
        child: AnimatedBuilder(
          animation: controller.animationCtl,
          builder: (context, child) {
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..rotateZ(controller.animation.value),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withAlpha(50),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
