import 'package:arz8_task/data/data_sources/remote/country_remote_data_source.dart';
import 'package:arz8_task/data/models/country_model.dart';

abstract class CountryRepository {
  Future<List<CountryModel>> getAllCountriesLight();
  Future<CountryModel?> getCountryDetail(String name);
  Future<List<CountryModel>> search({String? name, String? region});
}

class CountryRepositoryImpl implements CountryRepository {
  final CountryRemoteDataSource remoteDataSource;

  CountryRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<CountryModel>> getAllCountriesLight() =>
      remoteDataSource.getAllCountriesLight();

  @override
  Future<CountryModel?> getCountryDetail(String name) =>
      remoteDataSource.getCountryDetail(name);

  @override
  Future<List<CountryModel>> search({String? name, String? region}) =>
      remoteDataSource.searchCountries(name: name, region: region);
}
