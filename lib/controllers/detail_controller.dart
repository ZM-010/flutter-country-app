import 'package:arz8_task/data/models/country_model.dart';
import 'package:arz8_task/data/repositories/country_repository.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  final CountryRepository repository;

  DetailController(this.repository);

  var country = Rxn<CountryModel>();

  @override
  void onInit() {
    super.onInit();
    final arg = Get.arguments as CountryModel;
    country.value = arg;
    loadDetail(arg.name!.common);
  }

  Future<void> loadDetail(String name) async {
    final detail = await repository.getCountryDetail(name);
    if (detail != null) {
      country.value = detail;
    }
  }
}
