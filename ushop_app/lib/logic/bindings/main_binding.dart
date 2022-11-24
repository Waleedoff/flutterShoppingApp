import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:ushop_app/logic/controller/main_controller.dart';

import '../controller/setting_controller.dart';

class MainBininding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(SettingController());
    // Get.put(PayMentController());
  }
}
