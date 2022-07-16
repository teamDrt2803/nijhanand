import 'dart:developer';

import 'package:get/get.dart';
import 'package:nijhanand/helper/database.dart';
import 'package:nijhanand/utils/constants.dart';

import '../modals/bhajan_modal.dart';

class BhajanController extends GetxController {
  RxList<Bhajan> bhajanList = RxList();
 
  static BhajanController get instance => Get.find();

  void handleBhajanlistUpdate(List<Bhajan> bhajanList) {
    log('handleBhajanlistUpdate: ${bhajanList.map((e) => e.toString())}',
        name: 'BhajanController');
    Boxes().bhajanBox.clear().then((value) {
      Boxes().bhajanBox.addAll(bhajanList);
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

  bool get hasLocalData => Boxes().bhajanBox.isNotEmpty;

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
