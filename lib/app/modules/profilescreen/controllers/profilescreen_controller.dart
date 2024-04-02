import 'package:get/get.dart';

import '../../../CommonModel/ProfileDetailsModel.dart';

class ProfilescreenController extends GetxController {
  //TODO: Implement ProfilescreenController

  final count = 0.obs;
  ProfileDetailsModel ?profileDetailsModel;
  @override
  void onInit() {
    profileDetailsModel = ProfileDetailsModel.fromJson( Get.arguments);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
