
import 'package:get/get.dart';

import '../controller/bhajan_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BhajanController(), permanent: true);
  }
}
