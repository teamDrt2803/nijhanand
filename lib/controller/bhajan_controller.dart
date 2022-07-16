import 'dart:developer';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:nijhanand/helper/database.dart';

import '../modals/bhajan_modal.dart';

class BhajanController extends GetxController {
  RxList<Bhajan> bhajanList = RxList();
  final box = Hive.box<Bhajan>('Bhajans');
  static BhajanController get instance => Get.find();

  void handleBhajanlistUpdate(List<Bhajan> bhajanList) {
    log('handleBhajanlistUpdate: ${bhajanList.map((e) => e.toString())}',
        name: 'BhajanController');
    box.clear().then((value) {
      box.addAll(bhajanList);
    });
  }

  void fetchData() {
    log('fetchData', name: 'BhajanController');
    FirestoreDb.bhajanStream.first.then(handleBhajanlistUpdate);
  }

  void handleUpdate(bool hasUpdate) {
    log('handleUpdate: $hasUpdate', name: 'BhajanController');
    if (hasUpdate) {
      fetchData();
    }
  }

  bool get hasLocalData => box.isNotEmpty;

  @override
  void onInit() {
    super.onInit();
    FirestoreDb.hasUpdateStream.listen(handleUpdate);
    log('Checking if data exists: $hasLocalData', name: 'BhajanController');
    if (!hasLocalData) {
      fetchData();
    }
  }
}
