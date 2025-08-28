import 'package:arz8_task/models/capital_info_model.dart';
import 'package:arz8_task/models/car_model.dart';
import 'package:arz8_task/models/coat_of_arms_model.dart';
import 'package:arz8_task/models/currency_model.dart';
import 'package:arz8_task/models/demonyms_model.dart';
import 'package:arz8_task/models/flag_model.dart';
import 'package:arz8_task/models/idd_model.dart';
import 'package:arz8_task/models/maps_model.dart';
import 'package:arz8_task/models/name_model.dart';
import 'package:arz8_task/models/postal_code_model.dart';
import 'package:arz8_task/models/translation_model.dart';

class CountryModel {
  final NameModel name;
  final List<String> tld;
  final String cca2;
  final String ccn3;
  final String cca3;
  final String cioc;
  final bool independent;
  final String status;
  final bool unMember;
  final Map<String, CurrencyModel> currencies;
  final IddModel idd;
  final List<String> capital;
  final List<String> altSpellings;
  final String region;
  final String subregion;
  final Map<String, String> languages;
  final List<double> latlng;
  final bool landlocked;
  final List<String> borders;
  final double area;
  final DemonymsModel demonyms;
  final Map<String, TranslationModel> translations;
  final String flag;
  final MapsModel maps;
  final int population;
  final Map<String, double>? gini;
  final String? fifa;
  final CarModel car;
  final List<String> timezones;
  final List<String> continents;
  final FlagModel flags;
  final CoatOfArmsModel coatOfArms;
  final String startOfWeek;
  final CapitalInfoModel capitalInfo;
  final PostalCodeModel? postalCode;

  CountryModel({
    required this.name,
    required this.tld,
    required this.cca2,
    required this.ccn3,
    required this.cca3,
    required this.cioc,
    required this.independent,
    required this.status,
    required this.unMember,
    required this.currencies,
    required this.idd,
    required this.capital,
    required this.altSpellings,
    required this.region,
    required this.subregion,
    required this.languages,
    required this.latlng,
    required this.landlocked,
    required this.borders,
    required this.area,
    required this.demonyms,
    required this.translations,
    required this.flag,
    required this.maps,
    required this.population,
    this.gini,
    this.fifa,
    required this.car,
    required this.timezones,
    required this.continents,
    required this.flags,
    required this.coatOfArms,
    required this.startOfWeek,
    required this.capitalInfo,
    this.postalCode,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      name: NameModel.fromJson(json['name']),
      tld: List<String>.from(json['tld'] ?? []),
      cca2: json['cca2'] ?? '',
      ccn3: json['ccn3'] ?? '',
      cca3: json['cca3'] ?? '',
      cioc: json['cioc'] ?? '',
      independent: json['independent'] ?? false,
      status: json['status'] ?? '',
      unMember: json['unMember'] ?? false,
      currencies: (json['currencies'] as Map<String, dynamic>?)
          ?.map((k, v) => MapEntry(k, CurrencyModel.fromJson(v))) ??
          {},
      idd: IddModel.fromJson(json['idd'] ?? {}),
      capital: List<String>.from(json['capital'] ?? []),
      altSpellings: List<String>.from(json['altSpellings'] ?? []),
      region: json['region'] ?? '',
      subregion: json['subregion'] ?? '',
      languages: (json['languages'] as Map?)?.map((k, v) => MapEntry(k, v.toString())) ?? {},
      latlng: (json['latlng'] as List?)?.map((e) => (e as num).toDouble()).toList() ?? [],
      landlocked: json['landlocked'] ?? false,
      borders: List<String>.from(json['borders'] ?? []),
      area: (json['area'] ?? 0).toDouble(),
      demonyms: DemonymsModel.fromJson(json['demonyms'] ?? {}),
      translations: (json['translations'] as Map<String, dynamic>?)
          ?.map((k, v) => MapEntry(k, TranslationModel.fromJson(v))) ??
          {},
      flag: json['flag'] ?? '',
      maps: MapsModel.fromJson(json['maps'] ?? {}),
      population: json['population'] ?? 0,
      gini: (json['gini'] as Map?)?.map((k, v) => MapEntry(k, (v as num).toDouble())),
      fifa: json['fifa'],
      car: CarModel.fromJson(json['car'] ?? {}),
      timezones: List<String>.from(json['timezones'] ?? []),
      continents: List<String>.from(json['continents'] ?? []),
      flags: FlagModel.fromJson(json['flags'] ?? {}),
      coatOfArms: CoatOfArmsModel.fromJson(json['coatOfArms'] ?? {}),
      startOfWeek: json['startOfWeek'] ?? '',
      capitalInfo: CapitalInfoModel.fromJson(json['capitalInfo'] ?? {}),
      postalCode: json['postalCode'] != null ? PostalCodeModel.fromJson(json['postalCode']) : null,
    );
  }
}
