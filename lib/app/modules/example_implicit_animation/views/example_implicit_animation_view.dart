import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/example_implicit_animation_controller.dart';

class ExampleImplicitAnimationView
    extends GetView<ExampleImplicitAnimationController> {
  const ExampleImplicitAnimationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example Implicit Animation'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: .center,
        children: [
          Row(
            mainAxisAlignment: .center,
            children: [
              Obx(() {
                return AnimatedContainer(
                  width: controller.width.value,
                  duration: Duration(milliseconds: 590),
                  curve: controller.curve.value,
                  child: Image.asset("assets/images/photo.jpeg"),
                );
              }),
            ],
          ),
          Obx(() {
            return TextButton(
              onPressed: () {
                controller.changeWidth();
              },
              child: Text(controller.btnTitle.value),
            );
          }),
        ],
      ),
    );
  }
}
