import 'package:get/get.dart';

import '../../home/models/person.dart';

class ExampleHeroAnimationController extends GetxController {
  final List<Person> peoples = [
    Person(name: "John", age: 20, emoji: '🤓'),
    Person(name: "Jane", age: 21, emoji: '😎'),
    Person(name: "Jack", age: 22, emoji: '🥸'),
  ];
}
