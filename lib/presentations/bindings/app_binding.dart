import 'package:arz8_task/data/repositories/country_repository.dart';
import 'package:get/get.dart';
import 'package:arz8_task/data/api/api_service.dart';
import 'package:arz8_task/data/data_sources/remote/country_remote_data_source.dart';
import 'package:arz8_task/presentations/controllers/theme_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiService>(() => ApiService(), fenix: true);

    Get.lazyPut<CountryRemoteDataSource>(
      () => CountryRemoteDataSourceImpl(Get.find<ApiService>()),
      fenix: true,
    );

    Get.lazyPut<CountryRepository>(
      () => CountryRepositoryImpl(Get.find<CountryRemoteDataSource>()),
      fenix: true,
    );

    Get.put<ThemeController>(ThemeController(), permanent: true);
  }
}
