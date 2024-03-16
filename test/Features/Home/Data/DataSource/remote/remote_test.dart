import 'package:flutter_application_camp/Features/Home/Data/DataSource/remote/remote.dart';
import 'package:flutter_application_camp/Features/Home/Domain/Entity/counteyEntity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'remote_test.mocks.dart';

@GenerateMocks([CountryDataRemoteImp])
void main() {
  late CountryDataRemoteImp remote;
  setUp(() {
    remote = MockCountryDataRemoteImp();
  });
  group('Response daata', () {
    test('API Exception Cehck', () async {
      List<CountryEntity> countries = [];
      when(remote.getdata()).thenAnswer((_) => Future.value(countries));
      final actual = await remote.getdata();
      expect(actual, countries);
    });
  });
}
