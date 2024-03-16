import 'package:dartz/dartz.dart';
import 'package:flutter_application_camp/Core/util/failure.dart';
import 'package:flutter_application_camp/Features/Home/Domain/Repository/repo.dart';

class ClearCashUsecase {
  CountryRepo repo;
  ClearCashUsecase({required this.repo});
  Future<Either<Failure, bool>> call() {
    return repo.clearCash();
  }
}
