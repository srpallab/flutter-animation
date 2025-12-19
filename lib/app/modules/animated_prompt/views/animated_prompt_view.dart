import 'package:flutter/material.dart';
import 'package:flutter_animation/app/modules/animated_prompt/widgets/animated_prompt.dart';
import 'package:get/get.dart';

import '../controllers/animated_prompt_controller.dart';

class AnimatedPromptView extends GetView<AnimatedPromptController> {
  const AnimatedPromptView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedPromptView'),
        centerTitle: true,
      ),
      body: const Center(
        child: AnimatedPrompt(
          title: "Thank you for your order!",
          subTitle: "Your order will be delivered in 2 days. Enjoy!",
          child: Icon(Icons.check),
        ),
      ),
    );
  }
}
