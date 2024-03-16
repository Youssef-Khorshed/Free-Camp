import 'package:equatable/equatable.dart';

class CountryEntity extends Equatable {
  final String name;
  final String capital;
  final String currency;
  final String phone;

  CountryEntity({
    required this.name,
    required this.capital,
    required this.currency,
    required this.phone,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        name,
        capital,
        currency,
        phone,
      ];
}
