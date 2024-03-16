import 'package:flutter/material.dart';
import 'package:flutter_application_camp/Core/util/getFailure.dart';
import 'package:flutter_application_camp/Features/Home/Domain/Usecases/cashdata.dart';
import 'package:flutter_application_camp/Features/Home/Domain/Usecases/clearCash.dart';
import 'package:flutter_application_camp/Features/Home/Domain/Usecases/getcasheddata.dart';
import 'package:flutter_application_camp/Features/Home/Domain/Usecases/getdata.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';
import '../../Data/Model/countryModel.dart';
import '../../Domain/Entity/counteyEntity.dart';
import 'package:flutter_application_camp/Core/util/depndancyinjection.dart'
    as db;

final countr_cubit = ChangeNotifierProvider<MyCountryProvider>(
    (ref) => db.db<MyCountryProvider>()..startListenting());

class MyCountryProvider extends ChangeNotifier {
  final TextEditingController searchController = TextEditingController();
  List<CountryEntity> countries = [];
  List<CountryEntity> getSaved = [];
  List<CountryEntity> filteredCountries = [];
  Timer? _debounceTimer;
  GetdataUsecase getdataUsecase;
  CashdataUsecase cash;
  GetCasheddataUsecase getcash;
  ClearCashUsecase clearCashUsecase;
  String? message;

  //home

  MyCountryProvider(
      {required this.getdataUsecase,
      required this.clearCashUsecase,
      required this.cash,
      required this.getcash});

  void startListenting() {
    countries = [];
    filteredCountries = [];
    fetchData(contenit: "AF");
    getcashedata(query: 'key');
    searchController.addListener(filterCountriesWithDebounce);
  }

  void filterCountriesWithDebounce() {
    if (_debounceTimer != null) {
      _debounceTimer!.cancel();
    }

    _debounceTimer = Timer(Duration(milliseconds: 500), () {
      filterCountries();
    });
  }

  void filterCountries() async {
    final query = searchController.text.toLowerCase();
    await fetchData(contenit: query.toUpperCase());
  }

  Future<void> fetchData({required String contenit}) async {
    // final link = HttpLink(
    //     'https://countries.trevorblades.com/'); // Replace with your GraphQL API endpoint
    // final client = GraphQLClient(link: link, cache: GraphQLCache());

    // final query = gql('''
    //   query {
    //     countries(filter: { continent: { eq: "$contenit" } }) {
    //       name
    //       capital
    //       currency
    //       phone
    //     }
    //   }
    // ''');

    // final result = await client.query(QueryOptions(document: query));
    // if (result.hasException) {
    //   print(result.exception.toString());
    // } else {
    //   final data = result.data!['countries'];
    //   countries = data.map<CountryEntity>((Map<String, dynamic> countryData) {
    //     return CounteryModel.fromJson(countryData);
    //   }).toList();

    //   getdataUsecase.call(query: contenit);
    //   filteredCountries = countries;
    //   notifyListeners();
    // }

    final value = await getdataUsecase.call(query: contenit);
    value.fold((l) {}, (result) {
      filteredCountries = countries = result;
      notifyListeners();
    });
  }

  void stopListenting() {
    searchController.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }

  Future<void> cashdata({required CounteryModel country}) async {
    final value = await cash.call(key: 'key', value: country);
    value.fold((failure) {
      message = getfailure(failure: failure);
      notifyListeners();
      message_data(getmessage: 'Item already exsists');
    }, (result) {
      message_data(
          getmessage: result ? 'Item Added To Saved' : 'Item already exsists');
    });
  }

  Future<void> getcashedata({required String query}) async {
    final value = await getcash.call(key: query);
    value.fold((l) {
      message = getfailure(failure: l);
      message_data(getmessage: message ?? 'Error happen');
    }, (result) {
      getSaved = result;
      // message_data(getmessage: 'final get cash ${getSaved.length}');
      notifyListeners();
    });
  }

  Future<void> clearCash() async {
    final value = await clearCashUsecase.call();
    value.fold((l) {}, (result) {
      print('final clear ${result}');
      notifyListeners();
    });
  }

  void message_data({required String getmessage}) {
    message = getmessage;
    notifyListeners();
    Timer(const Duration(milliseconds: 500), () {
      message = null;
      notifyListeners();
    });
  }
}
