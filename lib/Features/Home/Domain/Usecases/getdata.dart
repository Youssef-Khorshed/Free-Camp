import 'package:dartz/dartz.dart';
import 'package:flutter_application_camp/Core/util/failure.dart';
import 'package:flutter_application_camp/Features/Home/Domain/Entity/counteyEntity.dart';
import 'package:flutter_application_camp/Features/Home/Domain/Repository/repo.dart';

class GetdataUsecase {
  CountryRepo repo;
  GetdataUsecase({required this.repo});
  Future<Either<Failure, List<CountryEntity>>> call({required String query}) {
    return repo.getdata(query: query);
  }
}
