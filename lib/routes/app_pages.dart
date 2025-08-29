import 'package:arz8_task/presentations/bindings/detail_binding.dart';
import 'package:arz8_task/presentations/bindings/home_binding.dart';
import 'package:arz8_task/presentations/views/detail/detail_screen.dart';
import 'package:arz8_task/presentations/views/home/home_screen.dart';
import 'package:arz8_task/routes/app_routes.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppPages {
  static const initial = AppRoutes.home;

  static final routes = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.detail,
      page: () => const DetailScreen(),
      binding: DetailBinding(),
    ),
  ];
}
