import 'package:arz8_task/data/api/api_service.dart';
import 'package:arz8_task/data/models/country_model.dart';

class CountryRepository {
  final ApiService apiService;

  CountryRepository(this.apiService);

  Future<List<CountryModel>> getAllCountriesLight() async {
    final response = await apiService.get(
      "/all",
      queryParams: {
        "fields": "name,population,region,capital,flags",
      },
    );

    if (response.statusCode == 200) {
      final List data = response.data;
      return data.map((e) => CountryModel.fromJson(e)).toList();
    }
    return [];
  }

  Future<CountryModel?> getCountryDetail(String name) async {
    final response = await apiService.get(
      "/name/$name",
      queryParams: {"fullText": "true"},
    );

    if (response.statusCode == 200) {
      final List data = response.data;
      return CountryModel.fromJson(data.first);
    }
    return null;
  }


  Future<List<CountryModel>> searchByName(String name) async {
    final response = await apiService.get("/name/$name");

    if (response.statusCode == 200) {
      final List data = response.data;
      return data.map((e) => CountryModel.fromJson(e)).toList();
    }
    return [];
  }


  Future<List<CountryModel>> getByRegion(String region) async {
    final response = await apiService.get("/region/$region");

    if (response.statusCode == 200) {
      final List data = response.data;
      return data.map((e) => CountryModel.fromJson(e)).toList();
    }
    return [];
  }
}
