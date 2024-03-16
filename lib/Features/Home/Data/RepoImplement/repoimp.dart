import 'package:dartz/dartz.dart';
import 'package:flutter_application_camp/Core/util/failure.dart';
import 'package:flutter_application_camp/Features/Home/Data/DataSource/local.dart';
import 'package:flutter_application_camp/Features/Home/Data/Model/countryModel.dart';
import 'package:flutter_application_camp/Features/Home/Domain/Entity/counteyEntity.dart';
import 'package:flutter_application_camp/Features/Home/Domain/Repository/repo.dart';
import '../../../../Core/util/exception.dart';
import '../../../../Core/util/internet.dart';
import '../DataSource/remote/remote.dart';

class CountryRepoImp extends CountryRepo {
  NetworkInfo networkInfo;
  LocalCountries local;
  RemoteCountryData remote;
  CountryRepoImp(
      {required this.networkInfo, required this.local, required this.remote});
  @override
  Future<Either<Failure, List<CountryEntity>>> getdata(
      {required String query}) async {
    if (await networkInfo.isConnected()) {
      final res = await remote.getdata(item: query);
      return Right(res);
    } else {
      return Left(InternetFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> cashdata(
      {required String key, required CounteryModel value}) async {
    try {
      if (await networkInfo.isConnected()) {
        final list = await local.getcashedCountries(key: key);
        if (!isExsist(value, list)) {
          print('item is new');
          list.add(value);
          return Right(await local.cashCountries(key: key, value: list));
        } else {
          print('item is old');
          return const Right(false);
        }
      } else {
        return Left(ApiFailure());
      }
    } on CashException {
      return Left(CashFailure());
    }
  }

  @override
  Future<Either<Failure, List<CountryEntity>>> getcasheddata(
      {required String key}) async {
    try {
      if (await networkInfo.isConnected()) {
        return Right(await local.getcashedCountries(key: key));
      } else {
        return Left(ApiFailure());
      }
    } on CashException {
      return Left(CashFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> clearCash() async {
    try {
      return Right(await local.clearCash());
    } on CashException {
      return Left(CashFailure());
    }
  }

  bool isExsist<T>(T item, List<T> list) {
    return list.contains(item); // exsist true  not false
  }
}
