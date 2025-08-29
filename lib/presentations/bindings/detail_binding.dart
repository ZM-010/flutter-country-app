import 'package:arz8_task/data/repositories/country_repository.dart';
import 'package:arz8_task/presentations/controllers/detail_controller.dart';
import 'package:get/get.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailController>(
            () => DetailController(Get.find<CountryRepository>()),
        fenix: true);
  }
}
