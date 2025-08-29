import 'package:arz8_task/data/models/country_model.dart';
import 'package:arz8_task/data/models/enums/region.dart';
import 'package:arz8_task/data/repositories/country_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final CountryRepository repository;

  HomeController(this.repository);

  var countries = <CountryModel>[].obs;
  var filteredCountries = <CountryModel>[].obs;
  var isLoading = false.obs;

  var searchText = ''.obs;
  var selectedRegion = Rxn<Region>();

  @override
  void onInit() {
    super.onInit();
    loadCountries();
  }

  Future<void> loadCountries() async {
    try {
      isLoading.value = true;
      final result = await repository.getAllCountriesLight();
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

  void applyFilters() {
    var list = countries.toList();

    if (selectedRegion.value != null && selectedRegion.value != Region.Unknown) {
      list = list.where((c) =>
      c.region.toLowerCase() == selectedRegion.value!.name.toLowerCase()).toList();
    }

    if (searchText.value.isNotEmpty) {
      list = list
          .where((c) => c.name.common
          .toLowerCase()
          .contains(searchText.value.toLowerCase()))
          .toList();
    }

    filteredCountries.assignAll(list);
  }

  Future<void> searchFromApi({String? name, String? region}) async {
    try {
      isLoading.value = true;
      final result = await repository.search(name: name, region: region);
      filteredCountries.assignAll(result);
    } finally {
      isLoading.value = false;
    }
  }
}
