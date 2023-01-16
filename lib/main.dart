import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nijhanand/helper/routes.dart';
import 'package:nijhanand/modals/bhajan_modal.dart';
import 'package:nijhanand/screens/bhajanavali.dart';
import 'package:nijhanand/screens/home.dart';
import 'package:nijhanand/screens/upload.dart';

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
      routes: {
        '/': (context) => const Homepage(),
        '/bhajanvali': (context) => const Bhajanvali(),
        '/upload': (context) => const Uploadpage(),
      },
      getPages: pages,
      initialBinding: InitialBinding(),
      initialRoute: Routes.home,
    );
  }
}
