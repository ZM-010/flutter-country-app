import 'package:arz8_task/bindings/detail_binding.dart';
import 'package:arz8_task/bindings/home_binding.dart';
import 'package:arz8_task/routes/app_routes.dart';
import 'package:arz8_task/views/detail/detail_screen.dart';
import 'package:arz8_task/views/home/home_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppPages {
  static const initial = '/';

  static final routes = [
    GetPage(
      name: AppRoutes.home,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.detail,
      page: () => DetailScreen(),
      binding: DetailBinding(),
    ),
  ];
}
