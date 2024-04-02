import 'package:get/get.dart';

import '../controllers/fromonescreen_controller.dart';

class FromonescreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FromonescreenController>(
      () => FromonescreenController(),
    );
  }
}
