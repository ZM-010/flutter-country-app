import 'package:arz8_task/data/api/api_service.dart';
import 'package:arz8_task/models/country_model.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  var country = Rxn<CountryModel>();

  @override
  void onInit() {
    super.onInit();
    final arg = Get.arguments as CountryModel;
    country.value = arg;
    loadDetail(arg.name.common);
  }

  Future<void> loadDetail(String name) async {
    final detail = await ApiService().getCountryDetail(name);
    if (detail != null) {
      country.value = detail;
    }
  }
}
