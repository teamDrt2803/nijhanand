import 'dart:developer';

import 'package:get/get.dart';
import 'package:nijhanand/modals/bhajan_modal.dart';

import '../utils/constants.dart';

class BhajanController extends GetxController {
  RxList<Bhajan> bhajanList = RxList();

  static BhajanController get instance => Get.find();
  static Stream<List<Bhajan>> get bhajanStream => firebaseFirestore
      .collection('Bhajans')
      .snapshots()
      .map((event) => event.docs.map(Bhajan.fromDocumentSnapshot).toList());

  @override
  void onInit() {
    super.onInit();
    log('Initialising');
    bhajanList.bindStream(bhajanStream);
  }
}
