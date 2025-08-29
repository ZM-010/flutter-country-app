import 'package:arz8_task/controllers/home_controller.dart';
import 'package:arz8_task/data/api/api_service.dart';
import 'package:arz8_task/data/repositories/country_repository.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiService>(() => ApiService());
    Get.lazyPut<CountryRepository>(() => CountryRepository(Get.find()));
    Get.lazyPut<HomeController>(() => HomeController(Get.find()));
  }
}
