import 'dart:developer';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:nijhanand/helper/database.dart';

import '../modals/bhajan_modal.dart';

class BhajanController extends GetxController {
  RxList<Bhajan> bhajanList = RxList();
  final box = Hive.box<Bhajan>('Bhajans');

  static BhajanController get instance => Get.find();

  void handleBhajanlist(List<Bhajan> bhajanList) {
    box.clear().then((value) {
      box.addAll(bhajanList);
    });
    log('handleBhajanlist: ${bhajanList.length}', name: 'BhajanController');
  }

  @override
  void onInit() {
    super.onInit();
    ever(bhajanList, handleBhajanlist);
    bhajanList.bindStream(FirestoreDb.bhajanStream);
    // box.addAll([...bhajanList.value]);
  }
}
