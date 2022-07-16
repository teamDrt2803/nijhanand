import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nijhanand/helper/routes.dart';
import 'package:nijhanand/modals/bhajan_modal.dart';
import 'package:nijhanand/utils/constants.dart';

import 'package:get/get.dart';

import 'helper/initial_bindings.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  Hive.registerAdapter<Bhajan>(BhajanAdapter());
  await Hive.openBox<Bhajan>('Bhajans');
  await Hive.openBox('app_config');
  await Hive.openBox('favorites');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: primaryColor),
        primaryColor: primaryColor,
      ),
      getPages: pages,
      initialBinding: InitialBinding(),
      initialRoute: Routes.home,
    );
  }
}
