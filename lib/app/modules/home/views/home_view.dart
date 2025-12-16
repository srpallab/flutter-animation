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
              child: Text("Hero Animation"),
            ),
          ],
        ),
      ),
    );
  }
}
