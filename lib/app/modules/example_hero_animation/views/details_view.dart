import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/models/person.dart';

class DetailsView extends StatelessWidget {
  final Person person;
  const DetailsView({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(
          flightShuttleBuilder:
              (
                BuildContext ctx,
                Animation<double> animation,
                HeroFlightDirection flightDirection,
                BuildContext fromHeroCtx,
                BuildContext toHeroCtx,
              ) {
                switch (flightDirection) {
                  case HeroFlightDirection.push:
                    return Material(
                      color: Colors.transparent,
                      child: ScaleTransition(
                        scale: animation.drive(
                          Tween<double>(
                            begin: 0,
                            end: 1,
                          ).chain(CurveTween(curve: Curves.fastOutSlowIn)),
                        ),
                        child: toHeroCtx.widget,
                      ),
                    );

                  case HeroFlightDirection.pop:
                    return Material(
                      color: Colors.transparent,
                      child: fromHeroCtx.widget,
                    );
                }
              },
          tag: person.name,
          child: Text(person.emoji, style: TextStyle(fontSize: 40)),
        ),
        centerTitle: true,
      ),

      body: Column(
        crossAxisAlignment: .center,
        spacing: 20,
        children: [
          SizedBox(width: Get.width),
          Text(person.name, style: TextStyle(fontSize: 30)),
          Text("${person.age} years old", style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
