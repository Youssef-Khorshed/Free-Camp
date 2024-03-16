import 'package:flutter_application_camp/Features/Home/Domain/Entity/counteyEntity.dart';

class CounteryModel extends CountryEntity {
  CounteryModel(
      {required super.name,
      required super.capital,
      required super.currency,
      required super.phone});

  factory CounteryModel.fromJson(Map<String, dynamic> json) {
    return CounteryModel(
      name: json['name'],
      capital: json['capital'] ?? '-',
      currency: json['currency'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'capital': capital,
      'currency': currency,
      'phone': phone,
    };
  }
}
