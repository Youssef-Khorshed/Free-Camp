import 'package:flutter/material.dart';
import 'package:flutter_application_camp/Features/Home/Presentation/widgets/home.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_application_camp/Core/util/depndancyinjection.dart'
    as db;
import 'main_screen_test.mocks.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding();

  setUp(() async {
    await Future.wait([db.init(preferences: MockSharedPreferences())]);
  });

  testWidgets('Home Widget Test', (tester) async {
    await tester.pumpWidget(ProviderScope(
        child: MaterialApp(
      home: Home(),
    )));
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    await tester.pumpAndSettle();
    expect(find.byType(Scaffold), findsOneWidget);
    final list = find.byKey(Key('Home first list'));
    expect(list, findsOneWidget);
  });
}
