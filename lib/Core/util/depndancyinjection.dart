import 'package:flutter_application_camp/Features/Home/Data/DataSource/local.dart';
import 'package:flutter_application_camp/Features/Home/Data/DataSource/remote/remote.dart';
import 'package:flutter_application_camp/Features/Home/Data/RepoImplement/repoimp.dart';
import 'package:flutter_application_camp/Features/Home/Domain/Repository/repo.dart';
import 'package:flutter_application_camp/Features/Home/Domain/Usecases/cashdata.dart';
import 'package:flutter_application_camp/Features/Home/Domain/Usecases/clearCash.dart';
import 'package:flutter_application_camp/Features/Home/Domain/Usecases/getcasheddata.dart';
import 'package:flutter_application_camp/Features/Home/Domain/Usecases/getdata.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Features/Home/Presentation/Logic/providerCountry.dart';
import 'Strings.dart';
import 'internet.dart';

final db = GetIt.instance;

Future<void> init({required SharedPreferences preferences}) async {
  // //Blocs
  db.registerFactory(() => MyCountryProvider(
      cash: db(), getcash: db(), clearCashUsecase: db(), getdataUsecase: db()));

  // // UseCases
  db.registerLazySingleton(() => CashdataUsecase(repo: db()));
  db.registerLazySingleton(() => GetdataUsecase(repo: db()));
  db.registerLazySingleton(() => GetCasheddataUsecase(repo: db()));
  db.registerLazySingleton(() => ClearCashUsecase(repo: db()));

  // //Reposatory
  db.registerLazySingleton<CountryRepo>(
      () => CountryRepoImp(local: db(), networkInfo: db(), remote: db()));

  // // Network
  db.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(db()));

  // //DataSource
  db.registerLazySingleton<LocalCountries>(
      () => LocalCountriesImp(sharedPreferences: db()));
  db.registerLazySingleton<RemoteCountryData>(() => CountryDataRemoteImp());

  //intalize objects
  // preferences = await SharedPreferences.getInstance();

  // //objects
  db.registerLazySingleton(() => preferences);
  db.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker());
}
