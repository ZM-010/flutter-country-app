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
      final result = await apiService.getAllCountries();
      print("Result length: ${result.length}");


      if (result.isNotEmpty) {
        print(
          "First Country: ${result.first.name.common} "
              "| Capital: ${result.first.capital.isNotEmpty ? result.first.capital.first : '-'} "
              "| Region: ${result.first.region}",
        );
      } else {
        print("API returned empty list!");
      }

      countries.assignAll(result);
      filteredCountries.assignAll(result);
      print("Filtered countries: ${filteredCountries.length}");

    } catch (e) {
      print("Load Countries Error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> search(String query) async {
    if (query.isEmpty) {
      filteredCountries.assignAll(countries);
      return;
    }
    try {
      isLoading.value = true;
      final result = await apiService.searchByName(query);
      filteredCountries.assignAll(result);
    } catch (e) {
      print('Search Error: $e');
    } finally {
      isLoading.value = false;
    }
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
