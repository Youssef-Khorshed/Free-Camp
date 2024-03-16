import 'package:dartz/dartz.dart';
import 'package:flutter_application_camp/Core/util/failure.dart';
import 'package:flutter_application_camp/Features/Home/Data/Model/countryModel.dart';
import 'package:flutter_application_camp/Features/Home/Domain/Repository/repo.dart';

class CashdataUsecase {
  CountryRepo repo;
  CashdataUsecase({required this.repo});
  Future<Either<Failure, bool>> call(
      {required String key, required CounteryModel value}) {
    return repo.cashdata(key: key, value: value);
  }
}
