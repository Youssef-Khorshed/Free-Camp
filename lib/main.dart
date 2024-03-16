import 'package:flutter/material.dart';
import 'package:flutter_application_camp/Core/util/AlertDialog.dart';
import 'package:flutter_application_camp/Core/util/theme_cubit.dart';
import 'package:flutter_application_camp/Core/util/Theme.dart';
import 'package:flutter_application_camp/Features/Home/Presentation/widgets/main_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Core/util/depndancyinjection.dart' as db;

void main() async {
  bool internet = await intialization();
  runApp(ProviderScope(
      child: MyApp(
    internet: internet,
  )));
}

Future<bool> intialization() async {
  WidgetsFlutterBinding.ensureInitialized();

  final internet = InternetConnectionChecker().hasConnection;
  await Future.wait(
      [db.init(preferences: await SharedPreferences.getInstance() ), internet]);
 
  return internet;
}

class MyApp extends ConsumerWidget {
  final bool internet;
  MyApp({Key? key, required this.internet});
  Widget build(BuildContext context, WidgetRef ref) {
    final cubit = ref.watch(theme_cubit);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: Constants.appName,
        theme: cubit.check ? cubit.lightTheme : cubit.darkTheme,
        home: internet
            ? MainScreen()
            : message(
                message: 'No Internet Connection..Are you Sure to exit..?',
                context: context));
  }
}
