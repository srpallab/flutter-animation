import 'package:flutter/material.dart';
import 'package:flutter_animation/app/modules/three_d_drawer/widgets/my_drawer.dart';
import 'package:get/get.dart';

import '../controllers/three_d_drawer_controller.dart';

class ThreeDDrawerView extends GetView<ThreeDDrawerController> {
  const ThreeDDrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return MyDrawer(
      drawer: Material(
        child: Container(
          color: const Color(0xff24283b),
          child: ListView.builder(
            itemCount: 20,
            padding: const EdgeInsets.only(left: 80, top: 100),
            itemBuilder: (context, index) {
              return ListTile(title: Text("Item $index"));
            },
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(title: Text("Drawer"), centerTitle: true),
        body: Container(
          color: Color(0xff414868),
          child: Column(
            mainAxisAlignment: .end,
            children: [
              Obx(() {
                return AnimatedAlign(
                  duration: const Duration(milliseconds: 590),
                  alignment: controller.isOpened.value
                      ? Alignment.center
                      : Alignment.centerRight,
                  child: AnimatedContainer(
                    transformAlignment: Alignment.centerLeft,
                    duration: Duration(milliseconds: 590),
                    decoration: BoxDecoration(color: Colors.red),
                    height: controller.height.value,
                    width: controller.width.value,
                    child: Text("New "),
                  ),
                );
              }),
            ],
          ),
        ),
        floatingActionButton: IconButton(
          onPressed: controller.changeHeight,
          icon: CircleAvatar(maxRadius: 30, child: Icon(Icons.add, size: 30)),
        ),
      ),
    );
  }
}
