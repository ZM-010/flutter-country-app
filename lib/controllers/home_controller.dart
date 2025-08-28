import 'package:arz8_task/models/country_model.dart';
import 'package:arz8_task/models/enums/region.dart';
import 'package:arz8_task/data/api/api_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var countries = <CountryModel>[].obs;
  var filteredCountries = <CountryModel>[].obs;
  var selectedRegion = Region.Unknown.obs;
  var isLoading = false.obs;

  final ApiService apiService = ApiService();

  @override
  void onInit() {
    super.onInit();
    loadCountries();
  }

  Future<void> loadCountries() async {
    try {
      isLoading.value = true;
      final result = await apiService.getAllCountriesLight();
      countries.assignAll(result);
      filteredCountries.assignAll(result);
    } finally {
      isLoading.value = false;
    }
  }

  void search(String query) {
    if (query.isEmpty) {
      filteredCountries.assignAll(countries);
      return;
    }

    final lowerQuery = query.toLowerCase();

    final result =
        countries.where((country) {
          final name = country.name?.common?.toLowerCase() ?? '';
          return name.contains(lowerQuery);
        }).toList();

    filteredCountries.assignAll(result);
  }

  Future<void> filterByRegion(Region region) async {
    selectedRegion.value = region;
    if (region == Region.Unknown) {
      filteredCountries.assignAll(countries);
      return;
    }
    try {
      isLoading.value = true;
      final regionStr = region.toString().split('.').last.toLowerCase();
      final result = await apiService.getByRegion(regionStr);
      filteredCountries.assignAll(result);
    } catch (e) {
      print('Region Filter Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void clearRegionFilter() {
    selectedRegion.value = Region.Unknown;
    filteredCountries.assignAll(countries);
  }
}
