import 'dart:convert';

import 'package:flutter_application_camp/Core/util/exception.dart';
import 'package:flutter_application_camp/Features/Home/Data/Model/countryModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalCountries {
  Future<List<CounteryModel>> getcashedCountries({required String key});
  Future<bool> cashCountries(
      {required String key, required List<CounteryModel> value});
  Future<bool> clearCash();
}

class LocalCountriesImp extends LocalCountries {
  SharedPreferences sharedPreferences;
  LocalCountriesImp({required this.sharedPreferences});

  Future<bool> cashCountries(
      {required String key, required List<CounteryModel> value}) async {
    List<Map<String, dynamic>> val = [];
    value.forEach((element) {
      val.add(element.toJson());
    });
    final res = await sharedPreferences.setString(key, json.encode(val));
    // sharedPreferences.remove(key);
    return Future.value(res);
  }

  @override
  Future<List<CounteryModel>> getcashedCountries({required String key}) async {
    try {
      final source = await sharedPreferences.getString('key');
      // print('source is $source');
      if (source == null) {
        return Future.value([]);
      }
      List<dynamic> val = json.decode(source);
      // print('after soure $val');
      List<CounteryModel> res =
          val.map((e) => CounteryModel.fromJson(e)).toList();
      // print('after val $res');
      return Future.value(res);
    } catch (error) {
      throw CashException();
    }
  }

  @override
  Future<bool> clearCash() async {
    try {
      return await sharedPreferences.clear();
    } catch (error) {
      throw (CashException());
    }
  }
}
