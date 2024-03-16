import 'package:flutter_application_camp/Core/util/internet.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'internet_test.mocks.dart';

@GenerateMocks([InternetConnectionChecker])
void main() {
  late NetworkInfoImpl networkInfoImpl;
  late InternetConnectionChecker intenetMock;
  setUp(() {
    intenetMock = MockInternetConnectionChecker();
    networkInfoImpl = NetworkInfoImpl(intenetMock);
  });
  test('description', () async {
    when(intenetMock.hasConnection)
        .thenAnswer((realInvocation) => Future.value(false));
    final res = await networkInfoImpl.isConnected();
    expect(res, true);
  });
}
