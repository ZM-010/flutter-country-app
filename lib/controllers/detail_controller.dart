import 'package:arz8_task/models/country_model.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  late CountryModel country;

  @override
  void onInit() {
    super.onInit();
    country = Get.arguments as CountryModel;
  }
}
