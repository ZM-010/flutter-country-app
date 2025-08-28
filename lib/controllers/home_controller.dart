import 'package:arz8_task/models/country_model.dart';
import 'package:arz8_task/models/enums/region.dart';
import 'package:arz8_task/data/api/api_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var countries = <CountryModel>[].obs;
  var filteredCountries = <CountryModel>[].obs;
  var selectedRegion = Region.Unknown.obs;
  var isLoading = false.obs;
  var searchText = ''.obs;

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
    searchText.value = query;
    applyFilters();
  }

  void filterByRegion(Region region) {
    selectedRegion.value = region;
    applyFilters();
  }

  void clearRegionFilter() {
    selectedRegion.value = Region.Unknown;
    applyFilters();
  }

  void applyFilters() {
    var list = countries.toList();

    if (selectedRegion.value != Region.Unknown) {
      final regionName = selectedRegion.value.toString().split('.').last.toLowerCase();
      list = list.where((c) => (c.region ?? '').toLowerCase() == regionName).toList();
    }

    final query = searchText.value.trim().toLowerCase();
    if (query.isNotEmpty) {
      list = list.where((c) {
        final name = c.name?.common?.toLowerCase() ?? '';
        return name.contains(query);
      }).toList();
    }

    filteredCountries.assignAll(list);
  }
}
