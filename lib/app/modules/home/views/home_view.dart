import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Examples"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 7,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.EXAMPLE_ONE);
              },
              child: Text("Example One"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.EXAMPLE_TWO);
              },
              child: Text("Example Two"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.EXAMPLE_TREE_D);
              },
              child: Text("Example 3D"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.EXAMPLE_HERO_ANIMATION);
              },
              child: Text("Hero Animation", textAlign: TextAlign.center),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.EXAMPLE_IMPLICIT_ANIMATION);
              },
              child: Text("Implicit Animation", textAlign: TextAlign.center),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.CUSTOM_PAINTER_POLYGONS);
              },
              child: Text(
                "Custom Painter and Polygons",
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.THREE_D_DRAWER);
              },
              child: Text("3D Drawer"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.ANIMATED_PROMPT);
              },
              child: Text("Animated Prompt"),
            ),
          ],
        ),
      ),
    );
  }
}
