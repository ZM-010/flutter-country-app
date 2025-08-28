import 'package:arz8_task/models/country_model.dart';
import 'package:arz8_task/utils/constants.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio();

  ApiService() {
    dio.options.baseUrl = endpoint;
  }

  Future<List<CountryModel>> getAllCountries() async {
    try {
      final response = await dio.get("/all");
      if (response.statusCode == 200) {
        final List data = response.data;
        return data.map((e) => CountryModel.fromJson(e)).toList();
      } else {
        return [];
      }
    } catch (e) {
      print("API Error: $e");
      return [];
    }
  }



  Future<List<CountryModel>> searchByName(String name) async {
    try {
      final response = await dio.get("/name/$name");
      if (response.statusCode == 200) {
        final List data = response.data;
        return data.map((e) => CountryModel.fromJson(e)).toList();
      }
    } catch (e) {
      print("API Error searchByName: $e");
    }
    return [];
  }


  Future<List<CountryModel>> getByRegion(String region) async {
    try {
      final response = await dio.get("/region/$region");
      if (response.statusCode == 200) {
        final List data = response.data;
        return data.map((e) => CountryModel.fromJson(e)).toList();
      }
    } catch (e) {
      print("API Error getByRegion: $e");
    }
    return [];
  }

}
