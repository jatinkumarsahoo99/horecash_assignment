import 'package:get/get.dart';

import '../modules/fromonescreen/bindings/fromonescreen_binding.dart';
import '../modules/fromonescreen/views/fromonescreen_view.dart';
import '../modules/fromtwoscreen/bindings/fromtwoscreen_binding.dart';
import '../modules/fromtwoscreen/views/fromtwoscreen_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/profilescreen/bindings/profilescreen_binding.dart';
import '../modules/profilescreen/views/profilescreen_view.dart';
import '../modules/splashscreen/bindings/splashscreen_binding.dart';
import '../modules/splashscreen/views/splashscreen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.FROMONESCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.FROMONESCREEN,
      page: () => FromonescreenView(),
      binding: FromonescreenBinding(),
    ),
    GetPage(
      name: _Paths.FROMTWOSCREEN,
      page: () => FromtwoscreenView(),
      binding: FromtwoscreenBinding(),
    ),
    GetPage(
      name: _Paths.PROFILESCREEN,
      page: () => ProfilescreenView(),
      binding: ProfilescreenBinding(),
    ),
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => const SplashscreenView(),
      binding: SplashscreenBinding(),
    ),
  ];
}
