
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:nijhanand/helper/database.dart';
import 'package:nijhanand/utils/constants.dart';



class BhajanController extends GetxController {
  RxList bhajanList = RxList();
  Box box=Hive.box('Bhajans');


  static BhajanController get instance => Get.find();

  @override
  void onInit() {
    super.onInit();
    box.add(bhajanList);
    bhajanList.bindStream(FirestoreDb.bhajanStream);
    print(bhajanBox);
  }

  
}
