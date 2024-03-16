import 'package:flutter_application_camp/Core/util/Strings.dart';
import 'package:flutter_application_camp/Features/Home/Data/Model/countryModel.dart';
import 'package:flutter_application_camp/Features/Home/Domain/Entity/counteyEntity.dart';
import 'package:graphql/client.dart';
import '../../../../../Core/util/exception.dart';
import 'package:http/http.dart' as http;

abstract class RemoteCountryData {
  Future<List<CountryEntity>> getdata({String item});
}

class CountryDataRemoteImp extends RemoteCountryData {
  @override
  Future<List<CountryEntity>> getdata({String item = "AF"}) async {
    checkResponse();
    final link = HttpLink(api_link);
    // Replace with your GraphQL API endpoint
    final client = GraphQLClient(link: link, cache: GraphQLCache());

    final query = gql('''
     query {
        countries(filter: { continent: { eq: "$item" } }) {
          name
          capital
          currency
          phone
        }
      }
    ''');

    final result = await client.query(QueryOptions(document: query));
    if ((result.hasException)) {
      print(result.exception.toString());
      throw ApiException();
    } else {
      final data = result.data!['countries'];
      List<CountryEntity> countries = data.map<CountryEntity>((countryData) {
        return CounteryModel.fromJson(countryData);
      }).toList();
      print(countries);
      return Future.value(countries);
    }
  }

  Future<bool> checkResponse() async {
    try {
      final response = await http.get(Uri.parse(api_link));
      if (response.statusCode != 204) {
        throw ApiException();
      }
      return Future.value(true);
    } catch (error) {
      throw ApiException();
    }
  }
}
