import 'package:dartz/dartz.dart';
import 'package:flutter_application_camp/Features/Home/Data/Model/countryModel.dart';
import 'package:flutter_application_camp/Features/Home/Domain/Entity/counteyEntity.dart';
import '../../../../Core/util/failure.dart';

abstract class CountryRepo {
  Future<Either<Failure, List<CountryEntity>>> getdata({required String query});
  Future<Either<Failure, List<CountryEntity>>> getcasheddata(
      {required String key});
  Future<Either<Failure, bool>> cashdata(
      {required String key, required CounteryModel value});

  Future<Either<Failure, bool>> clearCash();
}
