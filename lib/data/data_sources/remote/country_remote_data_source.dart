import 'package:arz8_task/data/api/api_service.dart';
import 'package:arz8_task/data/models/country_model.dart';

abstract class CountryRemoteDataSource {
  Future<List<CountryModel>> getAllCountriesLight();
  Future<CountryModel?> getCountryDetail(String name);
  Future<List<CountryModel>> searchCountries({String? name, String? region});
}

class CountryRemoteDataSourceImpl implements CountryRemoteDataSource {
  final ApiService apiService;

  CountryRemoteDataSourceImpl(this.apiService);

  @override
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

  @override
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

  @override
  Future<List<CountryModel>> searchCountries({String? name, String? region}) async {
    if (name != null && name.isNotEmpty) {
      final response = await apiService.get("/name/$name");
      if (response.statusCode == 200) {
        final List data = response.data;
        return data.map((e) => CountryModel.fromJson(e)).toList();
      }
    }

    if (region != null && region.isNotEmpty) {
      final response = await apiService.get("/region/$region");
      if (response.statusCode == 200) {
        final List data = response.data;
        return data.map((e) => CountryModel.fromJson(e)).toList();
      }
    }

    return [];
  }
}
