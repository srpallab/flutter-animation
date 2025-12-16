import 'package:flutter/material.dart';
import 'package:flutter_animation/app/modules/example_hero_animation/views/details_view.dart';
import 'package:get/get.dart';

import '../controllers/example_hero_animation_controller.dart';

class ExampleHeroAnimationView extends GetView<ExampleHeroAnimationController> {
  const ExampleHeroAnimationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example Hero Animation'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: controller.peoples.length,
        itemBuilder: (context, index) {
          final person = controller.peoples[index];
          return ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return DetailsView(person: person);
                  },
                ),
              );
            },
            leading: Hero(
              tag: person.name,
              child: Text(person.emoji, style: TextStyle(fontSize: 40)),
            ),
            title: Text(person.name),
            subtitle: Text('${person.age} years old'),
            trailing: Icon(Icons.arrow_forward_ios),
          );
        },
      ),
    );
  }
}
