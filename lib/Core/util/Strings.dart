import 'package:shared_preferences/shared_preferences.dart';

const String api_link = 'https://countries.trevorblades.com/';
String query_info({required String item}) {
  return '''
      query {
        countries(filter: { continent: { eq: "$item" } }) {
          name
          capital
          currency
          phone
        }
      }
    ''';
}
late SharedPreferences preferences;
const String no_files =
    'https://img.freepik.com/free-vector/ecological-strategy-development-natural-resources-access-ecologists-cartoon-characters_335657-3249.jpg';
