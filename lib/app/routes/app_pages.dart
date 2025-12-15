import 'package:get/get.dart';

import '../modules/example_one/bindings/example_one_binding.dart';
import '../modules/example_one/views/example_one_view.dart';
import '../modules/example_two/bindings/example_two_binding.dart';
import '../modules/example_two/views/example_two_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.EXAMPLE_ONE,
      page: () => const ExampleOneView(),
      binding: ExampleOneBinding(),
    ),
    GetPage(
      name: _Paths.EXAMPLE_TWO,
      page: () => const ExampleTwoView(),
      binding: ExampleTwoBinding(),
    ),
  ];
}
