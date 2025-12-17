import 'package:get/get.dart';

import '../modules/custom_painter_polygons/bindings/custom_painter_polygons_binding.dart';
import '../modules/custom_painter_polygons/views/custom_painter_polygons_view.dart';
import '../modules/example_hero_animation/bindings/example_hero_animation_binding.dart';
import '../modules/example_hero_animation/views/example_hero_animation_view.dart';
import '../modules/example_implicit_animation/bindings/example_implicit_animation_binding.dart';
import '../modules/example_implicit_animation/views/example_implicit_animation_view.dart';
import '../modules/example_one/bindings/example_one_binding.dart';
import '../modules/example_one/views/example_one_view.dart';
import '../modules/example_tree_d/bindings/example_tree_d_binding.dart';
import '../modules/example_tree_d/views/example_tree_d_view.dart';
import '../modules/example_two/bindings/example_two_binding.dart';
import '../modules/example_two/views/example_two_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/three_d_drawer/bindings/three_d_drawer_binding.dart';
import '../modules/three_d_drawer/views/three_d_drawer_view.dart';

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
    GetPage(
      name: _Paths.EXAMPLE_TREE_D,
      page: () => const ExampleTreeDView(),
      binding: ExampleTreeDBinding(),
    ),
    GetPage(
      name: _Paths.EXAMPLE_HERO_ANIMATION,
      page: () => const ExampleHeroAnimationView(),
      binding: ExampleHeroAnimationBinding(),
    ),
    GetPage(
      name: _Paths.EXAMPLE_IMPLICIT_ANIMATION,
      page: () => const ExampleImplicitAnimationView(),
      binding: ExampleImplicitAnimationBinding(),
    ),
    GetPage(
      name: _Paths.CUSTOM_PAINTER_POLYGONS,
      page: () => const CustomPainterPolygonsView(),
      binding: CustomPainterPolygonsBinding(),
    ),
    GetPage(
      name: _Paths.THREE_D_DRAWER,
      page: () => const ThreeDDrawerView(),
      binding: ThreeDDrawerBinding(),
    ),
  ];
}
