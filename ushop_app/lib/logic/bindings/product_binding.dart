import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:ushop_app/logic/controller/cart_controller.dart';
import 'package:ushop_app/logic/controller/product_controller.dart';

class ProudctBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(ProductController());
    Get.lazyPut(() => CartController());
    // Get.put(CategoryController());
  }
}
