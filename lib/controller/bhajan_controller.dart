
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:nijhanand/helper/database.dart';


class BhajanController extends GetxController {
  RxList bhajanList = RxList();
  Box bhajanBox=Hive.box('Bhajans');
  final _bhajans =[];

  static BhajanController get instance => Get.find();

  @override
  void onInit() {
    super.onInit();
    bhajanList.bindStream(FirestoreDb.bhajanStream);
    bhajanBox.add(bhajanList);
    for(int i=1;i < bhajanBox.values.length; i++){
      _bhajans.add(bhajanBox.getAt(i));
      print(_bhajans.length);
    }

    
  }

  
}
