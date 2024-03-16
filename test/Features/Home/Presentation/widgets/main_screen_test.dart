import 'package:flutter/material.dart';
import 'package:flutter_application_camp/Features/Compass/Logic/provider.dart';
import 'package:flutter_application_camp/Features/Compass/Widgets/compass.dart';
import 'package:flutter_application_camp/Features/Home/Presentation/Logic/providerCountry.dart';
import 'package:flutter_application_camp/Features/Home/Presentation/widgets/home.dart';
import 'package:flutter_application_camp/Features/Home/Presentation/widgets/main_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_application_camp/Core/util/depndancyinjection.dart'
    as db;
import 'main_screen_test.mocks.dart';

@GenerateMocks([SharedPreferences])
void main() async {
  IntegrationTestWidgetsFlutterBinding();

  setUp(() async {
    await Future.wait([db.init(preferences: MockSharedPreferences())]);
  });

  testWidgets('main screen Test', (tester) async {
    await tester.pumpWidget(ProviderScope(
        child: MaterialApp(
      home: MainScreen(),
    )));
    expect(find.byType(PageView), findsOneWidget);
    expect(find.byType(BottomAppBar), findsOneWidget);
    expect(find.byType(Row), findsOneWidget);
  });

  // testWidgets('Home Widget Test', (tester) async {
  //   await tester.pumpWidget(
  //     Home(),
  //   );
  //   expect(find.byType(CircularProgressIndicator), findsOneWidget);
  //   await tester.pumpAndSettle();
  //   expect(find.byType(Scaffold), findsOneWidget);
  // });
}
