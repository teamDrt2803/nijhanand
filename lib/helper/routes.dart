import 'package:get/route_manager.dart';
import 'package:nijhanand/screens/bhajanavali.dart';
import 'package:nijhanand/screens/home.dart';
import 'package:nijhanand/screens/lyrics.dart';
import 'package:nijhanand/screens/upload.dart';

List<GetPage> get pages => [
  GetPage(name: Routes.lyrics, page: () => const Lyrics()),
  GetPage(name: Routes.upload, page: () => const Uploadpage()),
  GetPage(name: Routes.home, page:() => const Homepage()),
  GetPage(name: Routes.bhajanavali, page:() => const Bhajanvali())
];

class Routes {
  static get home => '/';
  static get lyrics => '/lyrics'; 
  static get upload => '/upload';
  static get bhajanavali=> '/bhajanvali';
}