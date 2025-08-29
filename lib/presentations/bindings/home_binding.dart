import 'package:arz8_task/data/api/api_service.dart';
import 'package:arz8_task/data/data_sources/remote/country_remote_data_source.dart';
import 'package:arz8_task/data/repositories/country_repository.dart';
import 'package:arz8_task/presentations/controllers/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiService>(() => ApiService(), fenix: true);

    Get.lazyPut<CountryRemoteDataSource>(
            () => CountryRemoteDataSourceImpl(Get.find<ApiService>()),
        fenix: true);

    Get.lazyPut<CountryRepository>(
            () => CountryRepositoryImpl(Get.find<CountryRemoteDataSource>()),
        fenix: true);

    Get.lazyPut<HomeController>(
            () => HomeController(Get.find<CountryRepository>()),
        fenix: true);
  }
}
