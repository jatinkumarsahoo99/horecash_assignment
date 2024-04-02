import 'package:get/get.dart';

import '../controllers/fromtwoscreen_controller.dart';

class FromtwoscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FromtwoscreenController>(
      () => FromtwoscreenController(),
    );
  }
}
